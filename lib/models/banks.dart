class Bank {
  final String bankId;
  final String bankName;
  final String? bankCode;
  final bool? isActive;
  final DateTime? createdAt;
  final String? createdBy;
  final DateTime? updatedAt;
  final String? updatedBy;
  final DateTime? deletedAt;

  Bank({
    required this.bankId,
    required this.bankName,
    this.bankCode,
    this.isActive,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
    this.deletedAt,
  });

  factory Bank.fromJson(Map<String, dynamic> json) {
    return Bank(
      bankId: json['bank_id'],
      bankName: json['bank_name'],
      bankCode: json['bank_code'],
      isActive: json['is_active'] ?? true,
      createdAt: DateTime.tryParse(json['created_at'] ?? ''),
      createdBy: json['created_by'],
      updatedAt: DateTime.tryParse(json['updated_at'] ?? ''),
      updatedBy: json['updated_by'],
      deletedAt: DateTime.tryParse(json['deleted_at'] ?? ''),
    );
  }

  Map<String, dynamic> toJson() => {
    'bank_id': bankId,
    'bank_name': bankName,
    'bank_code': bankCode,
    'is_active': isActive,
    'created_at': createdAt?.toIso8601String(),
    'created_by': createdBy,
    'updated_at': updatedAt?.toIso8601String(),
    'updated_by': updatedBy,
    'deleted_at': deletedAt?.toIso8601String(),
  };
}
