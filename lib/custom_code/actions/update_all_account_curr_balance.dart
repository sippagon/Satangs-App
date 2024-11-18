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

Future updateAllAccountCurrBalance() async {
  // Add your function code here!

  var transactions = FFAppState().Transactions;
  var accounts = FFAppState().AccountList;

  for (var account in accounts) {
    double accountBalance = account.initialAmount;
    var transactionThisAccount = transactions.where((w) =>
        w.accountId == account.guid || w.targetAccountId == account.guid);
    for (var transaction in transactionThisAccount) {
      if (transaction.typeId == "Income") {
        accountBalance = accountBalance + transaction.amount;
      } else if (transaction.typeId == "Expense") {
        accountBalance = accountBalance - transaction.amount;
      } else if (transaction.typeId == "Transfer") {
        if (transaction.accountId == account.guid) {
          accountBalance = accountBalance - transaction.amount;
        } else if (transaction.targetAccountId == account.guid) {
          accountBalance = accountBalance + transaction.amount;
        }
      }
    }

    account.currentAmount = accountBalance;
    var updateIndex =
        FFAppState().AccountList.indexWhere((w) => w.guid == account.guid);
    FFAppState().updateAccountListAtIndex(updateIndex, (e) => e = account);
  }
}
