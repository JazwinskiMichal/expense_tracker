import 'package:flutter/material.dart';
import 'package:expense_trackert/models/expense.dart';

class Expenses extends StatefulWidget {
  // Constructor
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  // Properties
  final List<ExpenseModel> _expenses = [];

  // Return Widget tree
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Text('chart'),
        Text('expenses list'),
      ]),
    );
  }
}
