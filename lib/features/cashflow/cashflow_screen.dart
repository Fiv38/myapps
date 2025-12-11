import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../components/add_dialog_cashflow.dart';
import '../../components/dashboard_card.dart';
import '../../components/shimmerCardList.dart';
import '../../utils/currency_format.dart';
import '../../utils/theme/global_colors.dart';
import '../../utils/theme/global_fonts.dart';
import '../../utils/toast_utils.dart';

import 'package:intl/intl.dart';

import 'bloc/cashflow_bloc.dart';

@RoutePage()
class CashFlowScreen extends StatelessWidget {
  const CashFlowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CashflowBloc>(
      create: (context) =>
      CashflowBloc()
        ..add(const CashflowEvent.started()),
      child: const CashFlowScreenView(),
    );
  }
}

class CashFlowScreenView extends StatelessWidget {
  const CashFlowScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalColors.primaryBlue,
        elevation: 10,
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: GlobalColors.white),
        title: Text(
          "Cash Flow",
          style: TextStyle(
            fontFamily: GlobalFonts.fontFamilyJakarta,
            fontWeight: FontWeight.w600,
            color: GlobalColors.white,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final bloc = context.read<CashflowBloc>();
          showDialog(
            context: context,
            useRootNavigator: false,
            builder: (_) => BlocProvider.value(
              value: bloc,                   // ← bawa instance yang sama
              child: AddCashflowDialog(context), // atau const AddCashflowDialog() kalau tidak perlu param
            ),
          );
        },
        backgroundColor: GlobalColors.primaryBlue,
        shape: const CircleBorder(),
        elevation: 15,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: BlocListener<CashflowBloc, CashflowState>(
        listener: (context, state) {
          state.maybeWhen(
            error: (message) {
              ToastUtils.showFailure(context, message: "Error: $message");
            },
            loading: () {
              return const Center(child: CircularProgressIndicator());
            },
            loaded: () {
              ToastUtils.showSuccess(context, message: "Updated!");
            },
            orElse: () {},
          );
        },
        child: BlocBuilder<CashflowBloc, CashflowState>(
          builder: (context, state) {
            // Access bloc to get data
            final bloc = context.read<CashflowBloc>();
            return Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// HEADER: Title + Total
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Total Cashflow Akhir",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: GlobalFonts.fontFamilyJakarta,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        CurrencyFormat.convertToIdr(bloc.totalClosingBalanceUpdate, 0),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          fontFamily: GlobalFonts.fontFamilyJakarta,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Total Pemasukan Cashflow Hari Ini",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: GlobalFonts.fontFamilyJakarta,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        CurrencyFormat.convertToIdr(bloc.totalPemasukanCashflowToday ?? 0, 0),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          fontFamily: GlobalFonts.fontFamilyJakarta,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Total Pengeluaran Cashflow Hari Ini",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: GlobalFonts.fontFamilyJakarta,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        CurrencyFormat.convertToIdr(bloc.totalPengeluaranCashflowToday ?? 0, 0),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          fontFamily: GlobalFonts.fontFamilyJakarta,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  /// SUB HEADER: Detail Cashflow
                  const Text(
                    "Detail Cashflow",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      fontFamily: GlobalFonts.fontFamilyJakarta,
                    ),
                  ),
                  const SizedBox(height: 12),

                  Expanded(
                    child: BlocBuilder<CashflowBloc, CashflowState>(
                      builder: (context, state) {
                        final bloc = context.read<CashflowBloc>();

                        // ✅ Show shimmer while loading
                        if (state.maybeWhen(loading: () => true,
                            orElse: () => false)) {
                          return buildCardShimmer(itemCount: 6);
                        }

                        // ✅ Show empty state
                        if (bloc.expenses.isEmpty) {
                          return const Center(
                            child: Text(
                              "Belum ada data.",
                              style: TextStyle(fontSize: 12),
                            ),
                          );
                        }

                        // ✅ Show actual data list
                        return ListView.separated(
                          itemCount: bloc.expenses.length,
                          separatorBuilder: (_, __) => const Divider(height: 1),
                          itemBuilder: (context, index) {
                            final item = bloc.expenses[index];
                            return ListTile(
                              dense: true,
                              contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                              leading: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                decoration: BoxDecoration(
                                  color: (item.categoryId == 100)
                                      ? Colors.green.shade100
                                      : Colors.red.shade100,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  (item.categoryId == 100) ? "Pemasukan" : "Pengeluaran",
                                  style: TextStyle(
                                    color: (item.categoryId == 100) ? Colors.green : Colors.red,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              title: Text(
                                item.description ?? "-",
                                style: const TextStyle(fontSize: 12),
                              ),
                              trailing: Text(
                                CurrencyFormat.convertToIdr(item.amount ?? 0, 0),
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),

                ],
              ),
            );
          },
        ),
      ),
    );
  }

  String formatToRupiah(num amount) {
    final formatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp. ',
      decimalDigits: 0,
    );
    return formatter.format(amount);
  }

}
