part of 'expense_bloc.dart';

abstract class ExpenseEvent {}

class LoadExpenses extends ExpenseEvent {}

class AddExpense extends ExpenseEvent {
  final ExpenseModel expense;

  AddExpense(this.expense);
}

class DeleteExpense extends ExpenseEvent {
  final int index;

  DeleteExpense(this.index);
}
