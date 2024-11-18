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

Future<List<DonutChartDataStruct>> mapTransactionToPieChartData(
  List<TransactionStruct> transactions,
  TransactionType transType,
) async {
  // Add your function code here!

  List<TransactionCategoriesStruct> categories =
      transType == TransactionType.Income
          ? FFAppState().TransCatIncomes
          : FFAppState().TransCatExpenses;
  Map<String, double> categoryTotals = {};
  double totalAmount = 0;

  for (var transaction in transactions) {
    if (categoryTotals.containsKey(transaction.categoryId)) {
      categoryTotals[transaction.categoryId] =
          categoryTotals[transaction.categoryId]! + transaction.amount;
    } else {
      categoryTotals[transaction.categoryId] = transaction.amount;
    }
    totalAmount += transaction.amount;
  }

  List<Color> pieChartColors = [
    Color(0xFFe57373), // Red
    Color(0xFFf06292), // Pink
    Color(0xFFba68c8), // Purple
    Color(0xFF9575cd), // Deep Purple
    Color(0xFF7986cb), // Indigo
    Color(0xFF64b5f6), // Blue
    Color(0xFF4fc3f7), // Light Blue
    Color(0xFF4dd0e1), // Cyan
    Color(0xFF4db6ac), // Teal
    Color(0xFF81c784), // Green
    Color(0xFFaed581), // Light Green
    Color(0xFFdce775), // Lime
  ];

  List<DonutChartDataStruct> chartDataList = [];
  var colorIndex = 0;
  categories.forEach((category) {
    if (categoryTotals.containsKey(category.guid)) {
      double total = categoryTotals[category.guid]!;
      double percentage = (total / totalAmount) * 100;
      chartDataList.add(
        DonutChartDataStruct(
            label: '${category.name} \n ${percentage.toStringAsFixed(1)}%',
            value: percentage,
            color: pieChartColors[colorIndex],
            total: total,
            categoryName: category.name),
      );
      colorIndex++;
    }
  });

  return chartDataList;
}
