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

Future calculateUpdateAccountAmount(
  int accountIndex,
  double newAmount,
) async {
  // Add your function code here!
  var account = FFAppState().AccountList[accountIndex];
  var initialBalance = account.initialAmount;
  var currentAmount = account.currentAmount;

  var upsertAmount = newAmount - currentAmount;

  account.initialAmount = (initialBalance + upsertAmount);
  account.currentAmount = (currentAmount + upsertAmount);

  FFAppState().updateAccountListAtIndex(accountIndex, (e) => e = account);
}
