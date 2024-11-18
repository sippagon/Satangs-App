// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<BudgetTrasactionCategoriesStruct>> mapCategoriesToAddBudgetCats(
    List<String> input, double totalBudget) async {
  // Add your function code here!
  var categories =
      FFAppState().TransCatExpenses.where((w) => input.contains(w.guid));

  DateTime now = DateTime.now();
  int lastday = DateTime(now.year, now.month + 1, 0).day;
  DateTime endOfCurrMonth =
      DateTime(now.year, now.month + 1, lastday, 23, 59, 59);
  DateTime threeMonthsAgo = DateTime(now.year, now.month - 3, 1);

  var transactions = FFAppState()
      .Transactions
      .where((w) =>
          w.typeId == "Expense" &&
          w.date! >= threeMonthsAgo &&
          w.date! <= endOfCurrMonth &&
          input.contains(w.categoryId))
      .toList();
  var totalExpense = transactions.length > 0
      ? transactions.map((m) => m.amount).reduce((a, b) => a + b)
      : 0.0;
  var remainingBudget = totalBudget;

  List<BudgetTrasactionCategoriesStruct> results = categories.map((category) {
    var allocateAmount = 0.0;
    if (remainingBudget > 0) {
      if (transactions.length > 0) {
        var invokeTransactions =
            transactions.where((w) => w.categoryId == category.guid).toList();
        if (invokeTransactions.length > 0) {
          var totalSpent =
              invokeTransactions.map((m) => m.amount).reduce((a, b) => a + b);
          var percentage = totalSpent / totalExpense;
          allocateAmount = percentage * totalBudget;
        }
      }

      if (allocateAmount > remainingBudget) {
        allocateAmount = remainingBudget;
      }

      remainingBudget -= allocateAmount;
    }

    return BudgetTrasactionCategoriesStruct(
        guid: category.guid, name: category.name, amount: allocateAmount);
  }).toList();

  var zeroBudgetCategories = results.where((w) => w.amount <= 0).toList();
  if (zeroBudgetCategories.isNotEmpty && remainingBudget <= 0) {
    var otherBudgetCategories = results.where((w) => w.amount > 0).toList();
    otherBudgetCategories.sort((a, b) => b.amount.compareTo(a.amount));

    for (var i = 0; i < zeroBudgetCategories.length; i++) {
      var allocateAmount = 0.0;

      for (var y = 0; y < otherBudgetCategories.length; y++) {
        var dividedAmount = otherBudgetCategories[y].amount * 0.05;
        allocateAmount += dividedAmount;

        var updateIndex =
            results.indexWhere((w) => w.guid == otherBudgetCategories[y].guid);
        results[updateIndex].amount -= dividedAmount;
      }

      var index =
          results.indexWhere((w) => w.guid == zeroBudgetCategories[i].guid);
      results[index].amount = allocateAmount;
    }
  }

  return results;
}
