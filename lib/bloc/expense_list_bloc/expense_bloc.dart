import '../../data/models/expense_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_expense_tracker/data/repositories/expense_repository.dart';

part 'expense_event.dart';
part 'expense_state.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  final ExpenseRepository repository = ExpenseRepository();

  ExpenseBloc() : super(ExpenseInitial()) {
    on<LoadExpenses>(_onLoadExpenses);

    on<AddExpense>(_onAddExpense);

    on<SearchExpense>(_onSearchExpense);
  }

  Future<void> _onLoadExpenses(
    LoadExpenses event,
    Emitter<ExpenseState> emit,
  ) async {
    try {
      emit(ExpenseLoading());

      final expenses = await repository.getExpenses();

      emit(ExpenseLoaded(expenses));
    } catch (e) {
      emit(ExpenseError(e.toString()));
    }
  }

  Future<void> _onAddExpense(
    AddExpense event,
    Emitter<ExpenseState> emit,
  ) async {
    try {
      await repository.addExpense(event.expense);

      final expenses = await repository.getExpenses();

      emit(ExpenseLoaded(expenses));
    } catch (e) {
      emit(ExpenseError(e.toString()));
    }
  }

  Future<void> _onSearchExpense(
    SearchExpense event,
    Emitter<ExpenseState> emit,
  ) async {
    try {
      emit(ExpenseLoading());

      final expenses = await repository.getExpenses();

      final filtered = expenses.where((e) {
        return e.category.toLowerCase().contains(event.query.toLowerCase()) ||
            e.note.toLowerCase().contains(event.query.toLowerCase());
      }).toList();

      emit(ExpenseLoaded(filtered));
    } catch (e) {
      emit(ExpenseError(e.toString()));
    }
  }
}
