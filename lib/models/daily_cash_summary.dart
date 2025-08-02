class DailyCashSummary {
  final String dcsId;
  final DateTime date;
  final String? branchId;
  final double openingBalance;
  final double totalExpense;
  final double closingBalance;
  final String? notes;
  final String? createdBy;
  final DateTime? createdAt;
  final String? updatedBy;
  final DateTime? updatedAt;

  DailyCashSummary({
    required this.dcsId,
    required this.date,
    this.branchId,
    required this.openingBalance,
    this.totalExpense = 0,
    this.closingBalance = 0,
    this.notes,
    this.createdBy,
    this.createdAt,
    this.updatedBy,
    this.updatedAt,
  });

  factory DailyCashSummary.fromJson(Map<String, dynamic> json) {
    return DailyCashSummary(
      dcsId: json['dcs_id'] as String,
      date: DateTime.parse(json['date'] as String),
      branchId: json['branch_id'] as String?,
      openingBalance: (json['opening_balance'] as num).toDouble(),
      totalExpense: (json['total_expense'] as num?)?.toDouble() ?? 0,
      closingBalance: (json['closing_balance'] as num?)?.toDouble() ?? 0,
      notes: json['notes'] as String?,
      createdBy: json['created_by'] as String?,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null,
      updatedBy: json['updated_by'] as String?,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'dcs_id': dcsId,
    'date': date.toIso8601String(),
    'branch_id': branchId,
    'opening_balance': openingBalance,
    'total_expense': totalExpense,
    'closing_balance': closingBalance,
    'notes': notes,
    'created_by': createdBy,
    'created_at': createdAt?.toIso8601String(),
    'updated_by': updatedBy,
    'updated_at': updatedAt?.toIso8601String(),
  };
}