import 'expense_list_item.dart';
import 'empty_expense_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../add_expense/add_expense_bottomsheet.dart';
import '../../bloc/expense_list_bloc/expense_bloc.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 🔍 SEARCH BAR
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            decoration: const InputDecoration(
              hintText: 'Search category or note',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              context.read<ExpenseBloc>().add(SearchExpense(value));
            },
          ),
        ),

        // 📋 LIST
        Expanded(
          child: BlocBuilder<ExpenseBloc, ExpenseState>(
            builder: (context, state) {
              if (state is ExpenseLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is ExpenseError) {
                return Center(child: Text(state.message));
              }

              if (state is ExpenseLoaded) {
                if (state.expenses.isEmpty) {
                  return const EmptyExpenseList();
                }

                return ListView.builder(
                  itemCount: state.expenses.length,
                  itemBuilder: (context, index) {
                    final expense = state.expenses[index];
                    return ExpenseItemWidget(expense: expense);
                  },
                );
              }

              return const EmptyExpenseList();
            },
          ),
        ),

        // ➕ ADD BUTTON
        Padding(
          padding: const EdgeInsets.all(20),
          child: ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (_) {
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
