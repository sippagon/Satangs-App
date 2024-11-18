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

Future<double> getMonthlyIncome() async {
  // Add your function code here!

  var currentTime = DateTime.now();
  var thisYear = new DateTime(currentTime.year, 1, 1, 0, 0, 0);

  var transactions = FFAppState()
      .Transactions
      .where((w) => w.typeId == "Income" && w.date! >= thisYear)
      .toList();

  if (transactions.isEmpty) {
    return 0.0;
  }

  Map<String, double> monthlySums = {};

  for (var transaction in transactions) {
    String key =
        "${transaction.date!.year}-${transaction.date!.month.toString().padLeft(2, '0')}";
    if (monthlySums.containsKey(key)) {
      monthlySums[key] = monthlySums[key]! + transaction.amount;
    } else {
      monthlySums[key] = transaction.amount;
    }
  }

  double totalSum = monthlySums.values.reduce((a, b) => a + b);
  double average = totalSum / monthlySums.length;

  return average;
}
