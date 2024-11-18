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

Future<int> getIndexFromGuid(
  String guid,
  AppStateDataListType dataType,
) async {
  // Add your function code here!

  if (dataType == AppStateDataListType.Account) {
    return FFAppState().AccountList.indexWhere((w) => w.guid == guid);
  } else if (dataType == AppStateDataListType.Transaction) {
    return FFAppState().Transactions.indexWhere((w) => w.guid == guid);
  } else if (dataType == AppStateDataListType.Goal) {
    return FFAppState().Goals.indexWhere((w) => w.guid == guid);
  } else if (dataType == AppStateDataListType.Budget) {
    return FFAppState().Budgets.indexWhere((w) => w.guid == guid);
  } else if (dataType == AppStateDataListType.Taxes) {
    return FFAppState().Taxes.indexWhere((w) => w.guid == guid);
  }

  return 0;
}
