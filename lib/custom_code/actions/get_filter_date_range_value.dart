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

Future<List<DateTime>> getFilterDateRangeValue(
    DateFilterRange rangeType) async {
  // Add your function code here!
  DateTime now = DateTime.now();
  DateTime nextMonth = DateTime(now.year, now.month + 1, 1);
  DateTime startOfCurrMonth = DateTime(now.year, now.month, 1);
  DateTime endOfCurrMonth =
      DateTime(nextMonth.year, nextMonth.month, nextMonth.day - 1, 23, 59, 59);

  if (rangeType == DateFilterRange.oneMonth) {
    return [startOfCurrMonth, endOfCurrMonth];
  } else if (rangeType == DateFilterRange.threeMonth) {
    DateTime threeMonthsAgo = DateTime(now.year, now.month - 3, 1);
    return [threeMonthsAgo, endOfCurrMonth];
  } else if (rangeType == DateFilterRange.thisYear) {
    DateTime startOfThisYear = DateTime(now.year, 1, 1);
    return [startOfThisYear, endOfCurrMonth];
  }

  return [startOfCurrMonth, endOfCurrMonth];
}
