import 'package:uuid/uuid.dart';

// Uuid instance
const uuid = Uuid();

// Category Enum
enum Category {
  food,
  travel,
  leisure,
  work,
}

// Expense Model
class ExpenseModel {
  // Properties
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  // Constructor with Initializer List
  ExpenseModel({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();
}
