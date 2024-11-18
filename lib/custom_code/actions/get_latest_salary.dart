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

Future<double> getLatestSalary() async {
  // Add your function code here!
  var incomeTransactions = FFAppState()
      .Transactions
      .where((w) =>
          w.typeId == "Income" &&
          w.categoryId == "42cfb58a-8322-476c-b021-3fd89284b723")
      .toList();

  if (incomeTransactions.isEmpty) {
    return 0.0;
  }

  incomeTransactions.sort((a, b) => b.date!.compareTo(a.date!));

  var latestSalary = incomeTransactions.first;
  return latestSalary.amount;
}
