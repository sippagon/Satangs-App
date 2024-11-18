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

Future<List<BarChartMonthlyTransactionsStruct>>
    summarizeMonthlyTransactions() async {
  // Add your function code here!
  List<BarChartMonthlyTransactionsStruct> summary = [];

  FFAppState().Transactions.forEach((transaction) {
    DateTime monthYear =
        DateTime(transaction.date!.year!, transaction.date!.month!);

    var existingSummary = summary.firstWhere(
      (element) =>
          element.month!.year! == monthYear.year &&
          element.month!.month! == monthYear.month,
      orElse: () => BarChartMonthlyTransactionsStruct(
          month: monthYear, totalIncome: 0.0, totalExpense: 0.0),
    );

    if (!summary.contains(existingSummary)) {
      summary.add(existingSummary);
    }

    if (transaction.typeId == 'Income') {
      existingSummary.totalIncome += transaction.amount;
    } else if (transaction.typeId == 'Expense') {
      existingSummary.totalExpense += transaction.amount;
    }
  });

  return summary;
}
