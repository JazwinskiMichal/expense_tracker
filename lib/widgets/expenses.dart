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
  final List<Expense> _expenses = [];

  // Show add expenses overlay
  void _showAddExpenseOverlay(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) {
        return NewExpense(onAddNewExpense: _addNewExpense);
      },
    );
  }

  // Add new expense
  void _addNewExpense(Expense expense) {
    setState(() {
      _expenses.add(expense);
    });
  }

  // Remove expense
  void _removeExpense(Expense expense) {
    setState(() {
      _expenses.remove(expense);
    });
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
          child: ExpensesList(
            expenses: _expenses,
            removeExpense: _removeExpense,
          ),
        ),
      ]),
    );
  }
}
