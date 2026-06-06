class RecentTransactionEntity {
  final String id;
  final String title;
  final double amount;
  final String category;
  final String date;

  RecentTransactionEntity({
    required this.id,
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
  });
}
