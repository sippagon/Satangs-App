import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = const FlutterSecureStorage();
    await _safeInitAsync(() async {
      _AccountList = (await secureStorage.getStringList('ff_AccountList'))
              ?.map((x) {
                try {
                  return AccountsStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _AccountList;
    });
    await _safeInitAsync(() async {
      _TransCatIncomes =
          (await secureStorage.getStringList('ff_TransCatIncomes'))
                  ?.map((x) {
                    try {
                      return TransactionCategoriesStruct.fromSerializableMap(
                          jsonDecode(x));
                    } catch (e) {
                      print("Can't decode persisted data type. Error: $e.");
                      return null;
                    }
                  })
                  .withoutNulls
                  .toList() ??
              _TransCatIncomes;
    });
    await _safeInitAsync(() async {
      _TransCatExpenses =
          (await secureStorage.getStringList('ff_TransCatExpenses'))
                  ?.map((x) {
                    try {
                      return TransactionCategoriesStruct.fromSerializableMap(
                          jsonDecode(x));
                    } catch (e) {
                      print("Can't decode persisted data type. Error: $e.");
                      return null;
                    }
                  })
                  .withoutNulls
                  .toList() ??
              _TransCatExpenses;
    });
    await _safeInitAsync(() async {
      _Transactions = (await secureStorage.getStringList('ff_Transactions'))
              ?.map((x) {
                try {
                  return TransactionStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _Transactions;
    });
    await _safeInitAsync(() async {
      _Goals = (await secureStorage.getStringList('ff_Goals'))
              ?.map((x) {
                try {
                  return GoalStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _Goals;
    });
    await _safeInitAsync(() async {
      _Budgets = (await secureStorage.getStringList('ff_Budgets'))
              ?.map((x) {
                try {
                  return BudgetStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _Budgets;
    });
    await _safeInitAsync(() async {
      _DateOfBirth = await secureStorage.read(key: 'ff_DateOfBirth') != null
          ? DateTime.fromMillisecondsSinceEpoch(
              (await secureStorage.getInt('ff_DateOfBirth'))!)
          : _DateOfBirth;
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_WealthInfo') != null) {
        try {
          final serializedData =
              await secureStorage.getString('ff_WealthInfo') ?? '{}';
          _WealthInfo =
              WealthInfoStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_WealthAdditionalInfo') != null) {
        try {
          final serializedData =
              await secureStorage.getString('ff_WealthAdditionalInfo') ?? '{}';
          _WealthAdditionalInfo =
              WealthInfoAdditionalStruct.fromSerializableMap(
                  jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      _Taxes = (await secureStorage.getStringList('ff_Taxes'))
              ?.map((x) {
                try {
                  return TaxesStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _Taxes;
    });
    await _safeInitAsync(() async {
      _TaxesIncomeTypes =
          (await secureStorage.getStringList('ff_TaxesIncomeTypes'))
                  ?.map((x) {
                    try {
                      return TaxesIncomeTypeStruct.fromSerializableMap(
                          jsonDecode(x));
                    } catch (e) {
                      print("Can't decode persisted data type. Error: $e.");
                      return null;
                    }
                  })
                  .withoutNulls
                  .toList() ??
              _TaxesIncomeTypes;
    });
    await _safeInitAsync(() async {
      _TaxesDeductionTypes =
          (await secureStorage.getStringList('ff_TaxesDeductionTypes'))
                  ?.map((x) {
                    try {
                      return TaxesDeductionTypeStruct.fromSerializableMap(
                          jsonDecode(x));
                    } catch (e) {
                      print("Can't decode persisted data type. Error: $e.");
                      return null;
                    }
                  })
                  .withoutNulls
                  .toList() ??
              _TaxesDeductionTypes;
    });
    await _safeInitAsync(() async {
      _InitialWealth =
          await secureStorage.getBool('ff_InitialWealth') ?? _InitialWealth;
    });
    await _safeInitAsync(() async {
      _InitialHomePageWT =
          await secureStorage.getBool('ff_InitialHomePageWT') ??
              _InitialHomePageWT;
    });
    await _safeInitAsync(() async {
      _initialTransactionHistoryPageWT =
          await secureStorage.getBool('ff_initialTransactionHistoryPageWT') ??
              _initialTransactionHistoryPageWT;
    });
    await _safeInitAsync(() async {
      _initialGoalBudgetWT =
          await secureStorage.getBool('ff_initialGoalBudgetWT') ??
              _initialGoalBudgetWT;
    });
    await _safeInitAsync(() async {
      _initialReportWT =
          await secureStorage.getBool('ff_initialReportWT') ?? _initialReportWT;
    });
    await _safeInitAsync(() async {
      _initialAccountWT = await secureStorage.getBool('ff_initialAccountWT') ??
          _initialAccountWT;
    });
    await _safeInitAsync(() async {
      _initialGoalDetailPageWT =
          await secureStorage.getBool('ff_initialGoalDetailPageWT') ??
              _initialGoalDetailPageWT;
    });
    await _safeInitAsync(() async {
      _initialBudgetDetailPageWT =
          await secureStorage.getBool('ff_initialBudgetDetailPageWT') ??
              _initialBudgetDetailPageWT;
    });
    await _safeInitAsync(() async {
      _initialTaxManagementPageWT =
          await secureStorage.getBool('ff_initialTaxManagementPageWT') ??
              _initialTaxManagementPageWT;
    });
    await _safeInitAsync(() async {
      _initialTaxDetailPageWT =
          await secureStorage.getBool('ff_initialTaxDetailPageWT') ??
              _initialTaxDetailPageWT;
    });
    await _safeInitAsync(() async {
      _initialWealthInfoPageWT =
          await secureStorage.getBool('ff_initialWealthInfoPageWT') ??
              _initialWealthInfoPageWT;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  List<AccountsStruct> _AccountList = [];
  List<AccountsStruct> get AccountList => _AccountList;
  set AccountList(List<AccountsStruct> value) {
    _AccountList = value;
    secureStorage.setStringList(
        'ff_AccountList', value.map((x) => x.serialize()).toList());
  }

  void deleteAccountList() {
    secureStorage.delete(key: 'ff_AccountList');
  }

  void addToAccountList(AccountsStruct value) {
    AccountList.add(value);
    secureStorage.setStringList(
        'ff_AccountList', _AccountList.map((x) => x.serialize()).toList());
  }

  void removeFromAccountList(AccountsStruct value) {
    AccountList.remove(value);
    secureStorage.setStringList(
        'ff_AccountList', _AccountList.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromAccountList(int index) {
    AccountList.removeAt(index);
    secureStorage.setStringList(
        'ff_AccountList', _AccountList.map((x) => x.serialize()).toList());
  }

  void updateAccountListAtIndex(
    int index,
    AccountsStruct Function(AccountsStruct) updateFn,
  ) {
    AccountList[index] = updateFn(_AccountList[index]);
    secureStorage.setStringList(
        'ff_AccountList', _AccountList.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInAccountList(int index, AccountsStruct value) {
    AccountList.insert(index, value);
    secureStorage.setStringList(
        'ff_AccountList', _AccountList.map((x) => x.serialize()).toList());
  }

  List<TransactionCategoriesStruct> _TransCatIncomes = [
    TransactionCategoriesStruct.fromSerializableMap(jsonDecode(
        '{\"guid\":\"42cfb58a-8322-476c-b021-3fd89284b723\",\"name\":\"เงินเดือน\",\"nameEn\":\"Salary\",\"type\":\"Income\",\"sequence\":\"1\",\"active\":\"true\"}')),
    TransactionCategoriesStruct.fromSerializableMap(jsonDecode(
        '{\"guid\":\"87301e2b-8fc0-4fb0-94e7-987ddae77715\",\"name\":\"โบนัส\",\"nameEn\":\"Bonus\",\"type\":\"Income\",\"sequence\":\"2\",\"active\":\"true\"}')),
    TransactionCategoriesStruct.fromSerializableMap(jsonDecode(
        '{\"guid\":\"c6192ac6-147a-4064-b979-b45392e50124\",\"name\":\"เบี้ยเลี้ยง\",\"nameEn\":\"Allowance\",\"type\":\"Income\",\"sequence\":\"3\",\"active\":\"true\"}')),
    TransactionCategoriesStruct.fromSerializableMap(jsonDecode(
        '{\"guid\":\"481bc151-4765-4305-8fac-d941370456ad\",\"name\":\"ค่าจ้าง\",\"nameEn\":\"Wages\",\"type\":\"Income\",\"sequence\":\"4\",\"active\":\"true\"}')),
    TransactionCategoriesStruct.fromSerializableMap(jsonDecode(
        '{\"guid\":\"fdd5be6a-af07-4b2b-828e-91ebb7ab04b5\",\"name\":\"ดอกเบี้ย\",\"nameEn\":\"Interest\",\"type\":\"Income\",\"sequence\":\"5\",\"active\":\"true\"}')),
    TransactionCategoriesStruct.fromSerializableMap(jsonDecode(
        '{\"guid\":\"80ecaf6e-abbc-4903-a5fa-bcbd16f525c1\",\"name\":\"เงินปันผล\",\"nameEn\":\"Dividend\",\"type\":\"Income\",\"sequence\":\"6\",\"active\":\"true\"}')),
    TransactionCategoriesStruct.fromSerializableMap(jsonDecode(
        '{\"guid\":\"b59cd850-049f-42d8-89aa-25687564caa6\",\"name\":\"ลงทุน\",\"nameEn\":\"Investments\",\"type\":\"Income\",\"sequence\":\"7\",\"active\":\"true\"}')),
    TransactionCategoriesStruct.fromSerializableMap(jsonDecode(
        '{\"guid\":\"3c600a1f-534e-4dd8-a78a-fa9f4c33b221\",\"name\":\"ค่าเช่า\",\"nameEn\":\"Rent\",\"type\":\"Income\",\"sequence\":\"8\",\"active\":\"true\"}')),
    TransactionCategoriesStruct.fromSerializableMap(jsonDecode(
        '{\"guid\":\"bb9778d0-f0bf-4651-8e95-b0ae8a930e8a\",\"name\":\"อื่นๆ\",\"nameEn\":\"Other\",\"type\":\"Income\",\"sequence\":\"9\",\"active\":\"true\"}'))
  ];
  List<TransactionCategoriesStruct> get TransCatIncomes => _TransCatIncomes;
  set TransCatIncomes(List<TransactionCategoriesStruct> value) {
    _TransCatIncomes = value;
    secureStorage.setStringList(
        'ff_TransCatIncomes', value.map((x) => x.serialize()).toList());
  }

  void deleteTransCatIncomes() {
    secureStorage.delete(key: 'ff_TransCatIncomes');
  }

  void addToTransCatIncomes(TransactionCategoriesStruct value) {
    TransCatIncomes.add(value);
    secureStorage.setStringList('ff_TransCatIncomes',
        _TransCatIncomes.map((x) => x.serialize()).toList());
  }

  void removeFromTransCatIncomes(TransactionCategoriesStruct value) {
    TransCatIncomes.remove(value);
    secureStorage.setStringList('ff_TransCatIncomes',
        _TransCatIncomes.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromTransCatIncomes(int index) {
    TransCatIncomes.removeAt(index);
    secureStorage.setStringList('ff_TransCatIncomes',
        _TransCatIncomes.map((x) => x.serialize()).toList());
  }

  void updateTransCatIncomesAtIndex(
    int index,
    TransactionCategoriesStruct Function(TransactionCategoriesStruct) updateFn,
  ) {
    TransCatIncomes[index] = updateFn(_TransCatIncomes[index]);
    secureStorage.setStringList('ff_TransCatIncomes',
        _TransCatIncomes.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInTransCatIncomes(
      int index, TransactionCategoriesStruct value) {
    TransCatIncomes.insert(index, value);
    secureStorage.setStringList('ff_TransCatIncomes',
        _TransCatIncomes.map((x) => x.serialize()).toList());
  }

  List<TransactionCategoriesStruct> _TransCatExpenses = [
    TransactionCategoriesStruct.fromSerializableMap(jsonDecode(
        '{\"guid\":\"128165b5-074a-4ce2-8bfb-575a30a3a758\",\"name\":\"อาหาร\",\"nameEn\":\"Food\",\"type\":\"Expense\",\"sequence\":\"1\",\"active\":\"true\"}')),
    TransactionCategoriesStruct.fromSerializableMap(jsonDecode(
        '{\"guid\":\"e0ffc93f-c65c-4a97-9500-592826ebf3a9\",\"name\":\"บิลและค่าสาธารณูปโภค\",\"nameEn\":\"Bill & Utilities\",\"type\":\"Expense\",\"sequence\":\"2\",\"active\":\"true\"}')),
    TransactionCategoriesStruct.fromSerializableMap(jsonDecode(
        '{\"guid\":\"68f6e8b6-ef3d-441b-a88a-a65f038474ae\",\"name\":\"ค่าเดินทาง\",\"nameEn\":\"Transportation\",\"type\":\"Expense\",\"sequence\":\"3\",\"active\":\"true\"}')),
    TransactionCategoriesStruct.fromSerializableMap(jsonDecode(
        '{\"guid\":\"717496af-dc04-43cf-ab75-a48bf17a0579\",\"name\":\"เสริมสวย\",\"nameEn\":\"Beautify\",\"type\":\"Expense\",\"sequence\":\"4\",\"active\":\"true\"}')),
    TransactionCategoriesStruct.fromSerializableMap(jsonDecode(
        '{\"guid\":\"35e7d638-83b8-45fb-9fec-a40719d1249f\",\"name\":\"ค่ารักษาพยาบาล\",\"nameEn\":\"Medical expenses\",\"type\":\"Expense\",\"sequence\":\"5\",\"active\":\"true\"}')),
    TransactionCategoriesStruct.fromSerializableMap(jsonDecode(
        '{\"guid\":\"2c283969-64b9-4fea-b910-e40f3a7bca27\",\"name\":\"ครัวเรือน\",\"nameEn\":\"Household\",\"type\":\"Expense\",\"sequence\":\"6\",\"active\":\"true\"}')),
    TransactionCategoriesStruct.fromSerializableMap(jsonDecode(
        '{\"guid\":\"5918a855-632c-4936-b492-577652b54840\",\"name\":\"ภาษี\",\"nameEn\":\"Tax\",\"type\":\"Expense\",\"sequence\":\"7\",\"active\":\"true\"}')),
    TransactionCategoriesStruct.fromSerializableMap(jsonDecode(
        '{\"guid\":\"c7a2912b-c74b-4962-a03a-659b63f0948d\",\"name\":\"การลงทุน\",\"nameEn\":\"Investment\",\"type\":\"Expense\",\"sequence\":\"8\",\"active\":\"true\"}')),
    TransactionCategoriesStruct.fromSerializableMap(jsonDecode(
        '{\"guid\":\"670573e5-516b-4115-a013-ab099b093d0e\",\"name\":\"อื่นๆ\",\"nameEn\":\"Other\",\"type\":\"Expense\",\"sequence\":\"9\",\"active\":\"true\"}'))
  ];
  List<TransactionCategoriesStruct> get TransCatExpenses => _TransCatExpenses;
  set TransCatExpenses(List<TransactionCategoriesStruct> value) {
    _TransCatExpenses = value;
    secureStorage.setStringList(
        'ff_TransCatExpenses', value.map((x) => x.serialize()).toList());
  }

  void deleteTransCatExpenses() {
    secureStorage.delete(key: 'ff_TransCatExpenses');
  }

  void addToTransCatExpenses(TransactionCategoriesStruct value) {
    TransCatExpenses.add(value);
    secureStorage.setStringList('ff_TransCatExpenses',
        _TransCatExpenses.map((x) => x.serialize()).toList());
  }

  void removeFromTransCatExpenses(TransactionCategoriesStruct value) {
    TransCatExpenses.remove(value);
    secureStorage.setStringList('ff_TransCatExpenses',
        _TransCatExpenses.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromTransCatExpenses(int index) {
    TransCatExpenses.removeAt(index);
    secureStorage.setStringList('ff_TransCatExpenses',
        _TransCatExpenses.map((x) => x.serialize()).toList());
  }

  void updateTransCatExpensesAtIndex(
    int index,
    TransactionCategoriesStruct Function(TransactionCategoriesStruct) updateFn,
  ) {
    TransCatExpenses[index] = updateFn(_TransCatExpenses[index]);
    secureStorage.setStringList('ff_TransCatExpenses',
        _TransCatExpenses.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInTransCatExpenses(
      int index, TransactionCategoriesStruct value) {
    TransCatExpenses.insert(index, value);
    secureStorage.setStringList('ff_TransCatExpenses',
        _TransCatExpenses.map((x) => x.serialize()).toList());
  }

  List<TransactionStruct> _Transactions = [];
  List<TransactionStruct> get Transactions => _Transactions;
  set Transactions(List<TransactionStruct> value) {
    _Transactions = value;
    secureStorage.setStringList(
        'ff_Transactions', value.map((x) => x.serialize()).toList());
  }

  void deleteTransactions() {
    secureStorage.delete(key: 'ff_Transactions');
  }

  void addToTransactions(TransactionStruct value) {
    Transactions.add(value);
    secureStorage.setStringList(
        'ff_Transactions', _Transactions.map((x) => x.serialize()).toList());
  }

  void removeFromTransactions(TransactionStruct value) {
    Transactions.remove(value);
    secureStorage.setStringList(
        'ff_Transactions', _Transactions.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromTransactions(int index) {
    Transactions.removeAt(index);
    secureStorage.setStringList(
        'ff_Transactions', _Transactions.map((x) => x.serialize()).toList());
  }

  void updateTransactionsAtIndex(
    int index,
    TransactionStruct Function(TransactionStruct) updateFn,
  ) {
    Transactions[index] = updateFn(_Transactions[index]);
    secureStorage.setStringList(
        'ff_Transactions', _Transactions.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInTransactions(int index, TransactionStruct value) {
    Transactions.insert(index, value);
    secureStorage.setStringList(
        'ff_Transactions', _Transactions.map((x) => x.serialize()).toList());
  }

  List<GoalStruct> _Goals = [];
  List<GoalStruct> get Goals => _Goals;
  set Goals(List<GoalStruct> value) {
    _Goals = value;
    secureStorage.setStringList(
        'ff_Goals', value.map((x) => x.serialize()).toList());
  }

  void deleteGoals() {
    secureStorage.delete(key: 'ff_Goals');
  }

  void addToGoals(GoalStruct value) {
    Goals.add(value);
    secureStorage.setStringList(
        'ff_Goals', _Goals.map((x) => x.serialize()).toList());
  }

  void removeFromGoals(GoalStruct value) {
    Goals.remove(value);
    secureStorage.setStringList(
        'ff_Goals', _Goals.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromGoals(int index) {
    Goals.removeAt(index);
    secureStorage.setStringList(
        'ff_Goals', _Goals.map((x) => x.serialize()).toList());
  }

  void updateGoalsAtIndex(
    int index,
    GoalStruct Function(GoalStruct) updateFn,
  ) {
    Goals[index] = updateFn(_Goals[index]);
    secureStorage.setStringList(
        'ff_Goals', _Goals.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInGoals(int index, GoalStruct value) {
    Goals.insert(index, value);
    secureStorage.setStringList(
        'ff_Goals', _Goals.map((x) => x.serialize()).toList());
  }

  List<GoalMonthSavingDataTableStruct> _TempGoalSavingDataTable = [];
  List<GoalMonthSavingDataTableStruct> get TempGoalSavingDataTable =>
      _TempGoalSavingDataTable;
  set TempGoalSavingDataTable(List<GoalMonthSavingDataTableStruct> value) {
    _TempGoalSavingDataTable = value;
  }

  void addToTempGoalSavingDataTable(GoalMonthSavingDataTableStruct value) {
    TempGoalSavingDataTable.add(value);
  }

  void removeFromTempGoalSavingDataTable(GoalMonthSavingDataTableStruct value) {
    TempGoalSavingDataTable.remove(value);
  }

  void removeAtIndexFromTempGoalSavingDataTable(int index) {
    TempGoalSavingDataTable.removeAt(index);
  }

  void updateTempGoalSavingDataTableAtIndex(
    int index,
    GoalMonthSavingDataTableStruct Function(GoalMonthSavingDataTableStruct)
        updateFn,
  ) {
    TempGoalSavingDataTable[index] = updateFn(_TempGoalSavingDataTable[index]);
  }

  void insertAtIndexInTempGoalSavingDataTable(
      int index, GoalMonthSavingDataTableStruct value) {
    TempGoalSavingDataTable.insert(index, value);
  }

  List<BudgetStruct> _Budgets = [];
  List<BudgetStruct> get Budgets => _Budgets;
  set Budgets(List<BudgetStruct> value) {
    _Budgets = value;
    secureStorage.setStringList(
        'ff_Budgets', value.map((x) => x.serialize()).toList());
  }

  void deleteBudgets() {
    secureStorage.delete(key: 'ff_Budgets');
  }

  void addToBudgets(BudgetStruct value) {
    Budgets.add(value);
    secureStorage.setStringList(
        'ff_Budgets', _Budgets.map((x) => x.serialize()).toList());
  }

  void removeFromBudgets(BudgetStruct value) {
    Budgets.remove(value);
    secureStorage.setStringList(
        'ff_Budgets', _Budgets.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromBudgets(int index) {
    Budgets.removeAt(index);
    secureStorage.setStringList(
        'ff_Budgets', _Budgets.map((x) => x.serialize()).toList());
  }

  void updateBudgetsAtIndex(
    int index,
    BudgetStruct Function(BudgetStruct) updateFn,
  ) {
    Budgets[index] = updateFn(_Budgets[index]);
    secureStorage.setStringList(
        'ff_Budgets', _Budgets.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInBudgets(int index, BudgetStruct value) {
    Budgets.insert(index, value);
    secureStorage.setStringList(
        'ff_Budgets', _Budgets.map((x) => x.serialize()).toList());
  }

  DateTime? _DateOfBirth = DateTime.fromMillisecondsSinceEpoch(1725542040000);
  DateTime? get DateOfBirth => _DateOfBirth;
  set DateOfBirth(DateTime? value) {
    _DateOfBirth = value;
    value != null
        ? secureStorage.setInt('ff_DateOfBirth', value.millisecondsSinceEpoch)
        : secureStorage.remove('ff_DateOfBirth');
  }

  void deleteDateOfBirth() {
    secureStorage.delete(key: 'ff_DateOfBirth');
  }

  WealthInfoStruct _WealthInfo = WealthInfoStruct.fromSerializableMap(jsonDecode(
      '{\"totalAssets\":\"0\",\"totalDebt\":\"0\",\"yearlyIncome\":\"0\"}'));
  WealthInfoStruct get WealthInfo => _WealthInfo;
  set WealthInfo(WealthInfoStruct value) {
    _WealthInfo = value;
    secureStorage.setString('ff_WealthInfo', value.serialize());
  }

  void deleteWealthInfo() {
    secureStorage.delete(key: 'ff_WealthInfo');
  }

  void updateWealthInfoStruct(Function(WealthInfoStruct) updateFn) {
    updateFn(_WealthInfo);
    secureStorage.setString('ff_WealthInfo', _WealthInfo.serialize());
  }

  WealthInfoAdditionalStruct _WealthAdditionalInfo =
      WealthInfoAdditionalStruct.fromSerializableMap(jsonDecode(
          '{\"incomeGrowthRate\":\"2\",\"inflationRate\":\"3\",\"assetsGrowthRate\":\"0.03\"}'));
  WealthInfoAdditionalStruct get WealthAdditionalInfo => _WealthAdditionalInfo;
  set WealthAdditionalInfo(WealthInfoAdditionalStruct value) {
    _WealthAdditionalInfo = value;
    secureStorage.setString('ff_WealthAdditionalInfo', value.serialize());
  }

  void deleteWealthAdditionalInfo() {
    secureStorage.delete(key: 'ff_WealthAdditionalInfo');
  }

  void updateWealthAdditionalInfoStruct(
      Function(WealthInfoAdditionalStruct) updateFn) {
    updateFn(_WealthAdditionalInfo);
    secureStorage.setString(
        'ff_WealthAdditionalInfo', _WealthAdditionalInfo.serialize());
  }

  List<TaxesStruct> _Taxes = [];
  List<TaxesStruct> get Taxes => _Taxes;
  set Taxes(List<TaxesStruct> value) {
    _Taxes = value;
    secureStorage.setStringList(
        'ff_Taxes', value.map((x) => x.serialize()).toList());
  }

  void deleteTaxes() {
    secureStorage.delete(key: 'ff_Taxes');
  }

  void addToTaxes(TaxesStruct value) {
    Taxes.add(value);
    secureStorage.setStringList(
        'ff_Taxes', _Taxes.map((x) => x.serialize()).toList());
  }

  void removeFromTaxes(TaxesStruct value) {
    Taxes.remove(value);
    secureStorage.setStringList(
        'ff_Taxes', _Taxes.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromTaxes(int index) {
    Taxes.removeAt(index);
    secureStorage.setStringList(
        'ff_Taxes', _Taxes.map((x) => x.serialize()).toList());
  }

  void updateTaxesAtIndex(
    int index,
    TaxesStruct Function(TaxesStruct) updateFn,
  ) {
    Taxes[index] = updateFn(_Taxes[index]);
    secureStorage.setStringList(
        'ff_Taxes', _Taxes.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInTaxes(int index, TaxesStruct value) {
    Taxes.insert(index, value);
    secureStorage.setStringList(
        'ff_Taxes', _Taxes.map((x) => x.serialize()).toList());
  }

  List<TaxesIncomeTypeStruct> _TaxesIncomeTypes = [];
  List<TaxesIncomeTypeStruct> get TaxesIncomeTypes => _TaxesIncomeTypes;
  set TaxesIncomeTypes(List<TaxesIncomeTypeStruct> value) {
    _TaxesIncomeTypes = value;
    secureStorage.setStringList(
        'ff_TaxesIncomeTypes', value.map((x) => x.serialize()).toList());
  }

  void deleteTaxesIncomeTypes() {
    secureStorage.delete(key: 'ff_TaxesIncomeTypes');
  }

  void addToTaxesIncomeTypes(TaxesIncomeTypeStruct value) {
    TaxesIncomeTypes.add(value);
    secureStorage.setStringList('ff_TaxesIncomeTypes',
        _TaxesIncomeTypes.map((x) => x.serialize()).toList());
  }

  void removeFromTaxesIncomeTypes(TaxesIncomeTypeStruct value) {
    TaxesIncomeTypes.remove(value);
    secureStorage.setStringList('ff_TaxesIncomeTypes',
        _TaxesIncomeTypes.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromTaxesIncomeTypes(int index) {
    TaxesIncomeTypes.removeAt(index);
    secureStorage.setStringList('ff_TaxesIncomeTypes',
        _TaxesIncomeTypes.map((x) => x.serialize()).toList());
  }

  void updateTaxesIncomeTypesAtIndex(
    int index,
    TaxesIncomeTypeStruct Function(TaxesIncomeTypeStruct) updateFn,
  ) {
    TaxesIncomeTypes[index] = updateFn(_TaxesIncomeTypes[index]);
    secureStorage.setStringList('ff_TaxesIncomeTypes',
        _TaxesIncomeTypes.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInTaxesIncomeTypes(int index, TaxesIncomeTypeStruct value) {
    TaxesIncomeTypes.insert(index, value);
    secureStorage.setStringList('ff_TaxesIncomeTypes',
        _TaxesIncomeTypes.map((x) => x.serialize()).toList());
  }

  List<TaxesDeductionTypeStruct> _TaxesDeductionTypes = [
    TaxesDeductionTypeStruct.fromSerializableMap(jsonDecode(
        '{\"guid\":\"377933af-5dbf-4ee8-8dea-e713c1a1e50e\",\"name\":\"ประกันสุขภาพ\",\"nameEn\":\"Health insurance\",\"maxAmount\":\"25000\",\"maxPercentIncome\":\"0\",\"combinedId\":\"1\",\"maxCombinedAmount\":\"100000\",\"active\":\"true\"}')),
    TaxesDeductionTypeStruct.fromSerializableMap(jsonDecode(
        '{\"guid\":\"e3d763ed-a313-4d7c-9d6a-87a146590a24\",\"name\":\"ประกันชีวิต\",\"nameEn\":\"Life insurance\",\"maxAmount\":\"100000\",\"maxPercentIncome\":\"0\",\"combinedId\":\"1\",\"maxCombinedAmount\":\"100000\",\"active\":\"true\"}')),
    TaxesDeductionTypeStruct.fromSerializableMap(jsonDecode(
        '{\"guid\":\"50379f10-c8a9-426a-8dcf-d71822bf3e7b\",\"name\":\"ประกันสังคม\",\"nameEn\":\"Social security\",\"maxAmount\":\"9000\",\"maxPercentIncome\":\"0\",\"combinedId\":\"2\",\"maxCombinedAmount\":\"500000\",\"active\":\"true\"}')),
    TaxesDeductionTypeStruct.fromSerializableMap(jsonDecode(
        '{\"guid\":\"d545a39b-7bd6-4426-871d-4da80baf82e3\",\"name\":\"ประกันสุขภาพของพ่อแม่\",\"nameEn\":\"Parents\' health insurance\",\"maxAmount\":\"15000\",\"maxPercentIncome\":\"0\",\"combinedId\":\"2\",\"maxCombinedAmount\":\"500000\",\"active\":\"true\"}')),
    TaxesDeductionTypeStruct.fromSerializableMap(jsonDecode(
        '{\"guid\":\"9cd395ce-f895-4e8c-b78a-f4e558f09822\",\"name\":\"กองทุน RMF\",\"nameEn\":\"RMF Fund\",\"maxAmount\":\"0\",\"maxPercentIncome\":\"0.3\",\"combinedId\":\"2\",\"maxCombinedAmount\":\"500000\",\"active\":\"true\"}')),
    TaxesDeductionTypeStruct.fromSerializableMap(jsonDecode(
        '{\"guid\":\"ccdbeb7b-2c95-4245-9a8d-6ab336ab4cac\",\"name\":\"กองทุน SSF\",\"nameEn\":\"SSF Fund\",\"maxAmount\":\"0\",\"maxPercentIncome\":\"0.3\",\"combinedId\":\"2\",\"maxCombinedAmount\":\"500000\",\"active\":\"true\"}')),
    TaxesDeductionTypeStruct.fromSerializableMap(jsonDecode(
        '{\"guid\":\"7d402008-5c98-405d-b35a-1202579aa3e0\",\"name\":\"กองทุนสำรองเลี้ยงชีพ, กองทุนสงเคราะห์ครู\",\"nameEn\":\"Provident Fund, Teacher Welfare Fund\",\"maxAmount\":\"0\",\"maxPercentIncome\":\"0.15\",\"combinedId\":\"2\",\"maxCombinedAmount\":\"500000\",\"active\":\"true\"}')),
    TaxesDeductionTypeStruct.fromSerializableMap(jsonDecode(
        '{\"guid\":\"6bfe2a01-6578-460c-a136-d86ef2468e38\",\"name\":\"กบข.\",\"nameEn\":\"GPF\",\"maxAmount\":\"0\",\"maxPercentIncome\":\"0.3\",\"combinedId\":\"2\",\"maxCombinedAmount\":\"500000\",\"active\":\"true\"}')),
    TaxesDeductionTypeStruct.fromSerializableMap(jsonDecode(
        '{\"guid\":\"bb18529b-5524-4df2-838d-5bd6bed1109f\",\"name\":\"เบี้ยประกันชีวิตบำนาญ\",\"nameEn\":\"Pension life insurance premiums\",\"maxAmount\":\"0\",\"maxPercentIncome\":\"0.15\",\"combinedId\":\"2\",\"maxCombinedAmount\":\"500000\",\"active\":\"true\"}')),
    TaxesDeductionTypeStruct.fromSerializableMap(jsonDecode(
        '{\"guid\":\"99187f02-db39-437e-b2ea-e142dc197a1d\",\"name\":\"กองทุนการออมแห่งชาติ\",\"nameEn\":\"National Savings Fund\",\"maxAmount\":\"30000\",\"maxPercentIncome\":\"0\",\"combinedId\":\"2\",\"maxCombinedAmount\":\"500000\",\"active\":\"true\"}')),
    TaxesDeductionTypeStruct.fromSerializableMap(jsonDecode(
        '{\"guid\":\"9a3190a7-2f96-4eb8-9273-633b6d2f73a8\",\"name\":\"เงินบริจาคทั่วไป\",\"nameEn\":\"General donations\",\"maxAmount\":\"0\",\"maxPercentIncome\":\"0\",\"combinedId\":\"0\",\"maxCombinedAmount\":\"0\",\"active\":\"true\"}')),
    TaxesDeductionTypeStruct.fromSerializableMap(jsonDecode(
        '{\"guid\":\"262cef90-427d-4347-91be-49a40454e53f\",\"name\":\"เงินบริจาคเพื่อการศึกษา, พัฒนาสังคม, ประโยชน์สาธารณะและรพ.รัฐ\",\"nameEn\":\"Donations for education, social development, public benefits and government hospitals\",\"maxAmount\":\"0\",\"maxPercentIncome\":\"0\",\"combinedId\":\"0\",\"maxCombinedAmount\":\"0\",\"active\":\"true\"}')),
    TaxesDeductionTypeStruct.fromSerializableMap(jsonDecode(
        '{\"guid\":\"d752218e-d623-4981-b643-d56de93371eb\",\"name\":\"พรรคการเมือง\",\"nameEn\":\"Political party\",\"maxAmount\":\"10000\",\"maxPercentIncome\":\"0\",\"combinedId\":\"0\",\"maxCombinedAmount\":\"0\",\"active\":\"true\"}'))
  ];
  List<TaxesDeductionTypeStruct> get TaxesDeductionTypes =>
      _TaxesDeductionTypes;
  set TaxesDeductionTypes(List<TaxesDeductionTypeStruct> value) {
    _TaxesDeductionTypes = value;
    secureStorage.setStringList(
        'ff_TaxesDeductionTypes', value.map((x) => x.serialize()).toList());
  }

  void deleteTaxesDeductionTypes() {
    secureStorage.delete(key: 'ff_TaxesDeductionTypes');
  }

  void addToTaxesDeductionTypes(TaxesDeductionTypeStruct value) {
    TaxesDeductionTypes.add(value);
    secureStorage.setStringList('ff_TaxesDeductionTypes',
        _TaxesDeductionTypes.map((x) => x.serialize()).toList());
  }

  void removeFromTaxesDeductionTypes(TaxesDeductionTypeStruct value) {
    TaxesDeductionTypes.remove(value);
    secureStorage.setStringList('ff_TaxesDeductionTypes',
        _TaxesDeductionTypes.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromTaxesDeductionTypes(int index) {
    TaxesDeductionTypes.removeAt(index);
    secureStorage.setStringList('ff_TaxesDeductionTypes',
        _TaxesDeductionTypes.map((x) => x.serialize()).toList());
  }

  void updateTaxesDeductionTypesAtIndex(
    int index,
    TaxesDeductionTypeStruct Function(TaxesDeductionTypeStruct) updateFn,
  ) {
    TaxesDeductionTypes[index] = updateFn(_TaxesDeductionTypes[index]);
    secureStorage.setStringList('ff_TaxesDeductionTypes',
        _TaxesDeductionTypes.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInTaxesDeductionTypes(
      int index, TaxesDeductionTypeStruct value) {
    TaxesDeductionTypes.insert(index, value);
    secureStorage.setStringList('ff_TaxesDeductionTypes',
        _TaxesDeductionTypes.map((x) => x.serialize()).toList());
  }

  GoalStruct _TempGoalFormInput =
      GoalStruct.fromSerializableMap(jsonDecode('{}'));
  GoalStruct get TempGoalFormInput => _TempGoalFormInput;
  set TempGoalFormInput(GoalStruct value) {
    _TempGoalFormInput = value;
  }

  void updateTempGoalFormInputStruct(Function(GoalStruct) updateFn) {
    updateFn(_TempGoalFormInput);
  }

  BudgetStruct _TempBudgetFormInput = BudgetStruct();
  BudgetStruct get TempBudgetFormInput => _TempBudgetFormInput;
  set TempBudgetFormInput(BudgetStruct value) {
    _TempBudgetFormInput = value;
  }

  void updateTempBudgetFormInputStruct(Function(BudgetStruct) updateFn) {
    updateFn(_TempBudgetFormInput);
  }

  RetirementCalculationStruct _TempRetirementFormInput =
      RetirementCalculationStruct();
  RetirementCalculationStruct get TempRetirementFormInput =>
      _TempRetirementFormInput;
  set TempRetirementFormInput(RetirementCalculationStruct value) {
    _TempRetirementFormInput = value;
  }

  void updateTempRetirementFormInputStruct(
      Function(RetirementCalculationStruct) updateFn) {
    updateFn(_TempRetirementFormInput);
  }

  bool _InitialWealth = true;
  bool get InitialWealth => _InitialWealth;
  set InitialWealth(bool value) {
    _InitialWealth = value;
    secureStorage.setBool('ff_InitialWealth', value);
  }

  void deleteInitialWealth() {
    secureStorage.delete(key: 'ff_InitialWealth');
  }

  bool _InitialHomePageWT = true;
  bool get InitialHomePageWT => _InitialHomePageWT;
  set InitialHomePageWT(bool value) {
    _InitialHomePageWT = value;
    secureStorage.setBool('ff_InitialHomePageWT', value);
  }

  void deleteInitialHomePageWT() {
    secureStorage.delete(key: 'ff_InitialHomePageWT');
  }

  bool _initialTransactionHistoryPageWT = true;
  bool get initialTransactionHistoryPageWT => _initialTransactionHistoryPageWT;
  set initialTransactionHistoryPageWT(bool value) {
    _initialTransactionHistoryPageWT = value;
    secureStorage.setBool('ff_initialTransactionHistoryPageWT', value);
  }

  void deleteInitialTransactionHistoryPageWT() {
    secureStorage.delete(key: 'ff_initialTransactionHistoryPageWT');
  }

  bool _initialGoalBudgetWT = true;
  bool get initialGoalBudgetWT => _initialGoalBudgetWT;
  set initialGoalBudgetWT(bool value) {
    _initialGoalBudgetWT = value;
    secureStorage.setBool('ff_initialGoalBudgetWT', value);
  }

  void deleteInitialGoalBudgetWT() {
    secureStorage.delete(key: 'ff_initialGoalBudgetWT');
  }

  bool _initialReportWT = true;
  bool get initialReportWT => _initialReportWT;
  set initialReportWT(bool value) {
    _initialReportWT = value;
    secureStorage.setBool('ff_initialReportWT', value);
  }

  void deleteInitialReportWT() {
    secureStorage.delete(key: 'ff_initialReportWT');
  }

  bool _initialAccountWT = true;
  bool get initialAccountWT => _initialAccountWT;
  set initialAccountWT(bool value) {
    _initialAccountWT = value;
    secureStorage.setBool('ff_initialAccountWT', value);
  }

  void deleteInitialAccountWT() {
    secureStorage.delete(key: 'ff_initialAccountWT');
  }

  bool _initialGoalDetailPageWT = true;
  bool get initialGoalDetailPageWT => _initialGoalDetailPageWT;
  set initialGoalDetailPageWT(bool value) {
    _initialGoalDetailPageWT = value;
    secureStorage.setBool('ff_initialGoalDetailPageWT', value);
  }

  void deleteInitialGoalDetailPageWT() {
    secureStorage.delete(key: 'ff_initialGoalDetailPageWT');
  }

  bool _initialBudgetDetailPageWT = true;
  bool get initialBudgetDetailPageWT => _initialBudgetDetailPageWT;
  set initialBudgetDetailPageWT(bool value) {
    _initialBudgetDetailPageWT = value;
    secureStorage.setBool('ff_initialBudgetDetailPageWT', value);
  }

  void deleteInitialBudgetDetailPageWT() {
    secureStorage.delete(key: 'ff_initialBudgetDetailPageWT');
  }

  bool _initialTaxManagementPageWT = true;
  bool get initialTaxManagementPageWT => _initialTaxManagementPageWT;
  set initialTaxManagementPageWT(bool value) {
    _initialTaxManagementPageWT = value;
    secureStorage.setBool('ff_initialTaxManagementPageWT', value);
  }

  void deleteInitialTaxManagementPageWT() {
    secureStorage.delete(key: 'ff_initialTaxManagementPageWT');
  }

  bool _initialTaxDetailPageWT = true;
  bool get initialTaxDetailPageWT => _initialTaxDetailPageWT;
  set initialTaxDetailPageWT(bool value) {
    _initialTaxDetailPageWT = value;
    secureStorage.setBool('ff_initialTaxDetailPageWT', value);
  }

  void deleteInitialTaxDetailPageWT() {
    secureStorage.delete(key: 'ff_initialTaxDetailPageWT');
  }

  bool _initialWealthInfoPageWT = true;
  bool get initialWealthInfoPageWT => _initialWealthInfoPageWT;
  set initialWealthInfoPageWT(bool value) {
    _initialWealthInfoPageWT = value;
    secureStorage.setBool('ff_initialWealthInfoPageWT', value);
  }

  void deleteInitialWealthInfoPageWT() {
    secureStorage.delete(key: 'ff_initialWealthInfoPageWT');
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return const CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: const ListToCsvConverter().convert([value]));
}
