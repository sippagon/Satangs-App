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

Future<double> updateCurrentBalance(String accountGuid) async {
  // Add your function code here!

  var transactions = FFAppState().Transactions.where(
      (w) => w.accountId == accountGuid || w.targetAccountId == accountGuid);
  var account =
      FFAppState().AccountList.firstWhere((w) => w.guid == accountGuid);
  double accountBalance = account.initialAmount;

  for (var transaction in transactions) {
    if (transaction.typeId == "Income") {
      accountBalance = accountBalance + transaction.amount;
    } else if (transaction.typeId == "Expense") {
      accountBalance = accountBalance - transaction.amount;
    } else if (transaction.typeId == "Transfer") {
      if (transaction.accountId == accountGuid) {
        accountBalance = accountBalance - transaction.amount;
      } else if (transaction.targetAccountId == accountGuid) {
        accountBalance = accountBalance + transaction.amount;
      }
    }
  }

  return accountBalance;
}
