// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RetirementCalculationResultModelStruct extends BaseStruct {
  RetirementCalculationResultModelStruct({
    double? retirementNeeded,
    double? futureIncomeAmount,
    double? futureExpenseAmount,
    double? futureSavingsAmount,
    List<RetirementCalculationLineChartStruct>? lineChartModel,
  })  : _retirementNeeded = retirementNeeded,
        _futureIncomeAmount = futureIncomeAmount,
        _futureExpenseAmount = futureExpenseAmount,
        _futureSavingsAmount = futureSavingsAmount,
        _lineChartModel = lineChartModel;

  // "retirementNeeded" field.
  double? _retirementNeeded;
  double get retirementNeeded => _retirementNeeded ?? 0.0;
  set retirementNeeded(double? val) => _retirementNeeded = val;

  void incrementRetirementNeeded(double amount) =>
      retirementNeeded = retirementNeeded + amount;

  bool hasRetirementNeeded() => _retirementNeeded != null;

  // "futureIncomeAmount" field.
  double? _futureIncomeAmount;
  double get futureIncomeAmount => _futureIncomeAmount ?? 0.0;
  set futureIncomeAmount(double? val) => _futureIncomeAmount = val;

  void incrementFutureIncomeAmount(double amount) =>
      futureIncomeAmount = futureIncomeAmount + amount;

  bool hasFutureIncomeAmount() => _futureIncomeAmount != null;

  // "futureExpenseAmount" field.
  double? _futureExpenseAmount;
  double get futureExpenseAmount => _futureExpenseAmount ?? 0.0;
  set futureExpenseAmount(double? val) => _futureExpenseAmount = val;

  void incrementFutureExpenseAmount(double amount) =>
      futureExpenseAmount = futureExpenseAmount + amount;

  bool hasFutureExpenseAmount() => _futureExpenseAmount != null;

  // "futureSavingsAmount" field.
  double? _futureSavingsAmount;
  double get futureSavingsAmount => _futureSavingsAmount ?? 0.0;
  set futureSavingsAmount(double? val) => _futureSavingsAmount = val;

  void incrementFutureSavingsAmount(double amount) =>
      futureSavingsAmount = futureSavingsAmount + amount;

  bool hasFutureSavingsAmount() => _futureSavingsAmount != null;

  // "lineChartModel" field.
  List<RetirementCalculationLineChartStruct>? _lineChartModel;
  List<RetirementCalculationLineChartStruct> get lineChartModel =>
      _lineChartModel ?? const [];
  set lineChartModel(List<RetirementCalculationLineChartStruct>? val) =>
      _lineChartModel = val;

  void updateLineChartModel(
      Function(List<RetirementCalculationLineChartStruct>) updateFn) {
    updateFn(_lineChartModel ??= []);
  }

  bool hasLineChartModel() => _lineChartModel != null;

  static RetirementCalculationResultModelStruct fromMap(
          Map<String, dynamic> data) =>
      RetirementCalculationResultModelStruct(
        retirementNeeded: castToType<double>(data['retirementNeeded']),
        futureIncomeAmount: castToType<double>(data['futureIncomeAmount']),
        futureExpenseAmount: castToType<double>(data['futureExpenseAmount']),
        futureSavingsAmount: castToType<double>(data['futureSavingsAmount']),
        lineChartModel: getStructList(
          data['lineChartModel'],
          RetirementCalculationLineChartStruct.fromMap,
        ),
      );

  static RetirementCalculationResultModelStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? RetirementCalculationResultModelStruct.fromMap(
              data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'retirementNeeded': _retirementNeeded,
        'futureIncomeAmount': _futureIncomeAmount,
        'futureExpenseAmount': _futureExpenseAmount,
        'futureSavingsAmount': _futureSavingsAmount,
        'lineChartModel': _lineChartModel?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'retirementNeeded': serializeParam(
          _retirementNeeded,
          ParamType.double,
        ),
        'futureIncomeAmount': serializeParam(
          _futureIncomeAmount,
          ParamType.double,
        ),
        'futureExpenseAmount': serializeParam(
          _futureExpenseAmount,
          ParamType.double,
        ),
        'futureSavingsAmount': serializeParam(
          _futureSavingsAmount,
          ParamType.double,
        ),
        'lineChartModel': serializeParam(
          _lineChartModel,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static RetirementCalculationResultModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      RetirementCalculationResultModelStruct(
        retirementNeeded: deserializeParam(
          data['retirementNeeded'],
          ParamType.double,
          false,
        ),
        futureIncomeAmount: deserializeParam(
          data['futureIncomeAmount'],
          ParamType.double,
          false,
        ),
        futureExpenseAmount: deserializeParam(
          data['futureExpenseAmount'],
          ParamType.double,
          false,
        ),
        futureSavingsAmount: deserializeParam(
          data['futureSavingsAmount'],
          ParamType.double,
          false,
        ),
        lineChartModel:
            deserializeStructParam<RetirementCalculationLineChartStruct>(
          data['lineChartModel'],
          ParamType.DataStruct,
          true,
          structBuilder:
              RetirementCalculationLineChartStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'RetirementCalculationResultModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is RetirementCalculationResultModelStruct &&
        retirementNeeded == other.retirementNeeded &&
        futureIncomeAmount == other.futureIncomeAmount &&
        futureExpenseAmount == other.futureExpenseAmount &&
        futureSavingsAmount == other.futureSavingsAmount &&
        listEquality.equals(lineChartModel, other.lineChartModel);
  }

  @override
  int get hashCode => const ListEquality().hash([
        retirementNeeded,
        futureIncomeAmount,
        futureExpenseAmount,
        futureSavingsAmount,
        lineChartModel
      ]);
}

RetirementCalculationResultModelStruct
    createRetirementCalculationResultModelStruct({
  double? retirementNeeded,
  double? futureIncomeAmount,
  double? futureExpenseAmount,
  double? futureSavingsAmount,
}) =>
        RetirementCalculationResultModelStruct(
          retirementNeeded: retirementNeeded,
          futureIncomeAmount: futureIncomeAmount,
          futureExpenseAmount: futureExpenseAmount,
          futureSavingsAmount: futureSavingsAmount,
        );
