import 'package:flutter/material.dart';
import '../../utils/date_formatter.dart';
import 'package:personal_expense_tracker/utils/colors.dart';
import 'package:personal_expense_tracker/data/models/expense_model.dart';

class ExpenseItemWidget extends StatelessWidget {
  final ExpenseModel expense;

  const ExpenseItemWidget({super.key, required this.expense});

  @override
  Widget build(BuildContext context) {
    final hasNote = expense.note.trim().isNotEmpty;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),

      child: ListTile(
        trailing: Text(
          '\$${expense.amount}',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),

        title: Text(expense.category),

        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          mainAxisSize: MainAxisSize.min,

          children: [
            if (hasNote) ...[
              const SizedBox(height: 4),

              Text(
                expense.note,
                style: TextStyle(color: AppColors.subLabelColor, fontSize: 12),
              ),
            ],
            Text(DateFormatter.formatDate(expense.date)),
          ],
        ),
      ),
    );
  }
}
