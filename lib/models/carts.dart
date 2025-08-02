import 'detail_carts.dart';

/// Model untuk Cart (Order) beserta detail itemnya
class Cart {
  final String orderId;
  final String orderCustUsername;
  final String orderCustNohp;
  final String orderCustAddress;
  final DateTime orderTglMasuk;
  final DateTime orderTglKeluar;
  final double orderTotalPayment;
  final double orderTotalTransaction;
  final double orderTotalChange;
  final double orderTotalDiscount;
  final String orderPaymentMethodId;
  final String orderPaymentStatusId;

  final String orderStatusId;
  final List<DetailCart> cartDetails;

  Cart({
    required this.orderId,
    required this.orderCustUsername,
    required this.orderCustNohp,
    required this.orderCustAddress,
    required this.orderTglMasuk,
    required this.orderTglKeluar,
    required this.orderTotalPayment,
    required this.orderTotalTransaction,
    required this.orderTotalChange,
    required this.orderTotalDiscount,
    required this.orderPaymentMethodId,
    required this.orderPaymentStatusId,
    required this.orderStatusId,
    this.cartDetails = const [],
  });

  /// Provides a copyWith method for immutability
  Cart copyWith({
    String? orderId,
    String? orderCustUsername,
    String? orderCustNohp,
    String? orderCustAddress,
    DateTime? orderTglMasuk,
    DateTime? orderTglKeluar,
    double? orderTotalPayment,
    double? orderTotalTransaction,
    double? orderTotalChange,
    double? orderTotalDiscount,
    String? orderPaymentMethodId,
    String? orderPaymentStatusId,
    String? orderStatusId,
    List<DetailCart>? cartDetails,
  }) {
    return Cart(
      orderId: orderId ?? this.orderId,
      orderCustUsername: orderCustUsername ?? this.orderCustUsername,
      orderCustNohp: orderCustNohp ?? this.orderCustNohp,
      orderCustAddress: orderCustAddress ?? this.orderCustAddress,
      orderTglMasuk: orderTglMasuk ?? this.orderTglMasuk,
      orderTglKeluar: orderTglKeluar ?? this.orderTglKeluar,
      orderTotalPayment: orderTotalPayment ?? this.orderTotalPayment,
      orderTotalTransaction: orderTotalTransaction ?? this.orderTotalTransaction,
      orderTotalChange: orderTotalChange ?? this.orderTotalChange,
      orderTotalDiscount: orderTotalDiscount ?? this.orderTotalDiscount,
      orderPaymentMethodId: orderPaymentMethodId ?? this.orderPaymentMethodId,
      orderPaymentStatusId: orderPaymentStatusId ?? this.orderPaymentStatusId,
      orderStatusId: orderStatusId ?? this.orderStatusId,
      cartDetails: cartDetails ?? this.cartDetails,
    );
  }

  /// Named constructor untuk instance Cart kosong
  factory Cart.empty() => Cart(
    orderId: '',
    orderCustUsername: '',
    orderCustNohp: '',
    orderCustAddress: '',
    orderTglMasuk: DateTime.now(),
    orderTglKeluar: DateTime.now(),
    orderTotalPayment: 0.0,
    orderTotalTransaction: 0.0,
    orderTotalChange: 0.0,
    orderTotalDiscount: 0.0,
    orderPaymentMethodId: '',
    orderPaymentStatusId: '',
    orderStatusId: '',
    cartDetails: [],
  );

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
    orderId: json['order_id'] as String,
    orderCustUsername: json['order_cust_username'] as String,
    orderCustNohp: json['order_cust_nohp'] as String,
    orderCustAddress: json['order_cust_address'] as String,
    orderTglMasuk: DateTime.parse(json['order_tgl_masuk'] as String),
    orderTglKeluar: DateTime.parse(json['order_tgl_keluar'] as String),
    orderTotalPayment: (json['order_total_payment'] as num).toDouble(),
    orderTotalTransaction: (json['order_total_transaction'] as num).toDouble(),
    orderTotalChange: (json['order_total_change'] as num).toDouble(),
    orderTotalDiscount: (json['order_total_discount'] as num).toDouble(),
    orderPaymentMethodId: json['order_payment_method_id'] as String,
    orderPaymentStatusId: json['order_payment_status_id'] as String,
    orderStatusId: json['order_status_id'] as String,
    cartDetails: (json['cart_details'] as List<dynamic>?)
        ?.map((e) => DetailCart.fromJson(e as Map<String, dynamic>))
        .toList() ?? [],
  );

  Map<String, dynamic> toJson() => {
    'order_id': orderId,
    'order_cust_username': orderCustUsername,
    'order_cust_nohp': orderCustNohp,
    'order_cust_address': orderCustAddress,
    'order_tgl_masuk': orderTglMasuk.toIso8601String(),
    'order_tgl_keluar': orderTglKeluar.toIso8601String(),
    'order_total_payment': orderTotalPayment,
    'order_total_transaction': orderTotalTransaction,
    'order_total_change': orderTotalChange,
    'order_total_discount': orderTotalDiscount,
    'order_payment_method_id': orderPaymentMethodId,
    'order_payment_status_id': orderPaymentStatusId,
    'order_status_id': orderStatusId,
    'cart_details': cartDetails.map((e) => e.toJson()).toList(),
  };

  /// Total harga keseluruhan dari semua detail
  double get totalAmount =>
      cartDetails.fold(0.0, (sum, item) => sum + item.subTotal);

  /// Cek apakah keranjang kosong
  bool get isEmpty => cartDetails.isEmpty;
}
