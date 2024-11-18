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

import 'package:collection/collection.dart';

Future<List<GoalMonthSavingDataTableStruct>?> calculateGoalSavingDatatable(
    String guid) async {
  // Add your function code here!
  var goal = FFAppState().Goals.firstWhere((i) => i.guid == guid, orElse: null);
  double initialIncome = goal.monthlyIncome;
  double initialExpenses = goal.monthlyExpense;
  double incomeGrowthRate = goal.incomeGrowthRate / 100;
  double savingsInterestRate = goal.savingInterestRate / 100;
  DateTime targetDate = goal.targetDate!;
  final DateTime today = DateTime.now();
  int months =
      (targetDate.year - today.year) * 12 + targetDate.month - today.month;
  double inflationRate = 0.03;

  double monthlyIncomeGrowth = (1 + incomeGrowthRate / 12);
  double monthlyExpenseInflation = (1 + inflationRate / 12);
  double monthlySavingsInterest = (1 + savingsInterestRate / 12);

  double income = initialIncome;
  double expenses = initialExpenses;
  double remainingBalance = goal.currentBalance;
  double targetAmount = goal.targetAmount;

  List<GoalMonthSavingDataTableStruct> results = [];

  if (months <= 0) {
    return null;
  }

  for (int month = 1; month <= months; month++) {
    income *= monthlyIncomeGrowth;
    expenses *= monthlyExpenseInflation;

    double savings = income - expenses;

    remainingBalance = (remainingBalance + savings) * monthlySavingsInterest;

    results.add(new GoalMonthSavingDataTableStruct(
        month: month,
        income: double.parse(income.toStringAsFixed(2)),
        expense: double.parse(expenses.toStringAsFixed(2)),
        savings: double.parse(savings.toStringAsFixed(2)),
        balance: double.parse(remainingBalance.toStringAsFixed(2)),
        reachTargetOnThisMonth: remainingBalance >= targetAmount));
  }

  return results;
}
