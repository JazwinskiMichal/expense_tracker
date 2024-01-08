import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';

class ExpensesList extends StatelessWidget {
// Properties
  final List<Expense> expenses;

  // Constructor
  const ExpensesList({
    super.key,
    required this.expenses,
  });

  @override
  Widget build(BuildContext context) {
    // Builder works like a virtualization of the items in a list
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (BuildContext ctx, int index) => ExpenseItem(
        expense: expenses[index],
      ),
    );
  }
}