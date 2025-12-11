import 'detail_carts.dart';
import 'orders.dart';

class OrderWithDetails {
  final Order header;
  final List<DetailCart> details;

  const OrderWithDetails({
    required this.header,
    required this.details,
  });

  // Convenience
  int get itemCount => details.length;

  double get totalFromDetails =>
      details.fold<double>(0, (sum, d) => sum + d.subTotal);

  // Jika header.orderTotalPayment string, sediakan parser aman
  double get totalPaymentHeader {
    final v = double.tryParse(header.orderTotalPayment.toString());
    return v ?? 0;
  }

  OrderWithDetails copyWith({
    Order? header,
    List<DetailCart>? details,
  }) => OrderWithDetails(
    header: header ?? this.header,
    details: details ?? this.details,
  );
}
