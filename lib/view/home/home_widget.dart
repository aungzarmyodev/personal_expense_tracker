import 'expense_list_item.dart';
import 'empty_expense_list.dart';
import 'package:flutter/material.dart';
import '../../models/expense_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/expense_list_bloc/expense_bloc.dart';
import 'package:personal_expense_tracker/view/add_expense/add_expense_bottomsheet.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<ExpenseBloc, ExpenseState>(
            builder: (context, state) {
              // Loading State
              if (state is ExpenseLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              // Error State
              if (state is ExpenseError) {
                return Center(child: Text(state.message));
              }

              // Loaded State
              if (state is ExpenseLoaded) {
                // Empty State
                if (state.expenses.isEmpty) {
                  return const EmptyExpenseList();
                }

                // Expense List
                return ListView.builder(
                  itemCount: state.expenses.length,

                  itemBuilder: (context, index) {
                    final expense = state.expenses[index];

                    return ExpenseItemWidget(expense: expense);
                  },
                );
              }

              // Initial State
              return const EmptyExpenseList();
            },
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(20),

          child: ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,

                isScrollControlled: true,

                builder: (bottomSheetContext) {
                  return BlocProvider.value(
                    value: context.read<ExpenseBloc>(),

                    child: const AddExpenseBottomsheet(),
                  );
                },
              );
            },

            child: const Padding(
              padding: EdgeInsets.all(14),

              child: Text('Add Expense'),
            ),
          ),
        ),
      ],
    );
  }
}
