class Order {
  final int id;
  final String orderId;
  final String orderCustUsername;
  final String orderCustNohp;
  final String orderCustAddress;
  final DateTime orderTglMasuk;
  final DateTime orderTglKeluar;
  final String orderTotalPayment;
  final String orderPaymentMethodId;
  final String orderPaymentStatusId;
  final String orderStatusId;
  final DateTime? createdAt;
  final String? createdBy;
  final DateTime? updatedAt;
  final String? updatedBy;
  final DateTime? deletedAt;
  final String? deletedBy;

  final String? paymentMethodName;
  final String? paymentStatusName;
  final String? orderStatusName;

  Order({
    required this.id,
    required this.orderId,
    required this.orderCustUsername,
    required this.orderCustNohp,
    required this.orderCustAddress,
    required this.orderTglMasuk,
    required this.orderTglKeluar,
    required this.orderTotalPayment,
    required this.orderPaymentMethodId,
    required this.orderPaymentStatusId,
    required this.orderStatusId,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
    this.deletedAt,
    this.deletedBy,
    this.paymentMethodName,
    this.paymentStatusName,
    this.orderStatusName,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    id: json['id'],
    orderId: json['order_id'],
    orderCustUsername: json['order_cust_username'],
    orderCustNohp: json['order_cust_nohp'],
    orderCustAddress: json['order_cust_address'],
    orderTglMasuk: DateTime.parse(json['order_tgl_masuk']),
    orderTglKeluar: DateTime.parse(json['order_tgl_keluar']),
    orderTotalPayment: json['order_total_payment'],
    orderPaymentMethodId: json['order_payment_method_id'],
    orderPaymentStatusId: json['order_payment_status_id'],
    orderStatusId: json['order_status_id'],
    createdAt: json['created_at'] != null ? DateTime.tryParse(json['created_at']) : null,
    createdBy: json['created_by'],
    updatedAt: json['updated_at'] != null ? DateTime.tryParse(json['updated_at']) : null,
    updatedBy: json['updated_by'],
    deletedAt: json['deleted_at'] != null ? DateTime.tryParse(json['deleted_at']) : null,
    deletedBy: json['deleted_by'],
    paymentMethodName: json['payment_methods']?['payment_method_name'],
    paymentStatusName: json['payment_status']?['payment_status_name'],
    orderStatusName: json['order_status']?['order_status_name'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'order_id': orderId,
    'order_cust_username': orderCustUsername,
    'order_cust_nohp': orderCustNohp,
    'order_cust_address': orderCustAddress,
    'order_tgl_masuk': orderTglMasuk.toIso8601String(),
    'order_tgl_keluar': orderTglKeluar.toIso8601String(),
    'order_total_payment': orderTotalPayment,
    'order_payment_method_id': orderPaymentMethodId,
    'order_payment_status_id': orderPaymentStatusId,
    'order_status_id': orderStatusId,
    'created_at': createdAt?.toIso8601String(),
    'created_by': createdBy,
    'updated_at': updatedAt?.toIso8601String(),
    'updated_by': updatedBy,
    'deleted_at': deletedAt?.toIso8601String(),
    'deleted_by': deletedBy,
    'payment_methods': {
      'payment_method_name': paymentMethodName,
    },
    'payment_status': {
      'payment_status_name': paymentStatusName,
    },
    'order_status': {
      'order_status_name': orderStatusName,
    },
  };
}
