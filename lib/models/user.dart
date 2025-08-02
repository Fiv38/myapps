import 'package:myapps/models/roles.dart';

class User {
  final String userId;
  final String userName;
  final String userPhone;
  final String userAddress;
  final String roleId;
  final bool isActive;
  final String? createdBy;
  final DateTime? createdAt;
  final String? updatedBy;
  final DateTime? updatedAt;
  final String? deletedBy;
  final Role? role; // Optional nested role

  User({
    required this.userId,
    required this.userName,
    required this.userPhone,
    required this.userAddress,
    required this.roleId,
    required this.isActive,
    this.createdBy,
    this.createdAt,
    this.updatedBy,
    this.updatedAt,
    this.deletedBy,
    this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['user_id'],
      userName: json['user_name'],
      userPhone: json['user_phone'],
      userAddress: json['user_address'],
      roleId: json['role_id'],
      isActive: json['is_active'] ?? true,
      createdBy: json['created_by'],
      createdAt: DateTime.tryParse(json['created_at'] ?? ''),
      updatedBy: json['updated_by'],
      updatedAt: DateTime.tryParse(json['updated_at'] ?? ''),
      deletedBy: json['deleted_by'],
      role: json['roles'] != null ? Role.fromJson(json['roles']) : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'user_id': userId,
    'user_name': userName,
    'user_phone': userPhone,
    'user_address': userAddress,
    'role_id': roleId,
    'is_active': isActive,
    'created_by': createdBy,
    'created_at': createdAt?.toIso8601String(),
    'updated_by': updatedBy,
    'updated_at': updatedAt?.toIso8601String(),
    'deleted_by': deletedBy,
    if (role != null) 'roles': role!.toJson(),
  };
}
