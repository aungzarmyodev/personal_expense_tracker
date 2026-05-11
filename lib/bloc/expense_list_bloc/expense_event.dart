part of 'expense_bloc.dart';

abstract class ExpenseEvent {}

class LoadExpenses extends ExpenseEvent {}

class AddExpense extends ExpenseEvent {
  final ExpenseModel expense;

  AddExpense(this.expense);
}

class SearchExpense extends ExpenseEvent {
  final String query;

  SearchExpense(this.query);
}
