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

Future<double> getTaxOtherIncome() async {
  // Add your function code here!
  var currentTime = DateTime.now();
  var thisYear = new DateTime(currentTime.year, 1, 1, 0, 0, 0);

  var transactions = FFAppState()
      .Transactions
      .where((w) =>
          w.typeId == "Income" &&
          w.categoryId != "87301e2b-8fc0-4fb0-94e7-987ddae77715" &&
          w.categoryId != "42cfb58a-8322-476c-b021-3fd89284b723" &&
          w.date! >= thisYear)
      .toList();

  if (transactions.isEmpty) {
    return 0.0;
  }

  var totalSum = transactions.map((m) => m.amount).reduce((a, b) => a + b);

  return totalSum;
}
