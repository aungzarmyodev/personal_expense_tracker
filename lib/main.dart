import 'utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:personal_expense_tracker/view/home/home_screen.dart';
import 'package:personal_expense_tracker/view/home/empty_expense_list.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: EmptyExpenseList(),
    );
  }
}
