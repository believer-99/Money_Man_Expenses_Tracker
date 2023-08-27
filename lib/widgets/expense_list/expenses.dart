import 'package:expenses_tracker/widgets/expense_list/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expenses_tracker/models/expense.dart';
import 'package:expenses_tracker/widgets/expense_list/expenses_list.dart';
import 'package:expenses_tracker/widgets/chart/chart/chart.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [];
  void _addExpense(Expense expense) {
    setState(
      () {
        _registeredExpenses.add(expense);
      },
    );
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense Deleted'),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                _registeredExpenses.insert(expenseIndex, expense);
              });
            }),
      ),
    );
  }

  void _openModalBottomSheet() {
    showModalBottomSheet(
      useSafeArea: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
      isScrollControlled: true,
    );
  }

  @override
  Widget build(context) {
    final width = MediaQuery.of(context).size.width;
    print(width);
    Widget _screenLister = const Center(
        child: Text('No Expenses to display! Go ahead and add some!'));
    if (_registeredExpenses.isNotEmpty) {
      _screenLister = ExpensesList(
          expenses: _registeredExpenses, onRemoveExpense: _removeExpense);
    }
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Money Man Expense Tracker',
            style: TextStyle(fontSize: 24),
          ),
          actions: [
            IconButton(
              onPressed: _openModalBottomSheet,
              icon: const Icon(
                Icons.add,
              ),
            ),
          ]),
      body: width < 450
          ? Column(
              children: [
                Expanded(
                  child: Chart(expenses: _registeredExpenses),
                ),
                Expanded(
                  child: _screenLister,
                )
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: Chart(expenses: _registeredExpenses),
                ),
                Expanded(
                  child: _screenLister,
                )
              ],
            ),
    );
  }
}
