import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../../components/custom_elevated_button.dart';
import '../../components/custom_text_field_username.dart';
import '../../components/custom_textfield.dart';
import '../../components/loading_dialog.dart';
import '../../components/service_card.dart';
import '../../components/show_picker_customer_dialog.dart';
import '../../models/receipt_item.dart';
import '../../models/user.dart';
import '../../utils/currency_format.dart';
import '../../utils/double_back_exit.dart';
import '../../utils/helper.dart';
import '../../utils/theme/global_colors.dart';
import '../../utils/theme/global_fonts.dart';
import '../../utils/toast_utils.dart';
import '../../components/payment_method_dropdown.dart';
import '../../components/payment_method_status_dropdown.dart';
import '../../components/total_row.dart';
import '../../components/add_service_dialog.dart';
import '../../components/pos_loading_shimmer.dart';

import 'bloc/pos_bloc.dart';

@RoutePage()
class PosScreen extends StatelessWidget {
  const PosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PosBloc>(
      create: (_) => PosBloc()..add(const PosEvent.initialized()),
      child: const PosScreenView(),
    );
  }
}

class PosScreenView extends StatefulWidget {
  const PosScreenView({super.key});

  @override
  State<PosScreenView> createState() => _PosScreenViewState();
}

class _PosScreenViewState extends State<PosScreenView> {
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<PosBloc>();
    final w = MediaQuery.of(context).size.width;
    final shortest = MediaQuery.of(context).size.shortestSide;
    final isTablet = shortest >= 600;
    return DoubleBackExit(
      message: "Data Transaksi akan hilang!",
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
          listener: (context, state) async {
            state.maybeWhen(
              savingOrder: () {
                loadingDialog(context, isHideAfterSeconds: false);
              },
              orderSaved: () async {
                final sw = Stopwatch()..start();
                String step = 'INIT';

                void log(String msg) => debugPrint('[ORDER_SAVED][$step][${sw.elapsedMilliseconds}ms] $msg');

                // Tutup loading dialog kalau masih ada
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                  log('Closed loading dialog');
                }

                ToastUtils.showSuccess(context, message: "Succeed Submit Services!");
                log('Shown success toast');

                try {
                  step = 'PREP_DATA';

                  // Map items
                  final details = bloc.cartOrder.cartDetails;
                  if (details.isEmpty) {
                    log('No items to send in receipt. Aborting WA send.');
                    // Tidak fatal—order tetap sukses. Kamu bisa return di sini.
                    return;
                  }
                  final items = details
                      .map((d) => ReceiptItem(name: d.serviceName, qty: d.quantity, price: d.price, keterangan: d.keterangan))
                      .toList();
                  log('Items mapped: ${items.length}');

                  // Phone normalize + validate
                  final rawPhone = bloc.userCustomerPhoneTEC.text;
                  final phone = Helper.normalizeWa(rawPhone);
                  log('Phone raw="$rawPhone" -> normalized="$phone"');

                  // Kalau kamu pakai WaService.isValid, panggil di sini:
                  // if (!bloc.wa.isValid(phone)) ...
                  final validPhone = RegExp(r'^62\d{8,13}$').hasMatch(phone);
                  if (!validPhone) {
                    log('Invalid phone format after normalize. Aborting.');
                    ToastUtils.showFailure(context, message: 'Nomor WhatsApp tidak valid');
                    return;
                  }

                  // Status/method fallback kalau null/unknown
                  final statusName = (Helper.statusNameById(
                    bloc.listPaymentStatusMethod,
                    bloc.cartOrder.orderPaymentStatusId,
                  ) ??
                      'Belum Bayar')
                      .trim();
                  final rawMethodName = (Helper.methodNameById(
                    bloc.listPaymentMethod,
                    bloc.cartOrder.orderPaymentMethodId,
                  ) ??
                      'Cash')
                      .trim();

                  final methodName = (['belum bayar', 'pending'].contains(statusName.toLowerCase()))
                      ? 'Belum Bayar'
                      : rawMethodName;

                  // Build receipt text
                  step = 'BUILD_RECEIPT';
                  final now = DateTime.now();
                  final estimasi = now.add(const Duration(days: 3));
                  final dilunasiStr = statusName.toLowerCase().contains('full')
                      ? DateFormat('dd/MM/yyyy - HH:mm', 'id_ID').format(now)
                      : '-';

                  final text = bloc.receipt.build(
                    storeName: 'MAX CLEAN',
                    storeAddress: bloc.userAddress,
                    storePhone: bloc.userPhone,
                    notaNumber: bloc.orderIds,
                    dateTime: now,
                    cashierName: bloc.userName,
                    customerName: bloc.userCustomerNameTEC.text,
                    jenisLayanan: 'Laundry',
                    statusPembayaran: statusName.toUpperCase(),
                    caraPembayaran: methodName.toUpperCase(),
                    items: items,
                    totalPembayaran: bloc.totalTransaction,
                    estimasiSelesai: estimasi,
                    statusUmum: statusName,
                    dilunasi: dilunasiStr,
                    diambil: '-',
                    catatanTambahan: null,
                  );

                  final preview = text.length > 180 ? '${text.substring(0, 180)}…' : text;
                  log('Receipt built len=${text.length}, preview="$preview"');

                  // Kirim WA (app → fallback web)
                  step = 'SEND_WA';
                  log('Launching WA to "$phone"');
                  await bloc.wa.send(phone: phone, message: text);
                  log('WA launch requested');

                  if (!context.mounted) {
                    log('Context unmounted after WA send. Stop here.');
                    return;
                  }

                } catch (e, st) {
                  log('ERROR: $e');
                  debugPrint('[ORDER_SAVED][STACK] $st');
                  ToastUtils.showFailure(context, message: 'WA gagal dibuka: $e');
                } finally {
                  sw.stop();
                  log('FINISH total=${sw.elapsedMilliseconds}ms');
                }

                // Tutup halaman (jika memang ingin kembali 1 level)
                if (context.mounted && Navigator.canPop(context)) {
                  Navigator.pop(context);
                  debugPrint('[ORDER_SAVED][NAV] popped current page');
                }
              },

              failure: (msg) async {
                if (Navigator.canPop(context)) Navigator.pop(context);
                ToastUtils.showFailure(context, message: msg);
              },
              serviceAdded: () {
                ToastUtils.showInfo(context, message: "Service added.");
              },
              paymentUpdated: () {},
              orElse: () {},
            );
          },
          // child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 25, bottom:40),
              child: BlocBuilder<PosBloc, PosState>(
                builder: (context, state) {
                  final isLoading = state.maybeWhen(
                    loading: () => true,
                    savingOrder: () => true,
                    orElse: () => false,
                  );

                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (child, animation) =>
                        FadeTransition(opacity: animation, child: child),
                    child: isLoading
                        ? const PosLoadingShimmer()
                        : SingleChildScrollView(
                      key: const ValueKey('mainContent'),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Cart Order ID:',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: GlobalFonts.fontFamilyJakarta,
                                ),
                              ),
                              Text(
                                bloc.orderIds,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: GlobalFonts.fontFamilyJakarta,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          const Divider(),
                          const SizedBox(height: 6),

                          _buildTwoColumnForm(context, bloc, isPending: false),

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

                          // list service
                          SizedBox(
                            // biar grid bisa scroll di area ini
                            width: 500,                  // atau double.infinity
                            height: 250,                 // naikin kalau mau terlihat lebih banyak
                            child: LayoutBuilder(
                              builder: (context, c) {
                                // 3 kolom default; kalau terlalu sempit, pakai 2
                                final cross = c.maxWidth < 420 ? 2 : 3;

                                return GridView.builder(
                                  // JANGAN pakai NeverScrollable + shrinkWrap kalau mau scroll
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 8,
                                    crossAxisSpacing: 8,
                                    childAspectRatio: 1.8,
                                    mainAxisExtent: isTablet ? 150 : 130,
                                  ),
                                  itemCount: bloc.cartOrder.cartDetails.length,
                                  itemBuilder: (context, index) {
                                    final detail = bloc.cartOrder.cartDetails[index];
                                    return Dismissible(
                                      key: ValueKey(detail.id),
                                      direction: DismissDirection.endToStart,
                                      background: Container(
                                        alignment: Alignment.centerRight,
                                        padding: const EdgeInsets.only(right: 20),
                                        decoration: BoxDecoration(
                                          color: Colors.red.shade700,
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        child: const Icon(Icons.delete, color: Colors.white),
                                      ),
                                      confirmDismiss: (_) async {
                                        return await showDialog<bool>(
                                          context: context,
                                          builder: (_) => AlertDialog(
                                            title: const Text('Remove service?'),
                                            content: const Text(
                                              'Are you sure you want to remove this item from the cart?',
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(context, false),
                                                child: const Text('Cancel'),
                                              ),
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                                                onPressed: () => Navigator.pop(context, true),
                                                child: const Text('Remove', style: TextStyle(color: Colors.white)),
                                              ),
                                            ],
                                          ),
                                        ) ??
                                            false;
                                      },
                                      onDismissed: (_) {
                                        context.read<PosBloc>().add(PosEvent.removeService(id: detail.id));
                                      },
                                      child: ServiceCard(
                                        item: detail,
                                        onTap: () {
                                          // optional: edit item
                                        },
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),


                          const SizedBox(height: 12),
                          const Divider(),
                          const SizedBox(height: 12),
                          // total rows
                          TotalRow(
                            label: 'Total Transaction',
                            value: bloc.totalTransaction,
                          ),
                          TotalRow(
                            label: 'Total Payment',
                            value: bloc.totalPayment,
                          ),
                          TotalRow(
                            label: 'Total Change',
                            value: bloc.totalChange,
                          ),

                          const SizedBox(height: 12),
                          const Divider(),
                          const SizedBox(height: 12),

                          // submit
                          CustomElevatedButton(
                            label: "Proceed",
                            gradient: const LinearGradient(
                              colors: [
                                GlobalColors.primaryBlue,
                                GlobalColors.accentSky
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(15),
                            onPressed: () {
                              if (bloc.detailCart.isEmpty || bloc.totalTransaction == 0) {
                                ToastUtils.showFailure(context, message: "Tambahkan list Service");
                                return;
                              }
                              if (bloc.cartOrder.orderPaymentStatusId == "PS003" && bloc.totalPayment < bloc.totalTransaction) {
                                ToastUtils.showFailure(context, message: "Pembayaran Full Payment Gagal");
                                return;
                              }
                              if (bloc.cartOrder.orderPaymentStatusId == "PS001" && bloc.totalPayment != 0) {
                                ToastUtils.showFailure(context, message: "Belum Bayar, Kosongkan payment");
                                return;
                              }
                              FocusManager.instance.primaryFocus?.unfocus();
                              context.read<PosBloc>().add(const PosEvent.submitOrder());
                            },
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, top: 12),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          // ),
        ),
      ),
    );
  }

  Widget _buildExpandableFab(BuildContext context, PosBloc bloc) {
    return ExpandableFab(
      type: ExpandableFabType.up,
      distance: 60,
      openButtonBuilder: RotateFloatingActionButtonBuilder(
        child: SizedBox(
          height: 35,
          width: 35,
          child: Lottie.asset("assets/anims/plus_maxclean.json"),
        ),
        fabSize: ExpandableFabSize.small,
        elevation: 25,
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
                showAddServiceDialog(
                  context: context,
                  types: bloc.listLaundryType,
                  onSave: ({required type, required qty, required note, required price}) {
                    bloc.add(
                      PosEvent.addService(
                        laundryTypeId: type.laundryTypeId,
                        laundryTypeName: type.laundryTypeName,
                        qty: qty,
                        note: note,
                        price: price,
                      ),
                    );
                  },
                );
              },
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTwoColumnForm(BuildContext context, PosBloc bloc, {required bool isPending}) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 720; // breakpoint sederhana
        final gap = SizedBox(height: 12);

        final left = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextFieldUsername(
              title: 'Nama Customer',
              isRequired: true,
              controller: bloc.userCustomerNameTEC,
              hintText: 'e.g. Budi Santoso',
              prefixIcon: const Icon(Icons.person),

              // Autocomplete
              enableAutocomplete: true,
              customerSource: bloc.allUser,
              onUserSelected: (user) {

                bloc.userCustomerNameTEC.text   = user.userName;
                final hp = user.userPhone ?? '';
                bloc.userCustomerPhoneTEC.text  = hp.isEmpty ? '' :
                (hp.startsWith('62') ? hp : hp.startsWith('0') ? '62${hp.substring(1)}' : hp.startsWith('8') ? '62$hp' : hp);
                bloc.userCustomerAlamatTEC.text = user.userAddress ?? '';

                FocusManager.instance.primaryFocus?.unfocus();
              },
            ),
            gap,
            CustomTextField(
              title: 'No. HP',
              controller: bloc.userCustomerPhoneTEC,
              hintText: 'e.g. 0812xxxxxxx',
              isRequired: true,
              keyboardType: TextInputType.phone,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              prefixIcon: const Icon(Icons.phone),
              textInputAction: TextInputAction.done,
              normalizePhoneForWA: true, // aktifkan normalisasi
            ),

            gap,
            CustomTextField(
              title: 'Alamat',
              controller: bloc.userCustomerAlamatTEC,
              hintText: 'e.g. Jalan Pepaya 2...',
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              prefixIcon: const Icon(Icons.home),
            ),
          ],
        );

        final right = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PaymentMethodDropdown(
              selectedId: bloc.listPaymentMethod.any(
                    (m) => m.paymentMethodId == bloc.cartOrder.orderPaymentMethodId,
              )
                  ? bloc.cartOrder.orderPaymentMethodId
                  : null,
              methods: bloc.listPaymentMethod,
              onChanged: (val) {
                if (val == null) return;
                bloc.add(PosEvent.setPaymentMethod(paymentMethodId: val));
              },
            ),
            gap,
            PaymentMethodStatusDropdown(
              selectedId: bloc.listPaymentStatusMethod.any(
                    (s) => s.paymentStatusId == bloc.cartOrder.orderPaymentStatusId,
              )
                  ? bloc.cartOrder.orderPaymentStatusId
                  : null,
              statuses: bloc.listPaymentStatusMethod,
              onChanged: (val) {
                if (val == null) return;
                bloc.add(PosEvent.setPaymentStatus(paymentStatusId: val));
              },
            ),
            gap,
            CustomTextField(
              title: 'Total yang dibayarkan',
              controller: bloc.userCustomerDibayarkanTEC,
              keyboardType: TextInputType.number,
              hintText: 'Rp. xxx.xxx.xxx',
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                TextInputFormatter.withFunction(CurrencyFormat.formatRupiahOnEdit),
              ],
              readOnly: isPending, // Pending = disable input
              onEditingComplete: () {
                context.read<PosBloc>().add(const PosEvent.recalculatePayment());
                FocusScope.of(context).unfocus();
              },
            ),
          ],
        );

        if (!isWide) {
          // layar sempit: ditumpuk
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              left,
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 16),
              right,
            ],
          );
        }

        // layar lebar: 2 kolom sejajar
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: left),
            const SizedBox(width: 20),
            Expanded(child: right),
          ],
        );
      },
    );
  }

}
