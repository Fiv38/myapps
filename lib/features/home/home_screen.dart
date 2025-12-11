import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

import '../../components/custom_dialog.dart';
import '../../components/dashboard_card.dart';
import '../../components/dashed_line.dart';
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
    final todayText = DateFormat('dd MMMM yyyy').format(DateTime.now());
    final size = MediaQuery.of(context).size;
    final bool isTablet = size.shortestSide >= 600; // tablet breakpoint
    final int cross = isTablet ? 4 : 3;
    final double aspect = isTablet ? 1.4 : 1.3;     // optional tweak
    final double gridHeight = isTablet ? 420 : 350; // optional tweak
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        state.maybeWhen(
          loadingTotalCount: () {},
          loadedTotalCount: () {
            ToastUtils.showSuccess(context, message: "Refreshed!");
          },
          invalid: (message, isCloseLoading) {
            if (isCloseLoading) Navigator.of(context).pop();
            ToastUtils.showFailure(context, message: message);
          },
          error: (message) {
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
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                        top: 10,
                        bottom: 10,
                      ),
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
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily:
                                            GlobalFonts.fontFamilyJakarta,
                                      ),
                                    ),
                                    Text(
                                      context.select(
                                        (HomeBloc b) => b.branchName,
                                      ),
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        fontFamily:
                                            GlobalFonts.fontFamilyJakarta,
                                      ),
                                    ),
                                    Text(
                                      context.select(
                                        (HomeBloc b) => b.userAddress,
                                      ),
                                      style: TextStyle(
                                        fontSize: 14,
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

                              final totalOrderCount = context.select(
                                (HomeBloc b) => b.totalOrderCount,
                              );
                              final totalOrderAmount = context.select(
                                (HomeBloc b) => b.totalPemasukanByOrder,
                              );
                              final totalKasHariIni = context.select(
                                (HomeBloc b) => b.totalClosingBalanceUpdate,
                              );
                              final totalExpenseHariIni = context.select(
                                (HomeBloc b) => b.totalPengeluaranCashflowToday,
                              );
                              final totalCash = context.select(
                                    (HomeBloc b) => b.totalCashByOrder,
                              );
                              final totalQris = context.select(
                                    (HomeBloc b) => b.totalQrisByOrder,
                              );
                              final totalTransfer = context.select(
                                    (HomeBloc b) => b.totalTransferByOrder,
                              );

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
                                        fontFamily:
                                            GlobalFonts.fontFamilyJakarta,
                                      ),
                                    ),
                                    const SizedBox(height: 24),
                                    // TOTAL ORDER
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Total Order Hari Ini",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            fontFamily:
                                                GlobalFonts.fontFamilyJakarta,
                                          ),
                                        ),
                                        isLoading
                                            ? _shimmerLine()
                                            : Text(
                                              '$totalOrderCount',
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                fontFamily:
                                                    GlobalFonts
                                                        .fontFamilyJakarta,
                                              ),
                                            ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    // TOTAL PEMASUKAN DARI ORDER
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Total Pemasukan dari Order",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            fontFamily:
                                                GlobalFonts.fontFamilyJakarta,
                                          ),
                                        ),
                                      ],
                                    ),
                                    // BREAKDOWN: cash, qris, transfer
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Column(
                                        children: [
                                          // CASH
                                          Padding(
                                            padding: const EdgeInsets.only(left: 20), // padding 20 untuk tiap item
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [

                                                Text(
                                                  "Cash",
                                                  style: const TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: GlobalFonts.fontFamilyJakarta,
                                                  ),
                                                ),
                                                isLoading
                                                    ? _shimmerLine(width: 80)
                                                    : Text(
                                                  CurrencyFormat.convertToIdr(
                                                    totalCash ?? 0,
                                                    0,
                                                  ),
                                                  style: const TextStyle(
                                                    fontSize: 13,
                                                    fontWeight:
                                                    FontWeight.w600,
                                                    fontFamily:
                                                    GlobalFonts
                                                        .fontFamilyJakarta,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),

                                          const SizedBox(height: 6),

                                          Padding(
                                            padding: const EdgeInsets.only(left: 20), // padding 20 untuk tiap item
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  "Qris",
                                                  style: const TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: GlobalFonts.fontFamilyJakarta,
                                                  ),
                                                ),
                                                isLoading
                                                    ? _shimmerLine(width: 80)
                                                    : Text(
                                                  CurrencyFormat.convertToIdr(
                                                    totalQris ?? 0,
                                                    0,
                                                  ),
                                                  style: const TextStyle(
                                                    fontSize: 13,
                                                    fontWeight:
                                                    FontWeight.w600,
                                                    fontFamily:
                                                    GlobalFonts
                                                        .fontFamilyJakarta,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),

                                          const SizedBox(height: 6),

                                          // TRANSFER
                                          Padding(
                                            padding: const EdgeInsets.only(left: 20), // padding 20 untuk tiap item
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  "Transfer",
                                                  style: const TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: GlobalFonts.fontFamilyJakarta,
                                                  ),
                                                ),
                                                isLoading
                                                    ? _shimmerLine(width: 80)
                                                    : Text(
                                                  CurrencyFormat.convertToIdr(
                                                    totalTransfer ?? 0,
                                                    0,
                                                  ),
                                                  style: const TextStyle(
                                                    fontSize: 13,
                                                    fontWeight:
                                                    FontWeight.w600,
                                                    fontFamily:
                                                    GlobalFonts
                                                        .fontFamilyJakarta,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    const Divider(),
                                    const SizedBox(height: 8),
                                    // TOTAL KAS
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Total Kas",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            fontFamily:
                                                GlobalFonts.fontFamilyJakarta,
                                          ),
                                        ),
                                        isLoading
                                            ? _shimmerLine()
                                            : Text(
                                              CurrencyFormat.convertToIdr(
                                                totalKasHariIni,
                                                0,
                                              ),
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                fontFamily:
                                                    GlobalFonts
                                                        .fontFamilyJakarta,
                                              ),
                                            ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    // TOTAL PENGELUARAN
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Total Pengeluaran Hari Ini",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            fontFamily:
                                                GlobalFonts.fontFamilyJakarta,
                                          ),
                                        ),
                                        isLoading
                                            ? _shimmerLine()
                                            : Text(
                                              CurrencyFormat.convertToIdr(
                                                totalExpenseHariIni,
                                                0,
                                              ),
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                fontFamily:
                                                    GlobalFonts
                                                        .fontFamilyJakarta,
                                              ),
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
                  height: gridHeight,
                    child: GridView.count(
                      crossAxisCount: cross,
                      mainAxisSpacing: 7,
                      crossAxisSpacing: 7,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      childAspectRatio: aspect,
                      children: [
                        DashboardCard(
                          icon: Icons.point_of_sale,
                          label: "POS",
                          onTap: () => context.router.push(const PosRoute()),
                        ),
                        DashboardCard(
                          icon: Icons.hourglass_top,
                          label: "On Going",
                          onTap: () => context.router.push(const OngoingRoute()),
                        ),
                        DashboardCard(
                          icon: Icons.manage_history,
                          label: "Cashflow",
                          onTap: () => context.router.push(const CashFlowRoute()),
                        ),
                        DashboardCard(
                          icon: Icons.people_alt_outlined,
                          label: "List Customer",
                          onTap: () => context.router.push(const CustomerRoute()),
                        ),
                        DashboardCard(
                          icon: Icons.receipt_long,
                          label: "Reports",
                          onTap: () => context.router.push(const ReportRoute()),
                        ),
                      ],
                    ),
                  ),
                ),
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
    double width = 80,
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
