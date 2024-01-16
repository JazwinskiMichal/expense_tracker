import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class Expenses extends StatefulWidget {
  // Constructor
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  // Properties
  final List<Expense> _expenses = [
    Expense(
      title: 'Groceries',
      amount: 100.00,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: 'Flight to Bali',
      amount: 1000.00,
      date: DateTime.now(),
      category: Category.travel,
    ),
    Expense(
      title: 'New Laptop',
      amount: 1500.00,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'New Phone',
      amount: 800.00,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  // Show add expenses overlay
  void _showAddExpenseOverlay(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return const NewExpense();
      },
    );
  }

  // Return Widget tree
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(
        title: const Text('Expenses'),
        actions: [
          // Add Expense Button
          IconButton(
            onPressed: () {
              _showAddExpenseOverlay(context);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(children: [
        const Text('chart'),
        // Expenses List must be wrapped in Expanded widget, because its on a Column
        Expanded(
          child: ExpensesList(expenses: _expenses),
        ),
      ]),
    );
  }
}
