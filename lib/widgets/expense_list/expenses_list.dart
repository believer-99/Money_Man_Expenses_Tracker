import 'package:expenses_tracker/widgets/expense_list/expenses_item.dart';
import 'package:flutter/material.dart';
import 'package:expenses_tracker/models/expense.dart';

class ExpensesList extends StatelessWidget {
  final List<Expense> expenses;
  const ExpensesList({super.key, required this.expenses,required this.onRemoveExpense});
final void Function(Expense expense) onRemoveExpense;
  @override
  Widget build(context) {
    return ListView.builder(
      itemBuilder: (ctr, index) => Dismissible(
        background: Container(color: Theme.of(context).colorScheme.error,
        margin: EdgeInsets.symmetric(horizontal:Theme.of(context).cardTheme.margin!.horizontal, ) ),
        key: ValueKey(expenses[index]),
        onDismissed: (direction){
          onRemoveExpense(expenses[index]);
        },
        child: ExpensesItem(expense: expenses[index]),
      ),
      itemCount: expenses.length,
    );
  }
}
