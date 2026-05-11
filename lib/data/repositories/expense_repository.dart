import 'package:personal_expense_tracker/data/database/db.dart';
import 'package:personal_expense_tracker/data/models/expense_model.dart';

class ExpenseRepository {
  Future<void> addExpense(ExpenseModel expense) async {
    final db = await ExpenseDb.db;

    await db.insert('expenses', {
      'category': expense.category,
      'note': expense.note,
      'amount': expense.amount,
      'date': expense.date.toIso8601String(),
    });
  }

  Future<List<ExpenseModel>> getExpenses() async {
    final db = await ExpenseDb.db;

    final data = await db.query('expenses');

    return data.map((e) {
      return ExpenseModel(
        category: e['category'] as String,

        note: e['note'] as String,

        amount: e['amount'] as double,

        date: DateTime.parse(e['date'] as String),
      );
    }).toList();
  }
}
