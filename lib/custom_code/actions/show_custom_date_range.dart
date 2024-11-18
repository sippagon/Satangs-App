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

import 'package:date_picker_plus/date_picker_plus.dart';

Future<List<DateTime>?> showCustomDateRange(BuildContext context) async {
  // Add your function code here!

  DateTimeRange? dateTimeRange = await showRangePickerDialog(
    context: context,
    minDate: DateTime(2021, 1, 1),
    maxDate: DateTime.now().add(Duration(days: 500)),
  );

  if (dateTimeRange == null) {
    return null;
  }

  return [dateTimeRange.start, dateTimeRange.end.add(Duration(hours: 24))];
}
