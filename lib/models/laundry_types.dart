class LaundryType {
  final String laundryTypeId;
  final String laundryTypeName;
  final bool? isActive;
  final DateTime? createdAt;
  final String? createdBy;
  final DateTime? updatedAt;
  final String? updatedBy;
  final DateTime? deletedAt;

  LaundryType({
    required this.laundryTypeId,
    required this.laundryTypeName,
    this.isActive,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
    this.deletedAt,
  });

  factory LaundryType.fromJson(Map<String, dynamic> json) {
    return LaundryType(
      laundryTypeId: json['laundry_type_id'],
      laundryTypeName: json['laundry_type_name'],
      isActive: json['is_active'] ?? true,
      createdAt: DateTime.tryParse(json['created_at'] ?? ''),
      createdBy: json['created_by'],
      updatedAt: DateTime.tryParse(json['updated_at'] ?? ''),
      updatedBy: json['updated_by'],
      deletedAt: DateTime.tryParse(json['deleted_at'] ?? ''),
    );
  }

  Map<String, dynamic> toJson() => {
    'laundry_type_id': laundryTypeId,
    'laundry_type_name': laundryTypeName,
    'is_active': isActive,
    'created_at': createdAt?.toIso8601String(),
    'created_by': createdBy,
    'updated_at': updatedAt?.toIso8601String(),
    'updated_by': updatedBy,
    'deleted_at': deletedAt?.toIso8601String(),
  };
}
