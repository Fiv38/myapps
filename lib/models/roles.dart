class Role {
  final String roleId;
  final String roleName;
  final bool isActive;
  final String? createdBy;
  final DateTime? createdAt;
  final String? updatedBy;
  final DateTime? updatedAt;
  final String? deletedBy;

  Role({
    required this.roleId,
    required this.roleName,
    required this.isActive,
    this.createdBy,
    this.createdAt,
    this.updatedBy,
    this.updatedAt,
    this.deletedBy,
  });

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      roleId: json['role_id'],
      roleName: json['role_name'],
      isActive: json['is_active'] ?? true,
      createdBy: json['created_by'],
      createdAt: DateTime.tryParse(json['created_at'] ?? ''),
      updatedBy: json['updated_by'],
      updatedAt: DateTime.tryParse(json['updated_at'] ?? ''),
      deletedBy: json['deleted_by'],
    );
  }

  Map<String, dynamic> toJson() => {
    'role_id': roleId,
    'role_name': roleName,
    'is_active': isActive,
    'created_by': createdBy,
    'created_at': createdAt?.toIso8601String(),
    'updated_by': updatedBy,
    'updated_at': updatedAt?.toIso8601String(),
    'deleted_by': deletedBy,
  };
}
