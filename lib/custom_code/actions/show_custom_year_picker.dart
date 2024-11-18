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

Future<String> showCustomYearPicker(BuildContext context) async {
  // Add your function code here!
  DateTime now = DateTime.now();
  var result = 'ยังไม่ได้เลือกปี';
  await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            content: SizedBox(
          width: 300,
          height: 400,
          child: YearsPicker(
            minDate: DateTime(now.year - 5),
            maxDate: DateTime(now.year + 5),
            onDateSelected: (value) {
              result = value.year.toString();
              Navigator.pop(context);
            },
          ),
        ));
      });

  return result;
}
