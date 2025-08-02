import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

import '../../components/custom_elevated_button.dart';
import '../../components/custom_textfield.dart';
import '../../components/loading_dialog.dart';
import '../../components/service_card.dart';
import '../../models/laundry_types.dart';
import '../../services/connection_service.dart';
import '../../services/print_service.dart';
import '../../utils/currency_format.dart';
import '../../utils/double_back_exit.dart';
import '../../utils/theme/global_colors.dart';
import '../../utils/theme/global_fonts.dart';
import '../../utils/toast_utils.dart';
import 'bloc/pos_bloc.dart';

@RoutePage()
class PosScreen extends StatelessWidget {
  const PosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PosBloc>(
      create: (context) => PosBloc()..add(const PosEvent.started()),
      child: const PosScreenView(),
    );
  }
}

class PosScreenView extends StatelessWidget {
  const PosScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<PosBloc>();

    return DoubleBackExit(
      message: "Transaction will be gone!",
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: GlobalColors.primaryBlue,
          elevation: 10,
          shadowColor: Colors.black,
          automaticallyImplyLeading: true,
          iconTheme: const IconThemeData(color: GlobalColors.white),
          title: const Text(
            "Point Of Sales",
            style: TextStyle(
              fontFamily: GlobalFonts.fontFamilyJakarta,
              fontWeight: FontWeight.w600,
              color: GlobalColors.white,
            ),
          ),
        ),
        floatingActionButtonLocation: ExpandableFab.location,
        floatingActionButton: _buildExpandableFab(context, bloc),
        body: BlocListener<PosBloc, PosState>(
          listener: (context, state) {
            state.maybeWhen(
              loaded: () async {
                await Future.delayed(const Duration(milliseconds: 250));
              },
              error: () async {
                await Future.delayed(const Duration(milliseconds: 500));
                ToastUtils.showFailure(
                  context,
                  message: "Cart already exists!",
                );
                Navigator.pop(context);
              },
              addedCart: () async {
                await Future.delayed(const Duration(milliseconds: 500));
                ToastUtils.showSuccess(context, message: "Added Cart!");
              },
              addedService: () {
                ToastUtils.showInfo(context, message: "Saving…");
              },
              finish: () async {
                await Future.delayed(const Duration(milliseconds: 500));
                ToastUtils.showSuccess(context, message: "Succeed Cart!");
                Navigator.pop(context);
              },
              done: () async {
                ToastUtils.showSuccess(context, message: "Payment Added!");
              },
              loadingSaveToDB: () {
                loadingDialog(context, isHideAfterSeconds: false);
              },
              finishSaveToDB: () async {
                await Future.delayed(const Duration(milliseconds: 1500));
                ToastUtils.showSuccess(
                  context,
                  message: "Succeed Submit Services!",
                );
                Navigator.pop(context);
                Navigator.pop(context);
              },
              updated: (msg) async {
                await Future.delayed(const Duration(milliseconds: 500));
                ToastUtils.showFailure(context, message: msg);
                Navigator.pop(context);
              },
              orElse: () {},
            );
          },
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 25,
                bottom: 85,
              ),
              child: BlocBuilder<PosBloc, PosState>(
                builder: (context, state) {
                  final isLoading = state.maybeWhen(
                    loading: () => true,
                    orElse: () => false,
                  );
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder:
                        (child, animation) =>
                            FadeTransition(opacity: animation, child: child),
                    child:
                        isLoading
                            ? _buildPosLoadingShimmer(context)
                            : SingleChildScrollView(
                              key: const ValueKey('mainContent'),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Cart Order ID:',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          fontFamily:
                                              GlobalFonts.fontFamilyJakarta,
                                        ),
                                      ),
                                      Text(
                                        bloc.orderIds,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          fontFamily:
                                              GlobalFonts.fontFamilyJakarta,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 6),
                                  const Divider(),
                                  const SizedBox(height: 6),
                                  CustomTextField(
                                    title: 'Nama Customer',
                                    controller: bloc.userCustomerNameTEC,
                                    maxLength: 30,
                                    isRequired: true,
                                    hintText: 'e.g. Budi Santoso',
                                    prefixIcon: const Icon(Icons.person),
                                    textInputAction: TextInputAction.done,
                                  ),
                                  CustomTextField(
                                    title: 'No. HP',
                                    controller: bloc.userCustomerPhoneTEC,
                                    hintText: 'e.g. 0812xxxxxxx',
                                    maxLength: 16,
                                    isRequired: true,
                                    keyboardType: TextInputType.phone,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                    prefixIcon: const Icon(Icons.phone),
                                    textInputAction: TextInputAction.done,
                                  ),
                                  CustomTextField(
                                    title: 'Alamat',
                                    maxLength: 200,
                                    controller: bloc.userCustomerAlamatTEC,
                                    hintText: 'e.g. Jalan Pepaya 2...',
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.done,
                                    prefixIcon: const Icon(Icons.home),
                                  ),
                                  const SizedBox(height: 12),
                                  const Divider(),
                                  const SizedBox(height: 12),
                                  const Text(
                                    'List Service :',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: GlobalFonts.fontFamilyJakarta,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  SizedBox(
                                    height: 350,
                                    child: ListView.separated(
                                      itemCount:
                                          bloc.cartOrder.cartDetails.length,
                                      separatorBuilder:
                                          (_, __) => const SizedBox(height: 8),
                                      itemBuilder: (context, index) {
                                        final detail =
                                            bloc.cartOrder.cartDetails[index];
                                        return Dismissible(
                                          key: ValueKey(detail.id),
                                          direction:
                                              DismissDirection.endToStart,
                                          background: Container(
                                            alignment: Alignment.centerRight,
                                            padding: const EdgeInsets.only(
                                              right: 20,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.red.shade700,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: const Icon(
                                              Icons.delete,
                                              color: Colors.white,
                                            ),
                                          ),
                                          confirmDismiss: (_) async {
                                            // optional: show a confirmation dialog
                                            return await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (_) => AlertDialog(
                                                        title: const Text(
                                                          'Remove service?',
                                                        ),
                                                        content: const Text(
                                                          'Are you sure you want to remove this item from the cart?',
                                                        ),
                                                        actions: [
                                                          TextButton(
                                                            onPressed:
                                                                () =>
                                                                    Navigator.pop(
                                                                      context,
                                                                      false,
                                                                    ),
                                                            child: const Text(
                                                              'Cancel',
                                                            ),
                                                          ),
                                                          ElevatedButton(
                                                            style:
                                                                ElevatedButton.styleFrom(
                                                                  backgroundColor:
                                                                      Colors
                                                                          .red,
                                                                ),
                                                            onPressed:
                                                                () =>
                                                                    Navigator.pop(
                                                                      context,
                                                                      true,
                                                                    ),
                                                            child: const Text(
                                                              'Remove',
                                                              style: TextStyle(
                                                                color:
                                                                    Colors
                                                                        .white,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                ) ??
                                                false;
                                          },
                                          onDismissed: (_) {
                                            // dispatch your BLoC event to remove it
                                            context.read<PosBloc>().add(
                                              PosEvent.removeCustomerService(
                                                id: detail.id,
                                              ),
                                            );
                                          },
                                          child: ServiceCard(
                                            item: detail,
                                            onTap: () {
                                              // you could still handle taps for “edit” here
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  const Divider(),
                                  const SizedBox(height: 12),
                                  _buildPaymentDropdown(context),
                                  const SizedBox(height: 12),
                                  _buildPaymentStatusDropdown(context),
                                  const SizedBox(height: 12),
                                  CustomTextField(
                                    title: 'Total yang dibayarkan',
                                    controller: bloc.userCustomerDibayarkanTEC,
                                    keyboardType: TextInputType.number,
                                    hintText: 'Rp. xxx.xxx.xxx',
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      TextInputFormatter.withFunction(
                                        CurrencyFormat.formatRupiahOnEdit,
                                      ),
                                    ],
                                    onEditingComplete: () {
                                      context.read<PosBloc>().add(
                                        const PosEvent.updateCustomerPayment(),
                                      );
                                      FocusScope.of(context).unfocus();
                                    },
                                  ),
                                  const SizedBox(height: 12),
                                  const Divider(),
                                  _buildTotalRow(
                                    'Total Transaction',
                                    bloc.totalTransaction,
                                  ),
                                  _buildTotalRow(
                                    'Total Payment',
                                    bloc.totalPayment,
                                  ),
                                  const SizedBox(height: 12),
                                  const Divider(),
                                  const SizedBox(height: 12),

                                  CustomElevatedButton(
                                    label: "Proceed",
                                    gradient: const LinearGradient(
                                      colors: [
                                        GlobalColors.primaryBlue,
                                        GlobalColors.accentSky,
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                    onPressed: () async {
                                      final hasInternet =
                                          await NetworkUtils.isConnected();
                                      if (!hasInternet) {
                                        ToastUtils.showFailure(
                                          context,
                                          message: "No Internet Connection",
                                        );
                                        return;
                                      }
                                      if (bloc.detailCart.isEmpty) {
                                        ToastUtils.showFailure(
                                          context,
                                          message: "Service not yet added!",
                                        );
                                        return;
                                      }
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                      _onPrintStruk(context, bloc);
                                    },
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentDropdown(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bloc = context.read<PosBloc>();

    // Ensure selectedId matches exactly one DropdownMenuItem
    final selectedId = bloc.listPaymentMethod.any(
            (method) => method.paymentMethodId == bloc.cartOrder.orderPaymentMethodId)
        ? bloc.cartOrder.orderPaymentMethodId
        : null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Pembayaran',
              style: const TextStyle(
                fontFamily: GlobalFonts.fontFamilyJakarta,
                fontWeight: FontWeight.w700,
                color: GlobalColors.mainTextBlack,
              ),
            ),
            const SizedBox(width: 4),
            const Text('*', style: TextStyle(color: Colors.red)),
          ],
        ),
        SizedBox(height: size.height * 0.01),
        DropdownButtonFormField<String>(
          value: selectedId,
          decoration: InputDecoration(
            filled: true,
            fillColor: GlobalColors.white,
            hintText: 'Pilih metode pembayaran',
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 4,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: Colors.grey, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(
                color: GlobalColors.mainTextBlack,
                width: 1.5,
              ),
            ),
          ),
          items: bloc.listPaymentMethod
              .map(
                (pm) => DropdownMenuItem(
              value: pm.paymentMethodId,
              child: Text(pm.paymentMethodName),
            )
          )
              .toList(),
          onChanged: (val) {
            if (val == null) return;
            bloc.paymentMethodIds = val;
            bloc.cartOrder = bloc.cartOrder.copyWith(orderPaymentMethodId: val);
          },

        ),
      ],
    );
  }

  Widget _buildPaymentStatusDropdown(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bloc = context.read<PosBloc>();

    final selectedId = bloc.listPaymentStatusMethod.any(
            (status) => status.paymentStatusId == bloc.cartOrder.orderPaymentStatusId)
        ? bloc.cartOrder.orderPaymentStatusId
        : null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              'Pembayaran Status',
              style: TextStyle(
                fontFamily: GlobalFonts.fontFamilyJakarta,
                fontWeight: FontWeight.w700,
                color: GlobalColors.mainTextBlack,
              ),
            ),
            const SizedBox(width: 4),
            const Text('*', style: TextStyle(color: Colors.red)),
          ],
        ),
        SizedBox(height: size.height * 0.01),
        DropdownButtonFormField<String>(
          value: selectedId,
          decoration: InputDecoration(
            filled: true,
            fillColor: GlobalColors.white,
            hintText: 'Pilih status pembayaran',
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: Colors.grey, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(
                color: GlobalColors.mainTextBlack,
                width: 1.5,
              ),
            ),
          ),
          items: bloc.listPaymentStatusMethod
              .map(
                (pm) => DropdownMenuItem(
              value: pm.paymentStatusId,
              child: Text(pm.paymentStatusName),
            ),
          )
              .toList(),
          onChanged: (val) {
            if (val == null) return;
            bloc.paymentStatusIds = val;
            bloc.cartOrder = bloc.cartOrder.copyWith(orderPaymentStatusId: val);
          },
        ),
      ],
    );
  }

  Widget _buildTotalRow(String label, num value) {
    final formatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$label:',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              fontFamily: GlobalFonts.fontFamilyJakarta,
            ),
          ),
          Text(
            formatter.format(value),
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              fontFamily: GlobalFonts.fontFamilyJakarta,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExpandableFab(BuildContext context, PosBloc bloc) {
    return ExpandableFab(
      type: ExpandableFabType.up,
      distance: 60,
      overlayStyle: ExpandableFabOverlayStyle(
        color: Colors.white.withOpacity(0.5),
        blur: 5,
      ),
      openButtonBuilder: RotateFloatingActionButtonBuilder(
        child: SizedBox(
          height: 35,
          width: 35,
          child: Lottie.asset("assets/anims/plus_maxclean.json"),
        ),
        fabSize: ExpandableFabSize.small,
        elevation: 15,
        foregroundColor: Colors.white,
        backgroundColor: GlobalColors.white,
        shape: const CircleBorder(),
      ),
      closeButtonBuilder: DefaultFloatingActionButtonBuilder(
        child: const Icon(Icons.close),
        fabSize: ExpandableFabSize.small,
        foregroundColor: Colors.black,
        backgroundColor: GlobalColors.white,
        shape: const CircleBorder(),
      ),
      children: [
        Row(
          children: [
            const Text('Add Service'),
            const SizedBox(width: 20),
            FloatingActionButton.small(
              heroTag: "fab_add_service_dialog",
              backgroundColor: GlobalColors.white,
              onPressed: () {
                if (bloc.orderIds.isNotEmpty) {
                  _showAddServiceDialog(context, context.read<PosBloc>());
                } else {
                  ToastUtils.showFailure(
                    context,
                    message: "No Cart Detected! Please get the Cart!",
                  );
                }
              },
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ],
    );
  }

  void _showAddServiceDialog(BuildContext context, PosBloc bloc) {
    final qtyController = TextEditingController();
    final noteController = TextEditingController();
    final priceController = TextEditingController();
    LaundryType? selectedType;

    showDialog(
      context: context,
      builder:
          (context) => StatefulBuilder(
            builder: (context, setState) {
              return Dialog(
                backgroundColor: GlobalColors.white,
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                insetPadding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: constraints.maxHeight * 0.9,
                      ),
                      child: Padding(
                        // so the dialog moves up on keyboard open
                        padding: EdgeInsets.only(
                          left: 24,
                          right: 24,
                          top: 24,
                          bottom: MediaQuery.of(context).viewInsets.bottom + 24,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Add Service",
                                style: TextStyle(
                                  fontFamily: GlobalFonts.fontFamilyJakarta,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 16),

                              // Laundry Type
                              Text(
                                "Laundry Type",
                                style: TextStyle(
                                  fontFamily: GlobalFonts.fontFamilyJakarta,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 8),
                              DropdownButtonFormField<String>(
                                value: selectedType?.laundryTypeId,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: GlobalColors.white.withOpacity(0.15),
                                  hintText: 'Choose laundry type',
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(14),
                                    borderSide: const BorderSide(color: GlobalColors.grey, width: 1),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(14),
                                    borderSide: const BorderSide(color: GlobalColors.grey, width: 1),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(14),
                                    borderSide: const BorderSide(  color: GlobalColors.grey, width: 1.5),
                                  ),
                                ),
                                items: bloc.listLaundryType.map((type) {
                                  return DropdownMenuItem(
                                    value: type.laundryTypeId,
                                    child: Text(type.laundryTypeName),
                                  );
                                }).toList(),
                                onChanged: (val) {
                                  if (val != null) {
                                    setState(() {
                                      selectedType = bloc.listLaundryType.firstWhere(
                                            (t) => t.laundryTypeId == val,
                                      );
                                    });
                                  }
                                },
                              ),
                              const SizedBox(height: 16),

                              // Quantity
                              CustomTextField(
                                title: 'Quantity',
                                controller: qtyController,
                                keyboardType: TextInputType.number,
                                prefixIcon: const Icon(
                                  Icons.format_list_numbered,
                                ),
                              ),
                              const SizedBox(height: 16),

                              // Keterangan
                              CustomTextField(
                                title: 'Keterangan',
                                controller: noteController,
                                prefixIcon: const Icon(Icons.note),
                              ),
                              const SizedBox(height: 16),

                              // Unit Price
                              CustomTextField(
                                title: 'Unit Price',
                                controller: priceController,
                                keyboardType: TextInputType.number,
                                prefixIcon: const Icon(Icons.attach_money),
                                hintText: 'Rp. xxx.xxx.xxx',
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  TextInputFormatter.withFunction(
                                    CurrencyFormat.formatRupiahOnEdit,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 24),

                              // Buttons
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  CustomElevatedButton(
                                    label: 'Cancel',
                                    onPressed: () => Navigator.pop(context),
                                    width: 100,
                                    height: 50,
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.red.shade700,
                                        Colors.redAccent,
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderColor: Colors.red,
                                    textColor: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                    elevation: 10,
                                  ),
                                  const SizedBox(width: 12),
                                  CustomElevatedButton(
                                    label: 'Save',
                                    onPressed: () {
                                      if (selectedType == null) {
                                        ToastUtils.showFailure(
                                          context,
                                          message: "Please pick a laundry type",
                                        );
                                        return;
                                      }
                                      if (qtyController.text.isEmpty ||
                                          int.tryParse(qtyController.text) ==
                                              null) {
                                        ToastUtils.showFailure(
                                          context,
                                          message: "Enter a valid quantity",
                                        );
                                        return;
                                      }
                                      if (priceController.text.isEmpty ||
                                          double.tryParse(priceController.text.replaceAll(RegExp(r'[^0-9]'), '')) ==
                                              null) {
                                        ToastUtils.showFailure(
                                          context,
                                          message: "Enter a valid price",
                                        );
                                        return;
                                      }


                                      FocusScope.of(context).unfocus();
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();

                                      bloc.add(
                                        PosEvent.addServiceToCart(
                                          laundryTypes:
                                              selectedType!.laundryTypeId,
                                          laundryNames:
                                              selectedType!.laundryTypeName,
                                          qty: int.parse(qtyController.text),
                                          keterangan: noteController.text,
                                          price: double.parse(
                                            priceController.text.replaceAll(RegExp(r'[^0-9]'), ''),
                                          ),

                                        ),
                                      );
                                      Navigator.pop(context);
                                    },
                                    width: 100,
                                    height: 50,
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.green.shade700,
                                        Colors.lightGreen,
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    textColor: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                    elevation: 10,
                                  ),
                                ],
                              ),
                            ],
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

  Widget _buildPosLoadingShimmer(BuildContext context) {
    // Use the same padding as the real UI
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Header skeleton
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(width: 120, height: 20, color: Colors.white),
              Container(width: 80, height: 20, color: Colors.white),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(),
          const SizedBox(height: 12),

          // 2. Customer fields skeleton
          Container(width: double.infinity, height: 56, color: Colors.white),
          const SizedBox(height: 12),
          Container(width: double.infinity, height: 56, color: Colors.white),
          const SizedBox(height: 12),
          Container(width: double.infinity, height: 56, color: Colors.white),
          const SizedBox(height: 12),
          const Divider(),
          const SizedBox(height: 12),

          // 3. Services list skeleton
          Container(width: 120, height: 20, color: Colors.white),
          const SizedBox(height: 12),
          Container(width: double.infinity, height: 56, color: Colors.white),
          const SizedBox(height: 12),
          Container(width: double.infinity, height: 56, color: Colors.white),
          const SizedBox(height: 12),
          Container(width: double.infinity, height: 56, color: Colors.white),
          const SizedBox(height: 12),
          const Divider(),
          const SizedBox(height: 12),
        ],
      ),
    );
  }

  Future<void> _onPrintStruk(BuildContext context, PosBloc bloc) async {
    // final printService = PrintService();
    // bool didConnect = false;
    //
    try {
    //   // 1) discover paired devices
    //   final devices = await printService.getPairedDevices();
    //   final panda = devices.firstWhere(
    //         (d) => d.name?.trim() == '58Printer',
    //     orElse: () => throw Exception('58Printer not found'),
    //   );
    //
    //   // 2) connect
    //   didConnect = await printService.connect(panda);
    //   if (!didConnect) throw Exception('Failed to connect to 58Printer');
    //
    //   // 3) build item list
    //   final items = bloc.cartOrder.cartDetails.map((detail) {
    //     final serviceName = detail.serviceName;
    //     final line = detail.keterangan;
    //     final quantity = detail.quantity;
    //     final price = NumberFormat.currency(
    //       locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0,
    //     ).format(detail.price * detail.quantity);
    //     return { 'service': serviceName, 'name': line, 'price': price, 'qty': quantity};
    //   }).toList();
    //
    //   // 4) print
    //   await printService.printStruk(
    //     orderId: bloc.orderIds,
    //     items: items,
    //     total: NumberFormat.currency(
    //       locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0,
    //     ).format(bloc.totalTransaction),
    //   );

      // 5) tell your BLoC to submit to DB
      bloc.add(const PosEvent.submitToDb());

      // show success
      ToastUtils.showSuccess(context, message: 'Struk printed!');
    } catch (e) {
      ToastUtils.showFailure(context, message: 'Print error: $e');
    } finally {
      // only attempt disconnect if we actually connected
      // if (didConnect) {
      //   try {
      //     await printService.disconnect();
      //   } catch (_) {
      //     ToastUtils.showFailure(context, message: 'Print error: _');
      //   }
      // }
    }
  }

}
