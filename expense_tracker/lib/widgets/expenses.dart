import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registorExpenses = [
    Expense(
      title: 'Flutter course',
      amount: 999,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 16.9,
      date: DateTime.now(),
      category: Category.leisure,
    )
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(
        onAddExpense: _addExpense,
      ),
    );
  }

  void _addExpense(Expense newExpense) {
    setState(() {
      _registorExpenses.add(newExpense);
    });
  }

  void _removeExpense(Expense expense) {
    final int removedExpenseIndex = _registorExpenses.indexOf(expense);
    setState(() {
      _registorExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context)
        .clearSnackBars(); // clear all snackbar in screen
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text("Expense deleted"),
        action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() {
              _registorExpenses.insert(removedExpenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text("No expenses found. Start adding some!"),
    );

    if (_registorExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registorExpenses,
        onRemoveExpense: _removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 50, 119, 222),
        title: const Text(
          "Flutter ExpenseTracker",
          textAlign: TextAlign.center,
        ),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Chart(expenses: _registorExpenses),
          Expanded(
            child: mainContent,
          ),
        ],
      ),
    );
  }
}
