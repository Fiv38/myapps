import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../components/loading_dialog.dart';
import '../../models/detail_carts.dart';
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
          backgroundColor: GlobalColors.primaryBlue,
          elevation: 10,
          iconTheme: const IconThemeData(color: GlobalColors.white),
          title: Text(
            'On-Going Screen',
            style: TextStyle(
              fontFamily: GlobalFonts.fontFamilyJakarta,
              fontWeight: FontWeight.w600,
              color: GlobalColors.white,
            ),
          ),
          bottom: const TabBar(
            labelPadding: EdgeInsets.symmetric(horizontal: 5),
            indicatorColor: GlobalColors.white,
            labelColor: GlobalColors.white,
            unselectedLabelColor: Colors.black,
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

class _StatusTab extends StatefulWidget {
  final String status;
  const _StatusTab({required this.status});
  @override
  State<_StatusTab> createState() => _StatusTabState();
}

class _StatusTabState extends State<_StatusTab> {
  // track kartu mana yang sedang expanded
  final Set<String> _expanded = {};

  String _nextStatus(String current) {
    const map = {'OS001':'OS002','OS002':'OS003','OS003':'OS004'};
    return map[current] ?? current;
  }

  String _ctaLabel(String status) {
    switch (status) {
      case 'OS001': return 'Lanjut ke On-Going';
      case 'OS002': return 'Lanjut ke Done';
      case 'OS003': return 'Lanjut ke Completed';
      default: return 'Lanjut';
    }
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
          final allOrdersWithDetail = context.select((OngoingBloc bloc) => bloc.myOrdersWithDetails);

          // Display shimmer if still loading (empty list)
          if (allOrdersWithDetail.isEmpty) {
            return _buildShimmer();
          }

          // Filter and display
          final filtered = allOrdersWithDetail.where((o) => o.header.orderStatusId == widget.status).toList();
          final items = [...filtered]
            ..sort((a, b) => b.header.orderTglMasuk.compareTo(a.header.orderTglMasuk)); // DESC
          if (filtered.isEmpty) {
            return const Center(child: Text('Belum ada data'));
          }
          return AnimationLimiter(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: items.length,
              itemBuilder: (ctx, idx) {
                final orderBundle = items[idx];
                final order = orderBundle.header;
                final details = orderBundle.details;

                // ====== view more/less state per card ======
                final bool expanded = _expanded.contains(order.orderId);
                const int limit = 2;
                final List<DetailCart> visible =
                (expanded || details.length <= limit) ? details : details.take(limit).toList();

                return AnimationConfiguration.staggeredList(
                  position: idx,
                  delay: const Duration(milliseconds: 150),
                  child: SlideAnimation(
                    verticalOffset: 30,
                    child: FadeInAnimation(
                      child: Card(
                        color: Colors.white,
                        elevation: 5,
                        margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // === Header (tetap) ===
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(order.orderId, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15)),
                                  _StatusChip(text: order.paymentStatusName ?? '-'),
                                ],
                              ),
                              const SizedBox(height: 8),
                              _kv('Customer', order.orderCustUsername),
                              _kv('No. HP', order.orderCustNohp),
                              _kv('Tgl Masuk', _fmtDate(order.orderTglMasuk)),
                              _kv('Created By', order.createdBy ?? '-'),

                              const Divider(height: 16),

                              // === Detail ===
                              Text('Item (${details.length})', style: const TextStyle(fontWeight: FontWeight.w600)),
                              const SizedBox(height: 6),

                              // list ringkas / expand
                              ListView.separated(
                                shrinkWrap: true,
                                primary: false,
                                physics: const NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.zero,
                                itemCount: visible.length,
                                separatorBuilder: (_, __) => const SizedBox(height: 4),
                                itemBuilder: (_, i) {
                                  final d = visible[i];
                                  final hasNote = d.keterangan.trim().isNotEmpty;

                                  return Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // kiri: teks bisa di-scroll horizontal
                                      Expanded(
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                d.serviceName.isEmpty ? 'Unknown (${d.serviceId})' : d.serviceName,
                                                maxLines: 1, softWrap: false, overflow: TextOverflow.visible,
                                                style: const TextStyle(fontWeight: FontWeight.w500),
                                              ),
                                              if (hasNote) const SizedBox(height: 2),
                                              if (hasNote)
                                                Text(
                                                  d.keterangan,
                                                  maxLines: 1, softWrap: false, overflow: TextOverflow.visible,
                                                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text('x${d.quantity}', style: const TextStyle(color: Colors.black54)),
                                    ],
                                  );
                                },
                              ),

                              // tombol view more / less
                              if (details.length > limit) ...[
                                const SizedBox(height: 8),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: TextButton.icon(
                                    onPressed: () {
                                      setState(() {
                                        expanded
                                            ? _expanded.remove(order.orderId)
                                            : _expanded.add(order.orderId);
                                      });
                                    },
                                    icon: Icon(expanded ? Icons.expand_less : Icons.expand_more),
                                    label: Text(
                                      expanded
                                          ? 'Tutup'
                                          : 'Lihat selengkapnya (${details.length - limit})',
                                    ),
                                  ),
                                ),
                              ],

                              // CTA kanan-bawah (tetap)
                              const SizedBox(height: 10),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Visibility(
                                  visible: order.orderStatusId != 'OS004',
                                  child: ElevatedButton.icon(
                                    onPressed: () {
                                      final next = _nextStatus(order.orderStatusId);
                                      _updateStatus(context, order.orderId, next);
                                    },
                                    icon: const Icon(Icons.arrow_forward),
                                    label: Text(_ctaLabel(order.orderStatusId)),
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
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

Widget _kv(String k, String v) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 4),
    child: Row(
      children: [
        SizedBox(
          width: 110,
          child: Text(k,
              style: const TextStyle(
                  fontSize: 12.5,
                  color: Colors.black54,
                  fontWeight: FontWeight.w500)),
        ),
        const Text(': ', style: TextStyle(color: Colors.black38)),
        Expanded(
          child: Text(
            v,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 13.5),
          ),
        ),
      ],
    ),
  );
}

String _fmtDate(DateTime dt) {
  return DateFormat('dd/MM/yy HH:mm', 'id_ID').format(dt);
}

class _StatusChip extends StatelessWidget {
  final String text;
  const _StatusChip({required this.text});

  @override
  Widget build(BuildContext context) {
    final t = text.toLowerCase();
    Color bg;
    if (t.contains('full') || t.contains('lunas')) {
      bg = Colors.green.shade100;
    } else if (t.contains('partial') || t.contains('dp')) {
      bg = Colors.orange.shade100;
    } else if (t.contains('cancel')) {
      bg = Colors.red.shade100;
    } else {
      bg = Colors.blue.shade100;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 11.5, fontWeight: FontWeight.w600, color: Colors.black87),
      ),
    );
  }
}
