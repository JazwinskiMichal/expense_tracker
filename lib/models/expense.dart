import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

// Date Format
final formatter = DateFormat.yMd();

// Uuid instance
const uuid = Uuid();

// Category Enum
enum Category {
  food,
  travel,
  leisure,
  work,
}

const categoryIcons = {
  Category.food: Icons.fastfood,
  Category.travel: Icons.flight,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

// Expense Model
class Expense {
  // Properties
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  // Constructor with Initializer List
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  // Formatted Date Getter
  String get formattedDate {
    return formatter.format(date);
  }
}
