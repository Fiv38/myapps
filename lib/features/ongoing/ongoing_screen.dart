import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../components/loading_dialog.dart';
import '../../utils/theme/global_colors.dart';
import '../../utils/theme/global_fonts.dart';
import '../../utils/toast_utils.dart';
import 'bloc/ongoing_bloc.dart';

@RoutePage()
class OngoingScreen extends StatelessWidget {
  const OngoingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OngoingBloc()..add(const OngoingEvent.started()),
      child: const OngoingScreenView(),
    );
  }
}

class OngoingScreenView extends StatelessWidget {
  const OngoingScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: const IconThemeData(color: GlobalColors.mainTextBlack),
          title: Text(
            'On-Going Screen',
            style: TextStyle(
              fontFamily: GlobalFonts.fontFamilyJakarta,
              fontWeight: FontWeight.w600,
              color: GlobalColors.mainTextBlack,
            ),
          ),
          bottom: const TabBar(
            labelPadding: EdgeInsets.symmetric(horizontal: 5),
            indicatorColor: GlobalColors.primaryBlue,
            labelColor: GlobalColors.primaryBlue,
            unselectedLabelColor: Colors.black54,
            tabs: [
              Tab(text: 'Antrian'),
              Tab(text: 'On-Going'),
              Tab(text: 'Done'),
              Tab(text: 'Completed'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            _StatusTab(status: 'OS001'),
            _StatusTab(status: 'OS002'),
            _StatusTab(status: 'OS003'),
            _StatusTab(status: 'OS004'),
          ],
        ),
      ),
    );
  }
}

class _StatusTab extends StatelessWidget {
  final String status;
  const _StatusTab({required this.status});
  // Compute next status based on current
  String _nextStatus(String current) {
    const map = {
      'OS001': 'OS002',
      'OS002': 'OS003',
      'OS003': 'OS004',
    };
    return map[current] ?? current;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OngoingBloc, OngoingState>(
      listener: (context, state) {
        state.maybeWhen(
          loading: () {
            // loadingDialog(context, isHideAfterSeconds: false);
          },
          error: (msg) {
            Navigator.of(context).pop();
            ToastUtils.showFailure(context, message: msg);
          },
          changeStatus: () {
            Navigator.of(context).pop();
            ToastUtils.showSuccess(context, message: "Updated!");
          },
          loaded: () {
            ToastUtils.showSuccess(context, message: "Updated!");
          },
          orElse: () {},
        );
      },
      child: Builder(
        builder: (context) {
          // Reactively rebuild when myOrders changes without inspecting state
          final allOrders = context.select((OngoingBloc bloc) => bloc.myOrders);

          // Display shimmer if still loading (empty list)
          if (allOrders.isEmpty) {
            return _buildShimmer();
          }

          // Filter and display
          final filtered = allOrders.where((o) => o.orderStatusId == status).toList();
          if (filtered.isEmpty) {
            return const Center(child: Text('Belum ada data'));
          }
          return AnimationLimiter(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: filtered.length,
              itemBuilder: (ctx, idx) {
                final order = filtered[idx];
                final next = _nextStatus(order.orderStatusId);
                final isLast = order.orderStatusId == next;
                return Slidable(
                  key: ValueKey(order.orderId),
                  startActionPane: isLast
                      ? null
                      : ActionPane(
                    motion: const DrawerMotion(),
                    dismissible: DismissiblePane(
                      onDismissed: () => _updateStatus(context, order.orderId, next),
                    ),
                    children: [
                      SlidableAction(
                        onPressed: (_) => _updateStatus(context, order.orderId, next),
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        icon: Icons.autorenew,
                        label: 'Next',
                      ),
                    ],
                  ),
                  endActionPane: ActionPane(
                    motion: const DrawerMotion(),
                    dismissible: DismissiblePane(
                      onDismissed: () => _cancelOrder(context, order.orderId, next),
                    ),
                    children: [
                      SlidableAction(
                        onPressed: (_) => _cancelOrder(context, order.orderId, next),
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        icon: Icons.cancel,
                        label: 'Cancel',
                      ),
                    ],
                  ),
                  child: AnimationConfiguration.staggeredList(
                    position: idx,
                    delay: const Duration(milliseconds: 200),
                    child: SlideAnimation(
                      verticalOffset: -50.0,
                      child: FadeInAnimation(
                        child: Card(
                          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                          child: ListTile(
                            title: Text(order.orderCustUsername),
                            subtitle: Text('${order.orderId} • ${order.orderStatusName ?? status}'),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildShimmer() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: 10,
      itemBuilder: (_, __) => Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 16, width: 150, color: Colors.white),
                const SizedBox(height: 8),
                Container(height: 14, width: 100, color: Colors.white),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _updateStatus(BuildContext ctx, String orderIds, String newStatus) {
    ctx.read<OngoingBloc>().add(OngoingEvent.editOrder(orderId: orderIds, newStatus: newStatus));
  }

  void _cancelOrder(BuildContext ctx, String orderIds, String newStatus) {
    ctx.read<OngoingBloc>().add(OngoingEvent.cancelOrder(orderId: orderIds, newStatus: newStatus));
  }
}
