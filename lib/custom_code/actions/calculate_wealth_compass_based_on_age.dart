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

Future<WealthCalculateResultModelStruct> calculateWealthCompassBasedOnAge(
    double inputAge) async {
  // Add your function code here!

  final DateTime today = DateTime.now();
  final int monthLefts = 12 - today.month;

  var dateOfBirth = FFAppState().DateOfBirth;
  int currentAge = today.year - dateOfBirth!.year;
  int monthDiff = today.month - dateOfBirth.month;
  int dayDiff = today.day - dateOfBirth.day;

  if (monthDiff < 0 || (monthDiff == 0 && dayDiff < 0)) {
    currentAge--;
  }

  var wealthInfo = FFAppState().WealthInfo;
  var wealthAdditionalInfo = FFAppState().WealthAdditionalInfo;

  var totalWealth = wealthInfo.totalAssets - wealthInfo.totalDebt;

  final double incomeGrowthRate = wealthAdditionalInfo.incomeGrowthRate / 100;
  final double savingInterestRate = wealthAdditionalInfo.assetsGrowthRate / 100;

  int years = (inputAge - currentAge).round();
  double futureIncome =
      wealthInfo.yearlyIncome * pow((1 + incomeGrowthRate), years);
  var wealthYouShouldHave = (inputAge * futureIncome) / 10.0;

  var wealthYouNeedResult = wealthYouShouldHave - totalWealth;
  var interestResult = pow(wealthYouShouldHave / totalWealth, 1 / years) - 1.0;

  var monthlySavingResult = 0.0;

  if (savingInterestRate > 0.0) {
    double numerator =
        wealthYouNeedResult * pow(1 + savingInterestRate / 12, years * 12);
    double denominator = (pow(1 + savingInterestRate / 12, years * 12) - 1) /
        (savingInterestRate / 12);

    monthlySavingResult = numerator / denominator;
  } else {
    monthlySavingResult = wealthYouNeedResult / (years * 12);
  }

  return WealthCalculateResultModelStruct(
      wealthShouldHave: wealthYouShouldHave,
      wealthNeeded: wealthYouNeedResult,
      monthlySavings: monthlySavingResult,
      interestGrowthRate: interestResult);
}
