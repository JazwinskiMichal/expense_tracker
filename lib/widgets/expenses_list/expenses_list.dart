import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';

class ExpensesList extends StatelessWidget {
// Properties
  final List<Expense> expenses;
  final Function(Expense) removeExpense;

  // Constructor
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.removeExpense,
  });

  @override
  Widget build(BuildContext context) {
    // Builder works like a virtualization of the items in a list
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (BuildContext ctx, int index) => Dismissible(
        key: Key(expenses[index].id),
        child: ExpenseItem(
          expense: expenses[index],
        ),
        onDismissed: (direction) {
          // Remove item from list
          removeExpense(expenses[index]);
        },
      ),
    );
  }
}
