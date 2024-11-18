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

Future<bool> validateDuplicateName(
    String nameInput, AppStateDataListType dataType, String guid) async {
  // Add your function code here!

  if (dataType == AppStateDataListType.Account) {
    return !(FFAppState()
        .AccountList
        .any((w) => w.name == nameInput && w.guid != guid));
  } else if (dataType == AppStateDataListType.Goal) {
    return !(FFAppState()
        .Goals
        .any((w) => w.name == nameInput && w.guid != guid));
  } else if (dataType == AppStateDataListType.Budget) {
    return !(FFAppState()
        .Budgets
        .any((w) => w.name == nameInput && w.guid != guid));
  } else if (dataType == AppStateDataListType.Taxes) {
    return !(FFAppState()
        .Taxes
        .any((w) => w.name == nameInput && w.guid != guid));
  }

  return true;
}
