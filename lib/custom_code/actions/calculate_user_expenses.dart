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

Future<double> calculateUserExpenses() async {
  // Add your function code here!
  final DateTime now = DateTime.now();
  final DateTime threeMonthPast =
      DateTime(now.year, (now.month - 3), now.day, 0, 0, 0);
  var expenseTrans = FFAppState()
      .Transactions
      .where((w) =>
          w.typeId == TransactionType.Expense &&
          w.date! >= threeMonthPast &&
          w.date! <= threeMonthPast)
      .sorted((b, a) => a.date!.compareTo(b.date!))
      .toList();

  if (expenseTrans.length <= 0) {
    return 0.0;
  }

  Map<String, double> monthlyTotals = {};

  for (var transaction in expenseTrans) {
    String month =
        '${transaction.date!.year}-${transaction.date!.month.toString().padLeft(2, '0')}';

    if (monthlyTotals.containsKey(month)) {
      monthlyTotals[month] = monthlyTotals[month]! + transaction.amount;
    } else {
      monthlyTotals[month] = transaction.amount;
    }
  }

  double totalAmount =
      monthlyTotals.values.fold(0.0, (sum, amount) => sum + amount);
  double averageAmount = totalAmount / monthlyTotals.length;

  List<String> months = monthlyTotals.keys.toList()..sort();
  double averageGrowthRate = 0.0;
  List<double> growthRates = [];
  for (int i = 1; i < months.length; i++) {
    double previousAmount = monthlyTotals[months[i - 1]]!;
    double currentAmount = monthlyTotals[months[i]]!;
    if (previousAmount != 0) {
      double growthRate = (currentAmount - previousAmount) / previousAmount;
      growthRates.add(growthRate);
    }
  }

  if (growthRates.isNotEmpty) {
    double totalGrowthRate = growthRates.fold(0.0, (sum, rate) => sum + rate);
    averageGrowthRate = totalGrowthRate / growthRates.length;
  }

  return averageAmount * (1 + averageGrowthRate);
}
