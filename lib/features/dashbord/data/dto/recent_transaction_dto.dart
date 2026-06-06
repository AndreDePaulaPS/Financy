class RecenteTransactionDto {
  final String id;
  final String title;
  final double amount;
  final String category;
  final String date;

  const RecenteTransactionDto({
    required this.id,
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
  });

  Map<String, Object> toJson() {
    return {
      'id': id,
      'title': title,
      'amount': amount,
      'category': category,
      'date': date,
    };
  }

  factory RecenteTransactionDto.fromJson(Map<String, dynamic> json) {
    return RecenteTransactionDto(
      id: json['id']  as String ,
      title: json['title'] as String,
      amount: json['amount'] as double,
      category: json['category'] as String,
      date: json['date'] as String,
    );
  }
}
