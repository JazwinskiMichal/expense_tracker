import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  // Properties
  final Expense expense;

  // Constructor
  const ExpenseItem({
    super.key,
    required this.expense,
  });

  // Return Widget tree
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 10,
      ),
      child: Card(
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                  width: 2,
                ),
              ),
              padding: const EdgeInsets.all(15),
              child: Text(
                '\$${expense.amount.toStringAsFixed(2)}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  expense.title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Row(
                  children: [
                    // Category Icon
                    Icon(
                      categoryIcons[expense.category],
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    // Category Text
                    Text(
                      expense.category.toString().split('.').last,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                // Date
                Text(
                  expense.formattedDate,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
