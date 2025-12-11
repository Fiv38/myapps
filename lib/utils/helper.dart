import 'package:intl/intl.dart';

import '../../models/detail_carts.dart';
import '../../models/payment_method.dart';
import '../../models/payment_status.dart';

class Helper {
  Helper._(); // no instance

  // ===== Currency =====
  static final NumberFormat _rupiah = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0,
  );

  static String formatRupiah(num v) => _rupiah.format(v);

  static double parseRupiahToDouble(String text) {
    final digitsOnly = text.replaceAll(RegExp(r'[^0-9]'), '');
    return double.tryParse(digitsOnly) ?? 0.0;
  }

  // ===== Lookup dasar =====
  static String methodNameById(List<PaymentMethod> methods, String? id) {
    if (id == null) return '';
    return methods
        .firstWhere(
          (m) => m.paymentMethodId == id,
      orElse: () => PaymentMethod(paymentMethodId: '', paymentMethodName: ''),
    )
        .paymentMethodName;
  }

  static String statusNameById(List<PaymentStatus> statuses, String? id) {
    if (id == null) return '';
    return statuses
        .firstWhere(
          (s) => s.paymentStatusId == id,
      orElse: () => PaymentStatus(paymentStatusId: '', paymentStatusName: ''),
    )
        .paymentStatusName;
  }

  static String? statusIdByNameContains(List<PaymentStatus> statuses, String needleUpper) {
    final hit = statuses.firstWhere(
          (s) => s.paymentStatusName.toUpperCase().contains(needleUpper),
      orElse: () => PaymentStatus(paymentStatusId: '', paymentStatusName: ''),
    );
    return hit.paymentStatusId.isEmpty ? null : hit.paymentStatusId;
  }

  // ===== Perhitungan total & kembalian =====
  static double totalTransactionOf(List<DetailCart> details) {
    return details.fold<double>(0.0, (sum, d) => sum + (d.price * d.quantity));
  }

  static ({double payment, double change}) applyPayment({
    required double payment,
    required double totalTransaction,
  }) {
    final change = payment - totalTransaction;
    return (payment: payment, change: change < 0 ? 0.0 : change);
  }

  // ===== Rule mapping yang kamu minta =====
  static ({
  String? nextStatusId,
  double nextPayment,
  double nextChange,
  String controllerText,
  }) onMethodSelected({
    required List<PaymentMethod> methods,
    required List<PaymentStatus> statuses,
    required String selectedMethodId,
    required double totalTransaction,
  }) {
    final name = methodNameById(methods, selectedMethodId).toUpperCase();

    if (name.contains('TRANSFER')) {
      final pendingId = statusIdByNameContains(statuses, 'Belum Bayar');
      final calc = applyPayment(payment: 0.0, totalTransaction: totalTransaction);
      return (
      nextStatusId: pendingId,
      nextPayment: calc.payment,
      nextChange: calc.change,
      controllerText: formatRupiah(calc.payment),
      );
    } else if (name.contains('CASH') || name.contains('QRIS')) {
      final fullId = statusIdByNameContains(statuses, 'FULL');
      final calc = applyPayment(payment: totalTransaction, totalTransaction: totalTransaction);
      return (
      nextStatusId: fullId,
      nextPayment: calc.payment,
      nextChange: calc.change,
      controllerText: formatRupiah(calc.payment),
      );
    } else {
      final pendingId = statusIdByNameContains(statuses, 'Belum Bayar');
      final calc = applyPayment(payment: 0.0, totalTransaction: totalTransaction);
      return (
      nextStatusId: pendingId,
      nextPayment: calc.payment,
      nextChange: calc.change,
      controllerText: formatRupiah(calc.payment),
      );
    }
  }

  static ({
  double nextPayment,
  double nextChange,
  String controllerText,
  bool amountEnabled,
  }) onStatusSelected({
    required List<PaymentStatus> statuses,
    required String selectedStatusId,
    required double totalTransaction,
    required double currentPayment,
  }) {
    final statusName = statusNameById(statuses, selectedStatusId).toUpperCase();

    if (statusName.contains('Belum Bayar')) {
      final calc = applyPayment(payment: 0.0, totalTransaction: totalTransaction);
      return (nextPayment: calc.payment, nextChange: calc.change, controllerText: formatRupiah(calc.payment), amountEnabled: false);
    } else if (statusName.contains('FULL')) {
      final calc = applyPayment(payment: totalTransaction, totalTransaction: totalTransaction);
      return (nextPayment: calc.payment, nextChange: calc.change, controllerText: formatRupiah(calc.payment), amountEnabled: true);
    } else {
      final calc = applyPayment(payment: currentPayment, totalTransaction: totalTransaction);
      return (nextPayment: calc.payment, nextChange: calc.change, controllerText: formatRupiah(calc.payment), amountEnabled: true);
    }
  }

  // ===== Utility lain =====
  static String normalizeWa(String raw) {
    var s = raw.replaceAll(RegExp(r'[^0-9]'), '');
    if (s.startsWith('0')) s = '62${s.substring(1)}';
    return s;
  }

  static bool isPendingStatusName(String name) => name.trim().toUpperCase().contains('Belum Bayar');
  static bool isFullStatusName(String name)    => name.trim().toUpperCase().contains('FULL');
  static bool isPartialStatusName(String name) => name.trim().toUpperCase().contains('PARTIAL');

  static bool isPendingStatusId(List<PaymentStatus> statuses, String? id) {
    if (id == null || id.isEmpty) return false;
    final name = statusNameById(statuses, id);
    return isPendingStatusName(name);
  }
  static bool isFullStatusId(List<PaymentStatus> statuses, String? id) {
    if (id == null || id.isEmpty) return false;
    final name = statusNameById(statuses, id);
    return isFullStatusName(name);
  }
  static bool isPartialStatusId(List<PaymentStatus> statuses, String? id) {
    if (id == null || id.isEmpty) return false;
    final name = statusNameById(statuses, id);
    return isPartialStatusName(name);
  }

  /// --- MASTER LAUNDRY TYPES (hardcode) ---
  static const List<Map<String, Object?>> kLaundryTypes = [
    {
      "idx": 0,
      "laundry_type_id": "LT01",
      "laundry_type_name": "Deep Cleaning",
      "is_active": true,
      "created_by": "superadmin",
      "created_at": "2025-04-18 03:45:03.290934",
      "deleted_by": null,
      "deleted_at": null,
    },
    {
      "idx": 1,
      "laundry_type_id": "LT02",
      "laundry_type_name": "Treatment and Repair",
      "is_active": true,
      "created_by": "superadmin",
      "created_at": "2025-04-18 03:45:03.290934",
      "deleted_by": null,
      "deleted_at": null,
    },
    {
      "idx": 2,
      "laundry_type_id": "LT03",
      "laundry_type_name": "Others",
      "is_active": true,
      "created_by": "superadmin",
      "created_at": "2025-04-18 03:45:03.290934",
      "deleted_by": null,
      "deleted_at": null,
    },
  ];

  /// lookup id -> name (hanya yang aktif)
  static final Map<String, String> kLaundryTypeNameById = {
    for (final m in kLaundryTypes)
      if ((m['is_active'] as bool? ?? false))
        (m['laundry_type_id'] as String): (m['laundry_type_name'] as String),
  };

  /// ambil nama laundry dari id, return '' kalau tidak ketemu
  static String getLaundryNameById(String? id) {
    if (id == null) return '';
    return kLaundryTypeNameById[id] ?? '';
  }

  /// --- PARSER DARI MAP API -> DetailCart ---
  static DetailCart parseDetailCartFromApi(Map<String, dynamic> m) {
    int _toInt(dynamic v) {
      if (v == null) return 0;
      if (v is int) return v;
      if (v is double) return v.toInt();
      return int.tryParse(v.toString()) ?? 0;
    }

    double _toDouble(dynamic v) {
      if (v == null) return 0;
      if (v is num) return v.toDouble();
      return double.tryParse(v.toString()) ?? 0;
    }

    String _toStr(dynamic v) => v?.toString() ?? '';

    final String serviceId = _toStr(m['order_laundry_type_id']);
    final String serviceName = getLaundryNameById(serviceId).isEmpty
        ? 'Unknown ($serviceId)'
        : getLaundryNameById(serviceId);

    return DetailCart(
      id: _toInt(m['id']),
      orderId: _toStr(m['order_id']),
      serviceId: serviceId,     // LT01/LT02/LT03
      serviceName: serviceName, // Deep Cleaning / ...
      keterangan: _toStr(m['order_keterangan']),
      quantity: _toInt(m['order_quantity']),
      price: _toDouble(m['order_price']),
    );
  }
}
