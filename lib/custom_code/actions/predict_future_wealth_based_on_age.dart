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

import 'dart:math';

Future<List<WealthLineChartDataStruct>> predictFutureWealthBasedOnAge() async {
  // Add your function code here!

  var wealthData = FFAppState().WealthInfo;
  var yearlyIncome = wealthData.yearlyIncome;
  var totalAssets = wealthData.totalAssets;
  var totalDebt = wealthData.totalDebt;

  DateTime now = DateTime.now();

  var dateOfBirth = FFAppState().DateOfBirth;
  int currentAge = now.year - dateOfBirth!.year;
  int monthDiff = now.month - dateOfBirth.month;
  int dayDiff = now.day - dateOfBirth.day;

  if (monthDiff < 0 || (monthDiff == 0 && dayDiff < 0)) {
    currentAge--;
  }

  var wealthAdditionalData = FFAppState().WealthAdditionalInfo;
  final double inflationRate = wealthAdditionalData.inflationRate / 100;
  final double incomeGrowthRate = wealthAdditionalData.incomeGrowthRate / 100;
  final double savingInterestRate = wealthAdditionalData.assetsGrowthRate / 100;

  var totalExpense = wealthAdditionalData.yearlyExpenses > 0
      ? wealthAdditionalData.yearlyExpenses
      : yearlyIncome * 0.7;

  final int maxAge = 60;
  var currentAssets = totalAssets;
  List<WealthLineChartDataStruct> results = [];
  for (int age = currentAge + 1; age <= maxAge; age++) {
    int years = age - currentAge;
    double futureIncome = yearlyIncome * pow((1 + incomeGrowthRate), years);
    double futureExpense = totalExpense * pow((1 + inflationRate), years);
    double remaining = futureIncome - futureExpense;
    currentAssets =
        ((currentAssets + remaining) * pow((1 + savingInterestRate), years));

    if (age % 5 == 0) {
      var assetYouShouleHave = (age * futureIncome) / 10.0;
      var assetYouHave = currentAssets - totalDebt;
      results.add(WealthLineChartDataStruct(
        ageDisplay: age.toString(),
        wealthYouShouldHave: assetYouShouleHave,
        wealthYouHave: assetYouHave,
      ));
    }
  }

  return results;
}
