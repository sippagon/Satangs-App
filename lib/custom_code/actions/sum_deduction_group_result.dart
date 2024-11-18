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

Future<List<double>> sumDeductionGroupResult(String taxGuid) async {
  // Add your function code here!
  var tax = FFAppState().Taxes.firstWhere((w) => w.guid == taxGuid);
  var deduction = tax.taxesDeductionInformation;

  List<double> results = [];

  var personalDeductions = [
    deduction.personal,
    deduction.spouse,
    deduction.parents,
    deduction.child,
    deduction.disabledPerson
  ];

  results.add(personalDeductions.reduce((x, y) => x + y));

  var insuranceDeduction = [
    deduction.healthInsurance,
    deduction.lifeInsurance,
    deduction.socialSecurity,
    deduction.parentsHealthInsurance,
    deduction.rmf,
    deduction.ssf,
    deduction.providentFund,
    deduction.gpf,
    deduction.pensionLifeInsurance,
    deduction.nsf,
  ];

  results.add(insuranceDeduction.reduce((x, y) => x + y));

  var donateDeduction = [
    deduction.generalDonate,
    deduction.otherDonate,
    deduction.partyDonate,
  ];

  results.add(donateDeduction.reduce((x, y) => x + y));

  return results;
}
