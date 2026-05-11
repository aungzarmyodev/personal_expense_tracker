import 'home_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/expense_list_bloc/expense_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ExpenseBloc()..add(LoadExpenses()),

      child: Scaffold(
        appBar: AppBar(title: const Text('Expense Tracker')),

        body: const HomeWidget(),
      ),
    );
  }
}
