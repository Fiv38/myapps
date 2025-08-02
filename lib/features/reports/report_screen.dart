import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../models/orders.dart';
import '../../utils/theme/global_colors.dart';
import '../../utils/theme/global_fonts.dart';
import '../../utils/toast_utils.dart';
import 'bloc/report_bloc.dart';

@RoutePage()
class ReportScreen extends StatelessWidget {
  const ReportScreen({Key? key}) : super(key: key);

  static const tabs = ['Daily', 'Weekly', 'Monthly', 'Yearly'];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ReportBloc()..add(const ReportEvent.started()),
      child: const ReportScreenView(),
    );
  }
}

class ReportScreenView extends StatefulWidget {
  const ReportScreenView({Key? key}) : super(key: key);

  @override
  State<ReportScreenView> createState() => _ReportScreenViewState();
}

class _ReportScreenViewState extends State<ReportScreenView>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: ReportScreen.tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: GlobalColors.primaryBlue,
          shadowColor: Colors.black,
          elevation: 10,
          automaticallyImplyLeading: true,
          title: Text(
            'Reports',
            style: TextStyle(
              fontFamily: GlobalFonts.fontFamilyJakarta,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        body: BottomBar(
          clip: Clip.none,
          fit: StackFit.loose,
          // 2) floating bar styling
          barColor: Colors.transparent,         // container provides the white
          borderRadius: BorderRadius.circular(500),
          width: MediaQuery.of(context).size.width * 0.92,
          offset: 25,                           // lift it off the bottom
          barAlignment: Alignment.bottomCenter,
          hideOnScroll: true,
          respectSafeArea: true,
          curve: Curves.bounceInOut,

          // 3) the pages below
          body: (context, scrollController) {
            return TabBarView(
              controller: _tabController,
              children: ReportScreen.tabs
                  .map((filter) => _ReportTabPage(filter: filter))
                  .toList(),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(500),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 35,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
            child: TabBar(
              controller: _tabController,
              labelColor: GlobalColors.primaryBlue,
              unselectedLabelColor: Colors.black54,

              tabs: ReportScreen.tabs.map((filter) {
                IconData icon;
                switch (filter) {
                  case 'Daily':
                    icon = Icons.calendar_today;
                    break;
                  case 'Weekly':
                    icon = Icons.date_range;
                    break;
                  case 'Monthly':
                    icon = Icons.calendar_view_month;
                    break;
                  case 'Yearly':
                    icon = Icons.calendar_view_week;
                    break;
                  default:
                    icon = Icons.help_outline;
                }
                return Tab(text: filter, icon: Icon(icon));
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class _ReportTabPage extends StatelessWidget {
  final String filter;
  const _ReportTabPage({required this.filter});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReportBloc, ReportState>(
      listener: (context, state) {
        state.maybeWhen(
          loading: () {
            // shimmer will show automatically if historyOrders is empty
          },
          loaded: () {
            // nothing extra
          },
          error: (msg) {
            ToastUtils.showFailure(context, message: msg);
          },
          orElse: () {},
        );
      },
      child: Builder(
        builder: (context) {
          final allReports =
          context.select((ReportBloc bloc) => bloc.historyOrders);

          if (allReports.isEmpty) {
            return _buildShimmer();
          }

          final reports = _applyFilter(allReports, filter);
          if (reports.isEmpty) {
            return Center(
              child: Text(
                'No data $filter',
                style: TextStyle(
                  color: GlobalColors.mainTextBlack,
                  fontFamily: GlobalFonts.fontFamilyJakarta,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top-left header
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 16.0),
                child: Text(
                  'List Transaction $filter',
                  style: TextStyle(
                    color: GlobalColors.mainTextBlack,
                    fontFamily: GlobalFonts.fontFamilyJakarta,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // The animated list below
              Expanded(
                child: AnimationLimiter(
                  child: ListView.builder(
                    itemCount: reports.length,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    itemBuilder: (ctx, idx) {
                      final report = reports[idx];
                      return AnimationConfiguration.staggeredList(
                        position: idx,
                        duration: const Duration(milliseconds: 300),
                        child: SlideAnimation(
                          verticalOffset: -50,
                          child: FadeInAnimation(
                            child: Card(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 6),
                              child: ListTile(
                                title: Text(report.orderId),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  List<Order> _applyFilter(List<Order> list, String filter) {
    final now = DateTime.now();
    switch (filter) {
      case 'Daily':
        return list
            .where((r) => _isSameDay(r.orderTglMasuk, now))
            .toList();
      case 'Weekly':
        return list
            .where((r) => _isSameWeek(r.orderTglMasuk, now))
            .toList();
      case 'Monthly':
        return list
            .where((r) =>
        r.orderTglMasuk.month == now.month &&
            r.orderTglMasuk.year == now.year)
            .toList();
      case 'Yearly':
      default:
        return list;
    }
  }

  bool _isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  bool _isSameWeek(DateTime a, DateTime b) {
    final start = b.subtract(Duration(days: b.weekday - 1));
    final end = start.add(const Duration(days: 7));
    return a.isAfter(start.subtract(const Duration(seconds: 1))) &&
        a.isBefore(end);
  }

  Widget _buildShimmer() {
    return ListView.builder(
      itemCount: 12,
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemBuilder: (_, __) => Card(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 16, width: 120, color: Colors.white),
                const SizedBox(height: 8),
                Container(height: 14, width: 80, color: Colors.white),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
