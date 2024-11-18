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

Future<List<double>> calculateGoalRequiredInterestRate(
  double targetAmount,
  double currentAmount,
  double minimumPMT,
  int period,
) async {
  // Add your function code here!

  double requiredRate =
      solveForRate(targetAmount, currentAmount, minimumPMT, period);

  return [minimumPMT, (requiredRate * 100)];
}

double futureValue(double r, double pv, double pmt, int n) {
  return pv * pow(1 + r, n) + pmt * ((pow(1 + r, n) - 1) / r);
}

double solveForRate(double fv, double pv, double pmt, int n,
    {double guess = 0.05, double tolerance = 1e-6}) {
  double r = guess;
  int maxIterations = 1000;
  for (int i = 0; i < maxIterations; i++) {
    double fR = futureValue(r, pv, pmt, n) - fv;
    double fRPrime =
        (futureValue(r + tolerance, pv, pmt, n) - futureValue(r, pv, pmt, n)) /
            tolerance;

    double newR = r - fR / fRPrime;

    if ((newR - r).abs() < tolerance) {
      return newR;
    }

    r = newR;
  }

  return r;
}
