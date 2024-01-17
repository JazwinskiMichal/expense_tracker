import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expense_tracker/models/expense.dart' as expenses_category;

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddNewExpense});

  final void Function(Expense) onAddNewExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  // Properties
  final _formKey = GlobalKey<FormState>();

  // Initialize Controllers
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  // Variables
  DateTime? _selectedDate;
  expenses_category.Category? _categorySelected;

  // Show Date Picker
  void _showDatePicker() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now(),
    );

    // This code is going to be executed only if the user picked a date -> async/await
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  // Submit Form
  void _submitForm() {
    // Check if the form is valid
    final isValid = _formKey.currentState!.validate();

    // Manually validate selected category and date
    if (_categorySelected == null && _selectedDate == null) {
      _showValidationErrorPopup('Please select a category and a date');
      return;
    }
    if (_categorySelected == null) {
      _showValidationErrorPopup('Please select a category');
      return;
    }
    if (_selectedDate == null) {
      _showValidationErrorPopup('Please select a date');
      return;
    }

    // If the form is not valid, return
    if (!isValid) {
      _showValidationErrorPopup('Please enter valid values');
      return;
    }

    // If the form is valid, save the data
    var title = _titleController.text;
    var amount = double.parse(_amountController.text);

    // Add the new expense to the list
    widget.onAddNewExpense(
      Expense(
        title: title,
        amount: amount,
        date: _selectedDate!,
        category: _categorySelected!,
      ),
    );

    // Close the modal
    Navigator.of(context).pop();
  }

  void _showValidationErrorPopup(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          ElevatedButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Theme.of(context).primaryColor,
              elevation: 5,
            ),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // SingleChildScrollView allows the modal to scroll, to avoid cover the TextField by the keyboard
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Title
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                  child: TextFormField(
                    textInputAction: TextInputAction.next,
                    controller: _titleController,
                    decoration: const InputDecoration(
                      labelText: 'Title',
                    ),
                    keyboardType: TextInputType.text,
                    maxLength: 50,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a title';
                      }
                      return null;
                    },
                  ),
                ),

                Row(
                  children: [
                    // Amount
                    Expanded(
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        controller: _amountController,
                        decoration: const InputDecoration(
                          prefixText: '\$ ',
                          labelText: 'Amount',
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter an amount';
                          }
                          if (double.tryParse(value) == null) {
                            return 'Please enter a valid number';
                          }
                          if (double.parse(value) <= 0) {
                            return 'Please enter a number greater than 0';
                          }
                          return null;
                        },
                      ),
                    ),

                    const SizedBox(width: 60),

                    // Date picker
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            _selectedDate == null
                                ? 'Select date'
                                : DateFormat.yMd().format(
                                    _selectedDate!), // ! at the end tells Dart that the value is not null
                            style: const TextStyle(fontSize: 16),
                          ),
                          IconButton(
                            onPressed: _showDatePicker,
                            icon: const Icon(Icons.calendar_month),
                            color: Theme.of(context).primaryColor,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Select Category DropDown button
                Row(
                  children: [
                    // Label
                    const Expanded(
                      child: Text(
                        'Category',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),

                    const SizedBox(width: 10),

                    // DropDown Button
                    Expanded(
                      child: DropdownButton<expenses_category.Category>(
                        isExpanded: true,
                        value: _categorySelected,
                        onChanged: (expenses_category.Category? newValue) {
                          setState(() {
                            _categorySelected = newValue!;
                          });
                        },
                        items: expenses_category.Category.values.map((value) {
                          return DropdownMenuItem<expenses_category.Category>(
                            value: value,
                            child: Text(value.name.toUpperCase()),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Control Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Cancel Button
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 5,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Cancel'),
                      ),
                    ),

                    const SizedBox(width: 10),

                    // Add Expense Button
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Theme.of(context).primaryColor,
                          elevation: 5,
                        ),
                        onPressed: _submitForm,
                        child: const Text('Add Expense'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Dispose
  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }
}
