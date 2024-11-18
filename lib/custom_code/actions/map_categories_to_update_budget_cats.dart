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

Future<List<BudgetTrasactionCategoriesStruct>> mapCategoriesToUpdateBudgetCats(
  List<String> newSetOfGuid,
  String budgetGuid,
) async {
  // Add your function code here!

  var budgetOldCategories = FFAppState()
      .Budgets
      .firstWhere((w) => w.guid == budgetGuid)
      .includeCategories
      .toList();

  var results =
      budgetOldCategories.where((w) => newSetOfGuid.contains(w.guid)).map((x) {
    return BudgetTrasactionCategoriesStruct(
        guid: x.guid, name: x.name, amount: x.amount);
  }).toList();

  var addCategories =
      newSetOfGuid.where((w) => !results.any((a) => a.guid == w));

  if (addCategories.isNotEmpty) {
    var categories = FFAppState()
        .TransCatExpenses
        .where((w) => addCategories.contains(w.guid));
    List<BudgetTrasactionCategoriesStruct> addResults =
        categories.map((category) {
      return BudgetTrasactionCategoriesStruct(
          guid: category.guid, name: category.name, amount: 0);
    }).toList();

    results = new List.from(results)..addAll(addResults);
  }

  return results;
}
