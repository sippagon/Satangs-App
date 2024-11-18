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

Future<BudgetDetailsViewModelStruct?> mapBudgetDetailsViewModel(
    String budgetGuid) async {
  // Add your function code here!
  DateTime now = DateTime.now();
  DateTime nextMonth = DateTime(now.year, now.month + 1, 1);
  DateTime startOfCurrMonth = DateTime(now.year, now.month, 1);
  DateTime endOfCurrMonth =
      DateTime(nextMonth.year, nextMonth.month, nextMonth.day - 1, 23, 59, 59);
  var budget = FFAppState().Budgets.firstWhere((w) => w.guid == budgetGuid);
  var indexInList =
      FFAppState().Budgets.indexWhere((w) => w.guid == budgetGuid);
  var budgetCategories = budget.includeCategories;
  var guidOfCategories = budgetCategories.map((m) => m.guid).toList();
  var transactions = FFAppState()
      .Transactions
      .where((w) =>
          w.typeId == "Expense" &&
          w.date! >= startOfCurrMonth &&
          w.date! <= endOfCurrMonth &&
          guidOfCategories.contains(w.categoryId))
      .toList();
  var sumTransaction = 0.0;
  if (transactions.isNotEmpty) {
    sumTransaction = transactions.map((m) => m.amount).reduce((x, y) => x + y);
  }
  var sumPercentage =
      budget.totalBudget > 0 ? sumTransaction / budget.totalBudget : 0.0;

  if (sumPercentage > 1.0) {
    sumPercentage = 1.0;
  }
  List<BudgetDetailsCategoriesViewModelStruct> catsResult = [];
  for (var i = 0; i < guidOfCategories.length; i++) {
    var currCatGuid = guidOfCategories[i];
    var currBudgetCat =
        budgetCategories.firstWhere((w) => w.guid == currCatGuid);
    var currTrans =
        transactions.where((w) => w.categoryId == currCatGuid).toList();
    var totalUsageAmount = 0.0;
    if (currTrans.isNotEmpty) {
      totalUsageAmount = currTrans.map((m) => m.amount).reduce((x, y) => x + y);
    }
    var totalUsagePercentage = currBudgetCat.amount > 0
        ? totalUsageAmount / currBudgetCat.amount
        : 0.0;
    if (totalUsagePercentage > 1.0) {
      totalUsagePercentage = 1.0;
    }

    catsResult.add(BudgetDetailsCategoriesViewModelStruct(
      guid: currCatGuid,
      name: currBudgetCat.name,
      budget: currBudgetCat.amount,
      usageAmount: totalUsageAmount,
      usagePercentage: totalUsagePercentage,
    ));
  }
  var result = BudgetDetailsViewModelStruct(
      guid: budget.guid,
      name: budget.name,
      totalBudget: budget.totalBudget,
      totalUsage: sumTransaction,
      totalUsagePercentage: sumPercentage,
      categoriesList: catsResult,
      indexInList: indexInList);
  return result;
}
