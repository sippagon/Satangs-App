import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';

double sumCurrentAmount(List<double> amounts) {
  double sumActiveAmounts =
      amounts.fold(0.0, (previousValue, element) => previousValue + element);

  return sumActiveAmounts;
}

List<TransactionStruct>? filterOnlyTodayTrans(
    List<TransactionStruct> transactions) {
  // Get today's date
  DateTime today = DateTime.now();
  DateFormat formatter = DateFormat('yyyy-MM-dd');
  String todayString = formatter.format(today);

  // Filter the list to only include items with today's date
  List<TransactionStruct>? filteredList = transactions.where((a) {
    String aDateString = formatter.format(a.date!);
    return aDateString == todayString;
  }).toList();

  if (!filteredList.isEmpty) {
    filteredList.sort((a, b) {
      if (a.createOnLocalTime == null) return 1; // Place null dates at the end
      if (b.createOnLocalTime == null) return -1; // Place null dates at the end
      return b.createOnLocalTime!.compareTo(a.createOnLocalTime!);
    });

    filteredList.sort((a, b) {
      if (a.date == null) return 1; // Place null dates at the end
      if (b.date == null) return -1; // Place null dates at the end
      return b.date!.compareTo(a.date!);
    });
  }

  return filteredList;
}

List<DateTime> getFilterDateRange(DateFilterRange rangeType) {
  DateTime now = DateTime.now();
  DateTime nextMonth = DateTime(now.year, now.month + 1, 1);
  DateTime startOfCurrMonth = DateTime(now.year, now.month, 1);
  DateTime endOfCurrMonth =
      DateTime(nextMonth.year, nextMonth.month, nextMonth.day - 1);

  if (rangeType == DateFilterRange.oneMonth) {
    return [startOfCurrMonth, endOfCurrMonth];
  } else if (rangeType == DateFilterRange.threeMonth) {
    DateTime threeMonthsAgo = DateTime(now.year, now.month - 3, 1);
    return [startOfCurrMonth, threeMonthsAgo];
  } else if (rangeType == DateFilterRange.thisYear) {
    DateTime startOfThisYear = DateTime(now.year, 1, 1);
    return [startOfCurrMonth, startOfThisYear];
  }

  return [startOfCurrMonth, endOfCurrMonth];

  // Calculate the date three months ago
}

DateTime dateTimeFromString(String dateString) {
  DateFormat dateFormat = DateFormat('d/M/y H:mm'); // Specify the date format
  DateTime parsedDate = dateFormat.parse(dateString);

  return parsedDate;
}

List<TransactionStruct> sortTransactionList(List<TransactionStruct> input) {
  List<TransactionStruct> sortedLists = input.toList();
  sortedLists.sort((a, b) {
    if (a.createOnLocalTime == null) return 1; // Place null dates at the end
    if (b.createOnLocalTime == null) return -1; // Place null dates at the end
    return b.createOnLocalTime!.compareTo(a.createOnLocalTime!);
  });

  sortedLists.sort((a, b) {
    if (a.date == null) return 1; // Place null dates at the end
    if (b.date == null) return -1; // Place null dates at the end
    return b.date!.compareTo(a.date!);
  });

  return sortedLists;
}

double calculateSavingAmountPerMonthForGoal(
  double currentBalance,
  DateTime targetDate,
  double savingInterest,
  double targetAmount,
) {
  final DateTime today = DateTime.now();
  int months =
      (targetDate.year - today.year) * 12 + targetDate.month - today.month;

  if (months <= 0) {
    months = 1;
  }

  final double monthlyInterestRate = (savingInterest / 12) / 100;
  final double fvCurrentBalance =
      currentBalance * math.pow(1 + monthlyInterestRate, months);
  final double monthlySaving = (targetAmount - fvCurrentBalance) / months;

  return monthlySaving;
}

int calculateDaysDiffFromPresent(DateTime targetDate) {
  final DateTime today = DateTime.now();
  return targetDate.difference(today).inDays;
}

double getSumOfBudgetTransaction(
  List<String> categoriesGuid,
  List<TransactionStruct>? transactions,
) {
  if (transactions == null ||
      !transactions.any((w) => categoriesGuid.contains(w.categoryId))) {
    return 0.0;
  }
  var sum = transactions
      .where((w) => categoriesGuid.contains(w.categoryId))
      .map((m) => m.amount)
      .reduce((x, y) => x + y);
  return sum;
}

int getUserAge(DateTime dateOfBirth) {
  DateTime now = DateTime.now();
  int currentAge = now.year - dateOfBirth.year;
  int monthDiff = now.month - dateOfBirth.month;
  int dayDiff = now.day - dateOfBirth.day;

  if (monthDiff < 0 || (monthDiff == 0 && dayDiff < 0)) {
    currentAge--;
  }

  return currentAge;
}

DateTime getWealthGoalTargetDate(
  DateTime dateOfBirth,
  double targetAge,
) {
  DateTime now = DateTime.now();
  int currentAge = now.year - dateOfBirth.year;
  int monthDiff = now.month - dateOfBirth.month;
  int dayDiff = now.day - dateOfBirth.day;

  if (monthDiff < 0 || (monthDiff == 0 && dayDiff < 0)) {
    currentAge--;
  }

  var nYears = (targetAge - currentAge).round();

  var result = DateTime(now.year + nYears, now.month, now.day);
  return result;
}

double sumTotalTaxesDeducitonByType(
  TaxesDeductionStruct input,
  TaxsDeductionGroup type,
) {
  var result = 0.0;

  if (type == TaxsDeductionGroup.PersonalOrFamily) {
    var personalDeductions = [
      input.personal,
      input.spouse,
      input.parents,
      input.child,
      input.disabledPerson
    ];

    result = personalDeductions.reduce((x, y) => x + y) + 100000.0;
  } else if (type == TaxsDeductionGroup.InsuranceOrInvestments) {
    var insuranceDeduction = [
      input.healthInsurance,
      input.lifeInsurance,
      input.socialSecurity,
      input.parentsHealthInsurance,
      input.rmf,
      input.ssf,
      input.providentFund,
      input.gpf,
      input.pensionLifeInsurance,
      input.nsf,
    ];

    result = insuranceDeduction.reduce((x, y) => x + y);
  } else if (type == TaxsDeductionGroup.Donation) {
    var donateDeduction = [
      input.generalDonate,
      input.otherDonate,
      input.partyDonate,
    ];

    result = donateDeduction.reduce((x, y) => x + y);
  }

  return result;
}

DateTime dateFromString(String dateString) {
  DateFormat dateFormat = DateFormat('d/M/y'); // Specify the date format
  DateTime parsedDate = dateFormat.parse(dateString);

  return parsedDate;
}

bool taxDeductionValidateMaxValue(
  String? input,
  double max,
) {
  if (input == null || input.isEmpty) {
    return true;
  }

  var parseInput = double.parse(input);
  return parseInput <= max;
}
