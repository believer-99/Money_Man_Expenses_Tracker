import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter=DateFormat.yMd();

const uuid = Uuid();
enum Category{travel,food,leisure,work}
const categoryIcon={
  Category.travel:Icons.flight_takeoff,
  Category.food:Icons.lunch_dining,
  Category.work:Icons.work,
  Category.leisure:Icons.movie,
};

class Expense {
  Expense({required this.title, required this.amount, required this.date,required this.category})
      : id = uuid.v4();
  final String id;
  final double amount;
  final String title;
  final DateTime date;
  final Category category;
  String get formattedDate
{
  return formatter.format(date);
}
}
class ExpenseBucket{
  final Category category;
  final List<Expense>expense;
  ExpenseBucket({required this.category,required this.expense});
  ExpenseBucket.forCategory(List<Expense>allExpenses,this.category):expense=allExpenses.where((expense) => category==expense.category).toList();
  double get totalExpenses{
  double sum=0;
for(final expenseItem in expense)
{
  sum+=expenseItem.amount;
}
  return sum;
  }
}