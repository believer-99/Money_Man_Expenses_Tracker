import 'package:flutter/material.dart';
import 'package:expenses_tracker/models/expense.dart';

class ExpensesItem extends StatelessWidget {
  final Expense expense;
  const ExpensesItem({required this.expense, super.key});

  @override
  Widget build(context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          children: [
            Text(expense.title ,style: Theme.of(context).textTheme.titleMedium,),
            const SizedBox(
              height: 4,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '\₹${expense.amount.toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: Color.fromARGB(255, 62, 65, 252),
                  ),
                ),
                const Spacer(),
                Icon(
                  categoryIcon[expense.category],
                  color: Colors.blue,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  expense.formattedDate,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 62, 65, 252),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
