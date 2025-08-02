import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/dashboard_card.dart';
import '../../utils/theme/global_colors.dart';
import '../../utils/theme/global_fonts.dart';
import '../../utils/toast_utils.dart';

import 'bloc/cashflow_bloc.dart';

@RoutePage()
class CashFlowScreen extends StatelessWidget {
  const CashFlowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CashflowBloc>(
      create: (context) => CashflowBloc()..add(const CashflowEvent.started()),
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
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: GlobalColors.mainTextBlack),
        title: Text(
          "Cash Flow",
          style: TextStyle(
            fontFamily: GlobalFonts.fontFamilyJakarta,
            fontWeight: FontWeight.w600,
            color: GlobalColors.mainTextBlack,
          ),
        ),
      ),
      body: BlocListener<CashflowBloc, CashflowState>(
        listener: (context, state) {
          state.maybeWhen(
            error: (message) {
              ToastUtils.showFailure(context, message: "Error: $message");
            },
            orElse: () {},
          );
        },
        child: BlocBuilder<CashflowBloc, CashflowState>(
          builder: (context, state) {
            if (state is _Loading) {
              return const Center(child: CircularProgressIndicator());
            }
            // Access bloc to get data
            final bloc = context.read<CashflowBloc>();
            return Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/maxclean/backgroundd.png'),
                  fit: BoxFit.fill,
                  alignment: Alignment.topCenter,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Detail Pengeluaran",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: GlobalFonts.fontFamilyJakarta,
                            fontSize: 14,
                          ),
                        ),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: GlobalColors.primaryBlue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 6),
                              ),
                              child: const Text("Add"),
                            ),
                            const SizedBox(width: 8),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: GlobalColors.primaryBlue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 6),
                              ),
                              child: const Text("View"),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    // Expanded(
                    //   child: ListView.builder(
                    //     itemCount: bloc.cashFlowModel.length,
                    //     itemBuilder: (context, index) {
                    //       final item = bloc.cashFlowModel[index];
                    //       return ListTile(
                    //         dense: true,
                    //         contentPadding: const EdgeInsets.symmetric(
                    //             horizontal: 8, vertical: 0),
                    //         title: Text(
                    //           item.description ?? '-',
                    //           style: const TextStyle(fontSize: 12),
                    //         ),
                    //         subtitle: Text(
                    //           item.categoryId?.toString() ?? '-',
                    //           style: const TextStyle(
                    //               fontSize: 11, color: Colors.grey),
                    //         ),
                    //         trailing: Text(
                    //           "Rp${item.amount.toStringAsFixed(2)}",
                    //           style: const TextStyle(
                    //               fontSize: 12, fontWeight: FontWeight.bold),
                    //         ),
                    //       );
                    //     },
                    //   ),
                    // ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
