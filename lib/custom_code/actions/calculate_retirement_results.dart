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

Future<RetirementCalculationResultModelStruct> calculateRetirementResults(
    RetirementCalculationStruct formInput) async {
  // Add your function code here!

  var dateOfBirth = formInput.dateOfBirth!;
  DateTime now = DateTime.now();
  int currentAge = now.year - dateOfBirth.year;
  int monthDiff = now.month - dateOfBirth.month;
  int dayDiff = now.day - dateOfBirth.day;

  if (monthDiff < 0 || (monthDiff == 0 && dayDiff < 0)) {
    currentAge--;
  }

  var retirementAge = formInput.retirementAge;
  var lifeExpectedAge = formInput.lifeExpectedAge;
  var annualIncome = formInput.annualIncome;
  var annualExpense = formInput.annualExpenses;
  var incomeGrowthRate = formInput.incomeGrowthRate;
  var inflationRate = formInput.inflationRate;
  var currentSavingsAmount = formInput.savingsAmount;
  var monthlySavings = formInput.savingsPerMonth;
  var yearlySavings = monthlySavings * 12;
  var savingsInterest = formInput.savingsInterest;

  if (annualExpense <= 0) {
    annualExpense = (0.7 * annualIncome);
  }

  var numOfYearUntilDead = lifeExpectedAge - retirementAge;

  List<RetirementCalculationLineChartStruct> chartModel = [];

  for (int age = currentAge; age <= retirementAge; age++) {
    int years = age - currentAge;
    var tempExpenseResult =
        annualExpense * pow(1 + (inflationRate / 100), years);
    var tempIncomeResult =
        annualIncome * pow(1 + (incomeGrowthRate / 100), years);

    double tempFvSaving = currentSavingsAmount > 0
        ? currentSavingsAmount * pow(1 + (savingsInterest / 100), years)
        : 0;
    double tempFvPMTSaving = yearlySavings > 0
        ? yearlySavings *
            ((pow(1 + (savingsInterest / 100), years) - 1) /
                (savingsInterest / 100))
        : 0;
    double tempFinalResult = tempFvSaving + tempFvPMTSaving;
    chartModel.add(RetirementCalculationLineChartStruct(
        age: age,
        income: tempIncomeResult,
        expense: tempExpenseResult,
        savings: tempFinalResult));
  }

  double fvExpense = chartModel.last.expense;
  double fvIncome = chartModel.last.income;
  double fvSaving = chartModel.last.savings;

  double retirementMoneyNeeded = fvExpense *
      ((pow(1 + (inflationRate / 100), numOfYearUntilDead) - 1) /
          (inflationRate / 100));

  if (retirementMoneyNeeded > 0) {
    var elderAllowance = calculateElderlyAllowance(currentAge, lifeExpectedAge);
    retirementMoneyNeeded -= elderAllowance;
  }

  var neededToSaveMore = retirementMoneyNeeded - fvSaving;
  if (neededToSaveMore < 0) {
    neededToSaveMore = 0;
  }

  var results = RetirementCalculationResultModelStruct(
      retirementNeeded: retirementMoneyNeeded,
      futureIncomeAmount: fvIncome,
      futureExpenseAmount: fvExpense,
      futureSavingsAmount: fvSaving,
      lineChartModel: chartModel);

  return results;
}

double calculateElderlyAllowance(int currentAge, int endAge) {
  double totalAmount = 0;

  for (int age = currentAge; age <= endAge; age++) {
    if (age >= 60 && age <= 69) {
      totalAmount += (600 * 12);
    } else if (age >= 70 && age <= 79) {
      totalAmount += (700 * 12);
    } else if (age >= 80 && age <= 89) {
      totalAmount += (800 * 12);
    } else if (age >= 90) {
      totalAmount += (1000 * 12);
    }
  }

  return totalAmount;
}
