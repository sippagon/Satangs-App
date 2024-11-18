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

Future removeAccountTransaction(int accountIndex) async {
  // Add your function code here!

  var account = FFAppState().AccountList[accountIndex];
  var transactions = FFAppState()
      .Transactions
      .where((w) =>
          w.accountId == account.guid || w.targetAccountId == account.guid)
      .toList();
  for (var i = 0; i < transactions.length; i++) {
    FFAppState().removeFromTransactions(transactions[i]);
  }

  FFAppState().removeFromAccountList(account);
}
