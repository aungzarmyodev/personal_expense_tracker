class ExpenseModel {
  final String category;
  final String note;
  final double amount;
  final DateTime date;

  ExpenseModel({
    required this.category,
    required this.note,
    required this.amount,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'category': category,
      'note': note,
      'amount': amount,
      'date': date.toIso8601String(),
    };
  }

  factory ExpenseModel.fromMap(Map<String, dynamic> map) {
    return ExpenseModel(
      category: map['category'],
      note: map['note'],
      amount: map['amount'],
      date: DateTime.parse(map['date']),
    );
  }
}
