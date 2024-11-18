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

Future<bool> validateTaxDeductMaxInvestment(
  double? socialSecurity,
  double? parentsInsurance,
  double? rmf,
  double? ssf,
  double? pvd,
  double? gpf,
  double? pensionLife,
  double? nsf,
) async {
  // Add your function code here!

  var sum = (socialSecurity ?? 0.0) +
      (parentsInsurance ?? 0.0) +
      (rmf ?? 0.0) +
      (ssf ?? 0.0) +
      (pvd ?? 0.0) +
      (gpf ?? 0.0) +
      (pensionLife ?? 0.0) +
      (nsf ?? 0.0);
  return sum <= 500000.00;
}
