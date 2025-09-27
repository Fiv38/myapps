import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

import '../../components/custom_dialog.dart';
import '../../components/custom_elevated_button.dart';
import '../../components/dashboard_card.dart';
import '../../routes/app_router.gr.dart';
import '../../utils/double_back_exit.dart';
import '../../utils/theme/global_colors.dart';
import '../../utils/theme/global_fonts.dart';
import '../../utils/currency_format.dart';

import 'bloc/home_bloc.dart';
import '../../utils/toast_utils.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (_) => HomeBloc()..add(const HomeEvent.started()),
      child: const HomeScreenView(),
    );
  }
}

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  Future<void> _onPullRefresh(BuildContext context) async {
    context.read<HomeBloc>().add(const HomeEvent.getTotalCount());
    await Future.delayed(const Duration(milliseconds: 300));
  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final todayText = DateFormat('dd MMMM yyyy').format(DateTime.now());

    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        state.maybeWhen(
          loadingTotalCount: () {},
          loadedTotalCount: () {
            // Navigator.of(context).pop();
            ToastUtils.showSuccess(context, message: "Refreshed!");
          },
          invalid: (message, isCloseLoading) {
            if (isCloseLoading) Navigator.of(context).pop();
            ToastUtils.showFailure(context, message: message);
          },
          error: (message) {
            // Navigator.of(context).pop();
            ToastUtils.showFailure(context, message: "Error");
          },
          orElse: () {},
        );
      },
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: () => _onPullRefresh(context),
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: SafeArea(
                  child: DoubleBackExit(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage(
                                  'assets/maxclean/appstore.png',
                                ),
                              ),
                              const SizedBox(width: 15),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 4),
                                    Text(
                                      context.select(
                                        (HomeBloc b) => b.userName,
                                      ),
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: GlobalFonts.fontFamilyJakarta,
                                      ),
                                    ),
                                    Text(
                                      context.select(
                                        (HomeBloc b) => b.branchName,
                                      ),
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        fontFamily:
                                            GlobalFonts.fontFamilyJakarta,
                                      ),
                                    ),
                                    Text(
                                      context.select(
                                        (HomeBloc b) => b.branchAddress,
                                      ),
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black54,
                                        fontFamily:
                                            GlobalFonts.fontFamilyJakarta,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 12),
                              Row(
                                children: [
                                  IconButton(
                                    tooltip: 'Logout',
                                    icon: SizedBox(
                                      width: 40,
                                      height: 40,
                                      child: RepaintBoundary(
                                        child: Lottie.asset(
                                          'assets/maxclean/logout-lottie.json',
                                          repeat: true,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    onPressed:
                                        () => _showLogoutConfirmationDialog(
                                      context,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Divider(thickness: 0.5),
                          BlocBuilder<HomeBloc, HomeState>(
                            builder: (context, state) {
                              final isLoading = state.maybeWhen(
                                loadingTotalCount: () => true,
                                orElse: () => false,
                              );

                              final totalOrderCount = context.select((HomeBloc b) => b.totalOrderCount);
                              final totalOrderAmount = context.select((HomeBloc b) => b.totalPemasukanByOrder);
                              final totalKasHariIni = context.select((HomeBloc b) => b.totalKasHariIni);
                              final totalExpenseHariIni = context.select((HomeBloc b) => b.totalExpenseHariIni);

                              return Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 15,
                                      offset: Offset(0, 10),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      todayText,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: GlobalColors.mainTextBlack,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: GlobalFonts.fontFamilyJakarta,
                                      ),
                                    ),
                                    // Row(
                                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    //   children: [
                                    //     Text(
                                    //       "Periode",
                                    //       style: TextStyle(
                                    //         fontSize: 14,
                                    //         fontWeight: FontWeight.bold,
                                    //         fontFamily: GlobalFonts.fontFamilyJakarta,
                                    //       ),
                                    //     ),
                                    //     BlocBuilder<HomeBloc, HomeState>(
                                    //       builder: (context, state) {
                                    //         final filter = context.select((HomeBloc b) => b.currentFilter);
                                    //         return DropdownButton<DateFilterOption>(
                                    //           value: filter,
                                    //           underline: SizedBox(),
                                    //           items: const [
                                    //             DropdownMenuItem(
                                    //               value: DateFilterOption.today,
                                    //               child: Text("Hari Ini"),
                                    //             ),
                                    //             DropdownMenuItem(
                                    //               value: DateFilterOption.thisWeek,
                                    //               child: Text("Minggu Ini"),
                                    //             ),
                                    //             DropdownMenuItem(
                                    //               value: DateFilterOption.thisMonth,
                                    //               child: Text("Bulan Ini"),
                                    //             ),
                                    //           ],
                                    //           onChanged: (value) {
                                    //             if (value != null) {
                                    //               context.read<HomeBloc>().add(HomeEvent.changeFilter(value));
                                    //             }
                                    //           },
                                    //         );
                                    //       },
                                    //     ),
                                    //   ],
                                    // ),
                                    const SizedBox(height: 24),
                                    // TOTAL ORDER
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Total Order Hari Ini",
                                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, fontFamily: GlobalFonts.fontFamilyJakarta),
                                        ),
                                        isLoading
                                            ? _shimmerLine(width: 100)
                                            : Text(
                                          '$totalOrderCount',
                                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, fontFamily: GlobalFonts.fontFamilyJakarta),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    // TOTAL PEMASUKAN DARI ORDER
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Total Pemasukan dari Order",
                                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, fontFamily: GlobalFonts.fontFamilyJakarta),
                                        ),
                                        isLoading
                                            ? _shimmerLine(width: 100)
                                            : Text(
                                          CurrencyFormat.convertToIdr(totalOrderAmount, 0),
                                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, fontFamily: GlobalFonts.fontFamilyJakarta),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    // TOTAL KAS
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Total Kas Hari Ini",
                                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, fontFamily: GlobalFonts.fontFamilyJakarta),
                                        ),
                                        isLoading
                                            ? _shimmerLine(width: 100)
                                            : Text(
                                          CurrencyFormat.convertToIdr(totalKasHariIni, 0),
                                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, fontFamily: GlobalFonts.fontFamilyJakarta),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    // TOTAL PENGELUARAN
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Total Pengeluaran Hari Ini",
                                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, fontFamily: GlobalFonts.fontFamilyJakarta),
                                        ),
                                        isLoading
                                            ? _shimmerLine(width: 100)
                                            : Text(
                                          CurrencyFormat.convertToIdr(totalExpenseHariIni, 0),
                                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, fontFamily: GlobalFonts.fontFamilyJakarta),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                  ],
                                ),
                              );
                            },
                          ),
                          const Divider(thickness: 0.5),
                          Center(
                            child: SizedBox(
                              height: size.height * 0.3,
                              child: GridView.count(
                                crossAxisCount: 3,
                                mainAxisSpacing: 8,
                                crossAxisSpacing: 8,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                childAspectRatio: 1.2,
                                children: [
                                  DashboardCard(
                                    icon: Icons.point_of_sale,
                                    label: "POS",
                                    onTap:
                                        () => context.router.push(
                                          const PosRoute(),
                                        ),
                                  ),
                                  DashboardCard(
                                    icon: Icons.hourglass_top,
                                    label: "On Going",
                                    onTap:
                                        () => context.router.push(
                                          const OngoingRoute(),
                                        ),
                                  ),
                                  DashboardCard(
                                    icon: Icons.manage_history,
                                    label: "Cashflow",
                                    onTap:
                                        () => context.router.push(
                                          const CashFlowRoute(),
                                        ),
                                  ),
                                  DashboardCard(
                                    icon: Icons.people_alt_outlined,
                                    label: "List Customer",
                                    onTap:
                                        () => context.router.push(
                                          const CustomerRoute(),
                                        ),
                                  ),
                                  DashboardCard(
                                    icon: Icons.receipt_long,
                                    label: "Reports",
                                    onTap:
                                        () => context.router.push(
                                          const ReportRoute(),
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Divider(thickness: 0.5),
                          const SizedBox(height: 8),
                          const Spacer(), // <-- Pushes footer to the bottom
                          Center(
                            child: Text(
                              '© 2025 MaxClean App',
                              style: TextStyle(
                                fontSize: 12,
                                color: GlobalColors.mainTextBlack,
                                fontFamily: GlobalFonts.fontFamilyJakarta,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (_) => CustomInformationDialog(
            dialogType: 1,
            confirmMessage: "Logout Confirmation",
            message: "Are you sure you want to logout?",
            customText: "Logout",
            showTwoButtons: true,
            onConfirmed: () async {
              final prefs = await SharedPreferences.getInstance();
              await prefs.clear();
              await Future.delayed(const Duration(milliseconds: 800));
              if (context.mounted) {
                Navigator.pop(context);
                context.router.replace(const LoginRoute());
              }
            },
          ),
    );
  }

  Widget _buildQuickAction(IconData icon, String label, int count) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.topRight,
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: GlobalColors.info,
              child: Icon(icon, color: GlobalColors.white),
            ),
            if (count > 0)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '$count',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    fontFamily: GlobalFonts.fontFamilyJakarta,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            fontFamily: GlobalFonts.fontFamilyJakarta,
          ),
        ),
      ],
    );
  }

  Widget _shimmerLine({
    double width = 120,
    double height = 18,
    BorderRadius? radius,
  }) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: radius ?? BorderRadius.circular(4),
        ),
      ),
    );
  }

}
