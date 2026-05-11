import '../../models/expense_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'expense_event.dart';
part 'expense_state.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  ExpenseBloc() : super(ExpenseInitial()) {
    on<AddExpense>(_onAddExpense);
  }

  final List<ExpenseModel> _expenses = [];

  Future<void> _onAddExpense(
    AddExpense event,
    Emitter<ExpenseState> emit,
  ) async {
    try {
      emit(ExpenseLoading());

      await Future.delayed(const Duration(seconds: 1));

      _expenses.add(event.expense);

      emit(ExpenseLoaded(_expenses));
    } catch (e) {
      emit(ExpenseError(e.toString()));
    }
  }
}
