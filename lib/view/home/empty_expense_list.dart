import 'package:flutter/material.dart';
import 'package:personal_expense_tracker/utils/colors.dart';

class EmptyExpenseList extends StatelessWidget {
  const EmptyExpenseList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,

      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),

          child: Column(
            mainAxisSize: MainAxisSize.min,

            children: [
              Icon(
                Icons.list_alt_outlined,
                size: 80,
                color: AppColors.subLabelColor,
              ),
              const SizedBox(height: 16),
              Text(
                'No Expenses Yet',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.titleColor,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Start adding your daily expenses\n'
                'to track your spending.',
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.labelColor, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
