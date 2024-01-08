import 'package:expense_tracker/expenses_list.dart';
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

  // Return Widget tree
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
