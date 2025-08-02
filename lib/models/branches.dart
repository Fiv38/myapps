class Branch {
  final String branchId;
  final String branchName;
  final String? branchPhone;
  final String? branchAddress;
  final bool? isActive;
  final DateTime? createdAt;
  final String? createdBy;
  final DateTime? updatedAt;
  final String? updatedBy;
  final DateTime? deletedAt;

  Branch({
    required this.branchId,
    required this.branchName,
    this.branchPhone,
    this.branchAddress,
    this.isActive,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
    this.deletedAt,
  });

  factory Branch.fromJson(Map<String, dynamic> json) {
    return Branch(
      branchId: json['branch_id'],
      branchName: json['branch_name'],
      branchPhone: json['branch_phone'],
      branchAddress: json['branch_address'],
      isActive: json['is_active'] ?? true,
      createdAt: DateTime.tryParse(json['created_at'] ?? ''),
      createdBy: json['created_by'],
      updatedAt: DateTime.tryParse(json['updated_at'] ?? ''),
      updatedBy: json['updated_by'],
      deletedAt: DateTime.tryParse(json['deleted_at'] ?? ''),
    );
  }

  Map<String, dynamic> toJson() => {
    'branch_id': branchId,
    'branch_name': branchName,
    'branch_phone': branchPhone,
    'branch_address': branchAddress,
    'is_active': isActive,
    'created_at': createdAt?.toIso8601String(),
    'created_by': createdBy,
    'updated_at': updatedAt?.toIso8601String(),
    'updated_by': updatedBy,
    'deleted_at': deletedAt?.toIso8601String(),
  };
}
