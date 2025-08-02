class OrderStatus {
  final String orderStatusId;
  final String orderStatusName;
  final String? orderStatusDescription;
  final bool? isActive;
  final DateTime? createdAt;
  final String? createdBy;
  final DateTime? updatedAt;
  final String? updatedBy;
  final DateTime? deletedAt;

  OrderStatus({
    required this.orderStatusId,
    required this.orderStatusName,
    this.orderStatusDescription,
    this.isActive,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
    this.deletedAt,
  });

  factory OrderStatus.fromJson(Map<String, dynamic> json) {
    return OrderStatus(
      orderStatusId: json['order_status_id'],
      orderStatusName: json['order_status_name'],
      orderStatusDescription: json['order_status_description'],
      isActive: json['is_active'] ?? true,
      createdAt: DateTime.tryParse(json['created_at'] ?? ''),
      createdBy: json['created_by'],
      updatedAt: DateTime.tryParse(json['updated_at'] ?? ''),
      updatedBy: json['updated_by'],
      deletedAt: DateTime.tryParse(json['deleted_at'] ?? ''),
    );
  }

  Map<String, dynamic> toJson() => {
    'order_status_id': orderStatusId,
    'order_status_name': orderStatusName,
    'order_status_description': orderStatusDescription,
    'is_active': isActive,
    'created_at': createdAt?.toIso8601String(),
    'created_by': createdBy,
    'updated_at': updatedAt?.toIso8601String(),
    'updated_by': updatedBy,
    'deleted_at': deletedAt?.toIso8601String(),
  };
}
