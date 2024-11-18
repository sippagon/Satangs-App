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

Future calculateTaxToBePaid(String updateGuid) async {
  // Add your function code here!
  var taxInfo = FFAppState().Taxes.firstWhere((w) => w.guid == updateGuid);
  var totalIncome = taxInfo.taxesIncomeInformation.total;

  // ลดหย่อนกลุ่มครอบครัว
  var personalAndFamily = taxInfo.personalInformation;
  var personalDeduction = 60000.0;
  var spouseDeduction = 0.0;

  if (personalAndFamily.maritalStatus == MaritalStatus.Married) {
    spouseDeduction = 60000.0;
    taxInfo.taxesDeductionInformation.spouse = 60000.0;
  }

  var parentsDeduction = 30000.0 * personalAndFamily.numberOfParent;
  var childDeduction = 30000.0 * personalAndFamily.numberOfChild;
  var disabledPersonDeduction =
      60000.0 * personalAndFamily.numberOfDisablePeople;

  var totalFamilyDeduction = personalDeduction +
      spouseDeduction +
      parentsDeduction +
      childDeduction +
      disabledPersonDeduction;

  taxInfo.taxesDeductionInformation.personal = personalDeduction;
  taxInfo.taxesDeductionInformation.spouse = spouseDeduction;
  taxInfo.taxesDeductionInformation.parents = parentsDeduction;
  taxInfo.taxesDeductionInformation.child = childDeduction;
  taxInfo.taxesDeductionInformation.disabledPerson = disabledPersonDeduction;

  // ลดหย่อนกลุ่มประกันและการลงทุน

  // รวมกันไม่เกิน 100,000
  taxInfo.taxesDeductionInformation.healthInsurance = limitDeduction(
      taxInfo.taxesDeductionInformation.healthInsurance, 25000.0);

  taxInfo.taxesDeductionInformation.lifeInsurance =
      limitDeduction(taxInfo.taxesDeductionInformation.lifeInsurance, 100000.0);

  var sumHealthAndLife = (taxInfo.taxesDeductionInformation.healthInsurance +
      taxInfo.taxesDeductionInformation.lifeInsurance);

  if (sumHealthAndLife > 100000.0) {
    var minusLife = sumHealthAndLife - 100000.0;
    var newValue = taxInfo.taxesDeductionInformation.lifeInsurance - minusLife;
    taxInfo.taxesDeductionInformation.lifeInsurance = newValue;
  }

  // รวมกันไม่เกิน 500,000
  taxInfo.taxesDeductionInformation.socialSecurity =
      limitDeduction(taxInfo.taxesDeductionInformation.socialSecurity, 9000.0);

  taxInfo.taxesDeductionInformation.parentsHealthInsurance = limitDeduction(
      taxInfo.taxesDeductionInformation.parentsHealthInsurance, 15000.0);

  var thirtyPercentOfIncome = totalIncome * 0.3;
  var fifteenPercentOfIncome = totalIncome * 0.15;

  taxInfo.taxesDeductionInformation.rmf = limitDeduction(
      taxInfo.taxesDeductionInformation.rmf, thirtyPercentOfIncome);

  taxInfo.taxesDeductionInformation.ssf = limitDeduction(
      taxInfo.taxesDeductionInformation.ssf, thirtyPercentOfIncome);

  taxInfo.taxesDeductionInformation.providentFund = limitDeduction(
      taxInfo.taxesDeductionInformation.providentFund, fifteenPercentOfIncome);

  taxInfo.taxesDeductionInformation.gpf = limitDeduction(
      taxInfo.taxesDeductionInformation.gpf, thirtyPercentOfIncome);

  taxInfo.taxesDeductionInformation.pensionLifeInsurance = limitDeduction(
      taxInfo.taxesDeductionInformation.pensionLifeInsurance,
      fifteenPercentOfIncome);

  taxInfo.taxesDeductionInformation.nsf =
      limitDeduction(taxInfo.taxesDeductionInformation.nsf, 30000.0);

  var investmentDeductionGroups = {
    'socialSecurity': taxInfo.taxesDeductionInformation.socialSecurity,
    'parentsHealthInsurance':
        taxInfo.taxesDeductionInformation.parentsHealthInsurance,
    'rmf': taxInfo.taxesDeductionInformation.rmf,
    'ssf': taxInfo.taxesDeductionInformation.ssf,
    'providentFund': taxInfo.taxesDeductionInformation.providentFund,
    'gpf': taxInfo.taxesDeductionInformation.gpf,
    'pensionLifeInsurance':
        taxInfo.taxesDeductionInformation.pensionLifeInsurance,
    'nsf': taxInfo.taxesDeductionInformation.nsf,
  };

  var sumInvestments = investmentDeductionGroups.entries
      .map((m) => m.value)
      .reduce((x, y) => x + y);

  if (sumInvestments > 500000.0) {
    var excessAmount = sumInvestments - 500000.0;

    while (excessAmount > 0) {
      var sortedEntries = investmentDeductionGroups.entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value));
      var maxEntry = sortedEntries.first;

      double reductionAmount =
          maxEntry.value >= excessAmount ? excessAmount : maxEntry.value;

      investmentDeductionGroups[maxEntry.key] =
          maxEntry.value - reductionAmount;

      if (investmentDeductionGroups[maxEntry.key] == null) {
        investmentDeductionGroups[maxEntry.key] = 0.0;
      }

      if (maxEntry.key == 'socialSecurity') {
        taxInfo.taxesDeductionInformation.socialSecurity =
            investmentDeductionGroups[maxEntry.key];
      } else if (maxEntry.key == 'parentsHealthInsurance') {
        taxInfo.taxesDeductionInformation.parentsHealthInsurance =
            investmentDeductionGroups[maxEntry.key];
      } else if (maxEntry.key == 'rmf') {
        taxInfo.taxesDeductionInformation.rmf =
            investmentDeductionGroups[maxEntry.key];
      } else if (maxEntry.key == 'ssf') {
        taxInfo.taxesDeductionInformation.ssf =
            investmentDeductionGroups[maxEntry.key];
      } else if (maxEntry.key == 'providentFund') {
        taxInfo.taxesDeductionInformation.providentFund =
            investmentDeductionGroups[maxEntry.key];
      } else if (maxEntry.key == 'gpf') {
        taxInfo.taxesDeductionInformation.gpf =
            investmentDeductionGroups[maxEntry.key];
      } else if (maxEntry.key == 'pensionLifeInsurance') {
        taxInfo.taxesDeductionInformation.pensionLifeInsurance =
            investmentDeductionGroups[maxEntry.key];
      } else if (maxEntry.key == 'nsf') {
        taxInfo.taxesDeductionInformation.nsf =
            investmentDeductionGroups[maxEntry.key];
      }

      excessAmount -= reductionAmount;
    }

    sumInvestments = investmentDeductionGroups.entries
        .map((m) => m.value)
        .reduce((x, y) => x + y);
  }

  var totalDeductionWithOutDonation =
      totalFamilyDeduction + sumHealthAndLife + sumInvestments;
  var finalRevenue = totalIncome - 100000.0 - totalDeductionWithOutDonation;

  var totalDeduction = totalDeductionWithOutDonation;

  // ลดหย่อนกลุ่มเงินบริจาค รายได้ = หักค่าใช้จ่ายและลดหย่อนอื่นๆ แล้ว
  var tenPercentOfRevenue = finalRevenue * 0.1;
  if (taxInfo.taxesDeductionInformation.generalDonate > 0) {
    taxInfo.taxesDeductionInformation.generalDonate = limitDeduction(
        taxInfo.taxesDeductionInformation.generalDonate, tenPercentOfRevenue);

    finalRevenue -= taxInfo.taxesDeductionInformation.generalDonate;
    totalDeduction += taxInfo.taxesDeductionInformation.generalDonate;
  }

  if (taxInfo.taxesDeductionInformation.otherDonate > 0) {
    taxInfo.taxesDeductionInformation.otherDonate = limitDeduction(
        taxInfo.taxesDeductionInformation.otherDonate, tenPercentOfRevenue);

    finalRevenue -= taxInfo.taxesDeductionInformation.otherDonate;
    totalDeduction += taxInfo.taxesDeductionInformation.otherDonate;
  }

  if (taxInfo.taxesDeductionInformation.partyDonate > 0) {
    taxInfo.taxesDeductionInformation.partyDonate =
        limitDeduction(taxInfo.taxesDeductionInformation.partyDonate, 10000.0);

    finalRevenue -= taxInfo.taxesDeductionInformation.partyDonate;
    totalDeduction += taxInfo.taxesDeductionInformation.partyDonate;
  }

  taxInfo.taxesDeductionInformation.total = totalDeduction;
  if (finalRevenue <= 0.0) {
    finalRevenue = 0.0;
    taxInfo.taxesToBePaid = 0.0;
  } else {
    taxInfo.taxesToBePaid = calculateTaxes(finalRevenue);
  }

  var updateIndex = FFAppState().Taxes.indexWhere((w) => w.guid == updateGuid);
  FFAppState().updateTaxesAtIndex(updateIndex, (e) => e = taxInfo);
}

