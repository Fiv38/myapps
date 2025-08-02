class ExpenseItem {
  final int id;
  final int categoryId;
  final String categoryName;
  final String description;
  final int amount;

  ExpenseItem({
    required this.id,
    required this.categoryId,
    required this.categoryName,
    required this.description,
    required this.amount,
  });

  factory ExpenseItem.fromJson(Map<String, dynamic> json) {
    return ExpenseItem(
      id: json['expense_id'] as int,
      categoryId: json['category_id'] as int,
      categoryName: json['expense_categories']?['category_name'] ?? '',
      description: json['description'] ?? '',
      amount: json['amount'] as int,
    );
  }
}
