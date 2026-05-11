import 'package:flutter/material.dart';
import '../../models/expense_model.dart';
import '../../utils/date_formatter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/expense_list_bloc/expense_bloc.dart';

class AddExpenseBottomsheet extends StatefulWidget {
  const AddExpenseBottomsheet({super.key});

  @override
  State<AddExpenseBottomsheet> createState() => _AddExpenseBottomsheetState();
}

class _AddExpenseBottomsheetState extends State<AddExpenseBottomsheet> {
  final _formKey = GlobalKey<FormState>();

  final amountController = TextEditingController();

  final noteController = TextEditingController();

  final List<String> categories = [
    'Food',
    'Transport',
    'Shopping',
    'Bills',
    'Health',
    'Entertainment',
    'Education',
    'Other',
  ];

  String selectedCategory = 'Food';

  DateTime selectedDate = DateTime.now();

  Future<void> pickDate() async {
    final pickedDate = await showDatePicker(
      context: context,

      initialDate: selectedDate,

      firstDate: DateTime(2020),

      lastDate: DateTime(2030),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  void submitExpense() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final amount = double.parse(amountController.text.trim());

    context.read<ExpenseBloc>().add(
      AddExpense(
        ExpenseModel(
          category: selectedCategory,

          note: noteController.text.trim(),

          amount: amount,

          date: selectedDate,
        ),
      ),
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,

          bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        ),

        child: Form(
          key: _formKey,

          child: Column(
            mainAxisSize: MainAxisSize.min,

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const Text(
                'Add Expense',

                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 24),

              // Category
              DropdownButtonFormField<String>(
                value: selectedCategory,

                decoration: const InputDecoration(
                  labelText: 'Category',

                  border: OutlineInputBorder(),
                ),

                items: categories.map((category) {
                  return DropdownMenuItem(
                    value: category,

                    child: Text(category),
                  );
                }).toList(),

                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      selectedCategory = value;
                    });
                  }
                },
              ),

              const SizedBox(height: 16),

              // Amount
              TextFormField(
                controller: amountController,

                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),

                decoration: const InputDecoration(
                  labelText: 'Amount',

                  border: OutlineInputBorder(),
                ),

                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter amount';
                  }

                  final amount = double.tryParse(value);

                  if (amount == null) {
                    return 'Invalid amount';
                  }

                  if (amount <= 0) {
                    return 'Amount must be greater than 0';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 16),

              // Note
              TextFormField(
                controller: noteController,

                maxLines: 3,

                decoration: const InputDecoration(
                  labelText: 'Note (Optional)',

                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 16),

              // Date
              Row(
                children: [
                  Expanded(child: Text(DateFormatter.formatDate(selectedDate))),

                  TextButton(
                    onPressed: pickDate,

                    child: const Text('Select Date'),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Button
              SizedBox(
                width: double.infinity,

                child: ElevatedButton(
                  onPressed: submitExpense,

                  child: const Padding(
                    padding: EdgeInsets.all(14),

                    child: Text('Add Expense'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
