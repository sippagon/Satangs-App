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

Future<WealthInfoViewModelStruct> calculateWealthInfo() async {
  // Add your function code here!

  var today = DateTime.now();
  var dateOfBirth = FFAppState().DateOfBirth;
  var wealthInformation = FFAppState().WealthInfo;

  int age = today.year - dateOfBirth!.year;
  int monthDiff = today.month - dateOfBirth.month;
  int dayDiff = today.day - dateOfBirth.day;

  if (monthDiff < 0 || (monthDiff == 0 && dayDiff < 0)) {
    age--;
  }

  /*
  var netCash = FFAppState()
      .AccountList
      .map((m) => m.currentAmount)
      .reduce((x, y) => x + y);
  */

  DateTime nextMonth = DateTime(today.year, today.month + 1, 1);
  DateTime startOfCurrMonth = DateTime(today.year, today.month, 1);
  DateTime endOfCurrMonth =
      DateTime(nextMonth.year, nextMonth.month, nextMonth.day - 1);

  var incomeTransactions = FFAppState()
      .Transactions
      .where((w) =>
          w.typeId == "Income" &&
          w.date! >= startOfCurrMonth &&
          w.date! <= endOfCurrMonth)
      .toList();
  var expenseTransactions = FFAppState()
      .Transactions
      .where((w) =>
          w.typeId == "Expense" &&
          w.date! >= startOfCurrMonth &&
          w.date! <= endOfCurrMonth)
      .toList();

  var incomeAssetCategoriesGuid = [
    "fdd5be6a-af07-4b2b-828e-91ebb7ab04b5",
    "80ecaf6e-abbc-4903-a5fa-bcbd16f525c1",
    "b59cd850-049f-42d8-89aa-25687564caa6",
    "3c600a1f-534e-4dd8-a78a-fa9f4c33b221"
  ];

  var assetsIncomes = incomeTransactions
      .where((w) => incomeAssetCategoriesGuid.contains(w.categoryId))
      .toList();
  var netAssetsIncomeMonthly = 0.0;
  if (assetsIncomes.isNotEmpty) {
    netAssetsIncomeMonthly =
        assetsIncomes.map((m) => m.amount).reduce((x, y) => x + y);
  }

  var netExpenseCurrMonth = 0.0;
  if (expenseTransactions.isNotEmpty) {
    netExpenseCurrMonth =
        expenseTransactions.map((m) => m.amount).reduce((x, y) => x + y);
  }

  var netWealth = wealthInformation.totalAssets - wealthInformation.totalDebt;
  var netWealthYouShouldHave = (age * wealthInformation.yearlyIncome) / 10;
  var wealthRatioResult = netExpenseCurrMonth > 0
      ? netAssetsIncomeMonthly / netExpenseCurrMonth
      : 0.0;

  var result = WealthInfoViewModelStruct(
    userAge: age,
    netWealth: netWealth > 0.0 ? netWealth : 0.0,
    netWealthYouShouldHave:
        netWealthYouShouldHave > 0.0 ? netWealthYouShouldHave : 0.0,
    wealthRatio: wealthRatioResult > 0.0 ? wealthRatioResult : 0.0,
  );

  return result;
}
