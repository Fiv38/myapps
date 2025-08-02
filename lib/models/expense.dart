
class Expense {
  final int expenseId;
  final String? dcsId;
  final DateTime date;
  final String? branchId;
  final int? categoryId;
  final String? description;
  final double amount;
  final String? createdBy;
  final DateTime? createdAt;
  final String? updatedBy;
  final DateTime? updatedAt;

  Expense({
    required this.expenseId,
    this.dcsId,
    required this.date,
    this.branchId,
    this.categoryId,
    this.description,
    required this.amount,
    this.createdBy,
    this.createdAt,
    this.updatedBy,
    this.updatedAt,
  });

  factory Expense.fromJson(Map<String, dynamic> json) {
    return Expense(
      expenseId: json['expense_id'] as int,
      dcsId: json['dcs_id'] as String?,
      date: DateTime.parse(json['date'] as String),
      branchId: json['branch_id'] as String?,
      categoryId: json['category_id'] as int?,
      description: json['description'] as String?,
      amount: (json['amount'] as num).toDouble(),
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
    'expense_id': expenseId,
    'dcs_id': dcsId,
    'date': date.toIso8601String(),
    'branch_id': branchId,
    'category_id': categoryId,
    'description': description,
    'amount': amount,
    'created_by': createdBy,
    'created_at': createdAt?.toIso8601String(),
    'updated_by': updatedBy,
    'updated_at': updatedAt?.toIso8601String(),
  };
}
