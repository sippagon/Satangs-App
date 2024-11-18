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

import 'dart:io';
import 'dart:convert' show utf8;
import 'package:path/path.dart';
import 'package:excel/excel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

Future exportGoalToExcel() async {
  // Add your function code here!
  var goals = FFAppState().Goals.toList();

  var excel = Excel.createExcel();
  Sheet sheetObject = excel['Sheet1'];
  setHeader(sheetObject);
  setCellValue(sheetObject, goals);
  await saveFileToDevice(excel);
}

void setHeader(Sheet sheetObject) {
  List<String> headersKey = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
  ];
  List<String> headersValue = [
    'ชื่อ',
    'ยอดเป้าหมาย',
    'เงินเก็บที่มีอยู่',
    'วันครบกำหนด',
    'รายได้ต่อเดือน',
    'รายจ่ายต่อเดือน',
    'อัตราดอกเบี้ยต่อปี',
    'อัตราการเติบโตของรายได้ต่อปี',
    'Percent complete',
  ];

  CellStyle cellStyle = CellStyle(
      backgroundColorHex: ExcelColor.fromHexString('#74b4fc'), fontSize: 14);

  for (var i = 0; i < headersValue.length; i++) {
    var cell = sheetObject.cell(CellIndex.indexByString('${headersKey[i]}1'));
    cell.value = TextCellValue(headersValue[i]);
    cell.cellStyle = cellStyle;
  }
}

void setCellValue(Sheet sheetObject, List<GoalStruct> goals) {
  List<String> headersKey = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
  ];
  for (var i = 0; i < goals.length; i++) {
    var cellIndex = i + 2;

    for (var y = 0; y < headersKey.length; y++) {
      var cell = sheetObject
          .cell(CellIndex.indexByString('${headersKey[y]}${cellIndex}'));

      switch (y) {
        case 0:
          cell.value = TextCellValue(goals[i].name);
          break;
        case 1:
          cell.value = DoubleCellValue(goals[i].targetAmount);
          break;
        case 2:
          cell.value = DoubleCellValue(goals[i].currentBalance);
          break;
        case 3:
          cell.value = DateCellValue.fromDateTime(goals[i].targetDate!);
          break;
        case 4:
          cell.value = DoubleCellValue(goals[i].monthlyIncome);
          break;
        case 5:
          cell.value = DoubleCellValue(goals[i].monthlyExpense);
          break;
        case 6:
          cell.value = DoubleCellValue(goals[i].savingInterestRate);
          break;
        case 7:
          cell.value = DoubleCellValue(goals[i].incomeGrowthRate);
          break;
        case 8:
          cell.value = DoubleCellValue(goals[i].progressPercatage * 100);
          break;
      }
    }
  }
}

Future saveFileToDevice(Excel excel) async {
  if (await Permission.manageExternalStorage.request().isGranted ||
      await Permission.storage.request().isGranted) {
    Directory directory = Directory('/storage/emulated/0/Download');
    String path = join(directory!.path, 'Download/satang_goal_export.xlsx');
    var fileBytes = excel.save();

    File(path)
      ..createSync(recursive: true)
      ..writeAsBytesSync(fileBytes!);
  } else {
    await Permission.manageExternalStorage.request();
  }
}
