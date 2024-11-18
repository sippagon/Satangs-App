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

Future exportTransactionToExcel(
  DateTime? startDate,
  DateTime? endDate,
) async {
  // Add your function code here!

  var transacions = [];
  if (startDate != null && endDate != null) {
    transacions = FFAppState()
        .Transactions
        .where((w) => w.date! >= startDate && w.date! <= endDate)
        .toList();
  } else {
    transacions = FFAppState().Transactions.toList();
  }

  var excel = Excel.createExcel();
  Sheet sheetObject = excel['Sheet1'];
  setHeader(sheetObject);
  setCellValue(sheetObject, transacions);
  await saveFileToDevice(excel);
}

void setHeader(Sheet sheetObject) {
  List<String> headersKey = ['A', 'B', 'C', 'D', 'E'];
  List<String> headersValue = [
    'วันที่ทำรายการ',
    'จำนวนเงิน',
    'ประเภทรายการ',
    'หมวดหมู่',
    'กระเป๋า'
  ];

  CellStyle cellStyle = CellStyle(
      backgroundColorHex: ExcelColor.fromHexString('#74b4fc'), fontSize: 24);

  for (var i = 0; i < headersValue.length; i++) {
    var cell = sheetObject.cell(CellIndex.indexByString('${headersKey[i]}1'));
    cell.value = TextCellValue(headersValue[i]);
    cell.cellStyle = cellStyle;
  }
}

void setCellValue(Sheet sheetObject, List<dynamic> transactions) {
  for (var i = 0; i < transactions.length; i++) {
    var cellIndex = i + 2;
    var cellDate = sheetObject.cell(CellIndex.indexByString('A${cellIndex}'));
    var cellAmount = sheetObject.cell(CellIndex.indexByString('B${cellIndex}'));
    var cellType = sheetObject.cell(CellIndex.indexByString('C${cellIndex}'));
    var cellCates = sheetObject.cell(CellIndex.indexByString('D${cellIndex}'));
    var cellWallets =
        sheetObject.cell(CellIndex.indexByString('E${cellIndex}'));

    var transactionDate = transactions[i].date!;
    cellDate.value = DateTimeCellValue(
        year: transactionDate.year,
        month: transactionDate.month,
        day: transactionDate.day,
        hour: transactionDate.hour,
        minute: transactionDate.minute);

    cellAmount.value = DoubleCellValue(transactions[i].amount);

    var transactionType = transactions[i].typeId;
    if (transactionType == "Expense") {
      cellType.value = TextCellValue('ค่าใช้จ่าย');

      var category = FFAppState()
          .TransCatExpenses
          .firstWhere((w) => w.guid == transactions[i].categoryId);

      cellCates.value = TextCellValue(category.name);
    } else {
      cellType.value = TextCellValue('รายได้');

      var category = FFAppState()
          .TransCatIncomes
          .firstWhere((w) => w.guid == transactions[i].categoryId);

      cellCates.value = TextCellValue(category.name);
    }

    var wallet = FFAppState()
        .AccountList
        .firstWhere((w) => w.guid == transactions[i].accountId);
    cellWallets.value = TextCellValue(wallet.name);
  }
}

Future saveFileToDevice(Excel excel) async {
  if (await Permission.manageExternalStorage.request().isGranted ||
      await Permission.storage.request().isGranted) {
    Directory directory = Directory('/storage/emulated/0/Download');
    String path = join(directory.path, 'satang_transaction_export.xlsx');
    var fileBytes = excel.save();

    File(path)
      ..createSync(recursive: true)
      ..writeAsBytesSync(fileBytes!);
  } else {
    await Permission.manageExternalStorage.request();
  }
}