double limitDeduction(double deduction, double maxLimit) {
  if (deduction > maxLimit || deduction < 0.0) {
    return deduction > maxLimit ? maxLimit : 0.0;
  }
  return deduction;
}

double calculateTaxes(double totalRevenue) {
  var tempIncome = totalRevenue;
  var result = 0.0;
  if (tempIncome > 5000000) {
    result += ((tempIncome - 5000000) * 0.35);
    tempIncome -= (tempIncome - 5000000);
  }
  if (tempIncome > 2000000) {
    result += ((tempIncome - 2000000) * 0.30);
    tempIncome -= (tempIncome - 2000000);
  }
  if (tempIncome > 1000000) {
    result += ((tempIncome - 1000000) * 0.25);
    tempIncome -= (tempIncome - 1000000);
  }
  if (tempIncome > 750000) {
    result += ((tempIncome - 750000) * 0.20);
    tempIncome -= (tempIncome - 750000);
  }
  if (tempIncome > 500000) {
    result += ((tempIncome - 500000) * 0.15);
    tempIncome -= (tempIncome - 500000);
  }
  if (tempIncome > 300000) {
    result += ((tempIncome - 300000) * 0.10);
    tempIncome -= (tempIncome - 300000);
  }
  if (tempIncome > 150000) {
    result += ((tempIncome - 150000) * 0.05);
    tempIncome -= (tempIncome - 150000);
  }

  return result;
}
