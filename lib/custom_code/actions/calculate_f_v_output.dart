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

Future<FVOutputModelStruct> calculateFVOutput(
    FVInputModelStruct formInput) async {
  // Add your function code here!

  var pv = formInput.presentValue;
  var r = formInput.rate / 100;
  var n = formInput.periods;

  if (formInput.deposits > 0) {
    var pmt = formInput.deposits;
    var fvPmt = pmt * (pow(1 + r, n) - 1) / r;
    var fv = pv * pow(1 + r, n);

    var finalResult = fv + fvPmt;
    var finalDeposit = pmt * n;
    var finalIntereset = finalResult - (finalDeposit + pv);
    var finalPv = finalResult - finalIntereset;

    return FVOutputModelStruct(
        resultFv: finalResult,
        totalPresentValue: finalPv,
        totalIntereset: finalIntereset,
        totalDeposit: finalDeposit);
  } else {
    var fv = pv * pow(1 + r, n);

    var finalResult = fv;
    var finalDeposit = 0.0;
    var finalIntereset = finalResult - (finalDeposit + pv);
    var finalPv = finalResult - finalIntereset;

    return FVOutputModelStruct(
        resultFv: finalResult,
        totalPresentValue: finalPv,
        totalIntereset: finalIntereset,
        totalDeposit: finalDeposit);
  }
}
