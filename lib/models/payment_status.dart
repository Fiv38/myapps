class PaymentStatus {
  final String paymentStatusId;
  final String paymentStatusName;
  final String? paymentStatusDescription;
  final bool? isActive;
  final DateTime? createdAt;
  final String? createdBy;
  final DateTime? updatedAt;
  final String? updatedBy;
  final DateTime? deletedAt;

  PaymentStatus({
    required this.paymentStatusId,
    required this.paymentStatusName,
    this.paymentStatusDescription,
    this.isActive,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
    this.deletedAt,
  });

  factory PaymentStatus.fromJson(Map<String, dynamic> json) {
    return PaymentStatus(
      paymentStatusId: json['payment_status_id'],
      paymentStatusName: json['payment_status_name'],
      paymentStatusDescription: json['payment_status_description'],
      isActive: json['is_active'] ?? true,
      createdAt: DateTime.tryParse(json['created_at'] ?? ''),
      createdBy: json['created_by'],
      updatedAt: DateTime.tryParse(json['updated_at'] ?? ''),
      updatedBy: json['updated_by'],
      deletedAt: DateTime.tryParse(json['deleted_at'] ?? ''),
    );
  }

  Map<String, dynamic> toJson() => {
    'payment_status_id': paymentStatusId,
    'payment_status_name': paymentStatusName,
    'payment_status_description': paymentStatusDescription,
    'is_active': isActive,
    'created_at': createdAt?.toIso8601String(),
    'created_by': createdBy,
    'updated_at': updatedAt?.toIso8601String(),
    'updated_by': updatedBy,
    'deleted_at': deletedAt?.toIso8601String(),
  };
}
