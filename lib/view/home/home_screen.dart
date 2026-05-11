import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_expense_tracker/view/home/home_widget.dart';
import 'package:personal_expense_tracker/bloc/expense_list_bloc/expense_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ExpenseBloc(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Expense Tracker')),
        body: const HomeWidget(),
      ),
    );
  }
}
