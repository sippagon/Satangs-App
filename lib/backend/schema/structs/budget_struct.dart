// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BudgetStruct extends BaseStruct {
  BudgetStruct({
    String? guid,
    String? name,
    double? totalBudget,
    List<BudgetTrasactionCategoriesStruct>? includeCategories,
    DateTime? createOnLocalTime,
    DateTime? updateOnLocalTime,
  })  : _guid = guid,
        _name = name,
        _totalBudget = totalBudget,
        _includeCategories = includeCategories,
        _createOnLocalTime = createOnLocalTime,
        _updateOnLocalTime = updateOnLocalTime;

  // "guid" field.
  String? _guid;
  String get guid => _guid ?? '';
  set guid(String? val) => _guid = val;

  bool hasGuid() => _guid != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "totalBudget" field.
  double? _totalBudget;
  double get totalBudget => _totalBudget ?? 0.0;
  set totalBudget(double? val) => _totalBudget = val;

  void incrementTotalBudget(double amount) =>
      totalBudget = totalBudget + amount;

  bool hasTotalBudget() => _totalBudget != null;

  // "includeCategories" field.
  List<BudgetTrasactionCategoriesStruct>? _includeCategories;
  List<BudgetTrasactionCategoriesStruct> get includeCategories =>
      _includeCategories ?? const [];
  set includeCategories(List<BudgetTrasactionCategoriesStruct>? val) =>
      _includeCategories = val;

  void updateIncludeCategories(
      Function(List<BudgetTrasactionCategoriesStruct>) updateFn) {
    updateFn(_includeCategories ??= []);
  }

  bool hasIncludeCategories() => _includeCategories != null;

  // "createOnLocalTime" field.
  DateTime? _createOnLocalTime;
  DateTime? get createOnLocalTime => _createOnLocalTime;
  set createOnLocalTime(DateTime? val) => _createOnLocalTime = val;

  bool hasCreateOnLocalTime() => _createOnLocalTime != null;

  // "updateOnLocalTime" field.
  DateTime? _updateOnLocalTime;
  DateTime? get updateOnLocalTime => _updateOnLocalTime;
  set updateOnLocalTime(DateTime? val) => _updateOnLocalTime = val;

  bool hasUpdateOnLocalTime() => _updateOnLocalTime != null;

  static BudgetStruct fromMap(Map<String, dynamic> data) => BudgetStruct(
        guid: data['guid'] as String?,
        name: data['name'] as String?,
        totalBudget: castToType<double>(data['totalBudget']),
        includeCategories: getStructList(
          data['includeCategories'],
          BudgetTrasactionCategoriesStruct.fromMap,
        ),
        createOnLocalTime: data['createOnLocalTime'] as DateTime?,
        updateOnLocalTime: data['updateOnLocalTime'] as DateTime?,
      );

  static BudgetStruct? maybeFromMap(dynamic data) =>
      data is Map ? BudgetStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'guid': _guid,
        'name': _name,
        'totalBudget': _totalBudget,
        'includeCategories': _includeCategories?.map((e) => e.toMap()).toList(),
        'createOnLocalTime': _createOnLocalTime,
        'updateOnLocalTime': _updateOnLocalTime,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'guid': serializeParam(
          _guid,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'totalBudget': serializeParam(
          _totalBudget,
          ParamType.double,
        ),
        'includeCategories': serializeParam(
          _includeCategories,
          ParamType.DataStruct,
          isList: true,
        ),
        'createOnLocalTime': serializeParam(
          _createOnLocalTime,
          ParamType.DateTime,
        ),
        'updateOnLocalTime': serializeParam(
          _updateOnLocalTime,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static BudgetStruct fromSerializableMap(Map<String, dynamic> data) =>
      BudgetStruct(
        guid: deserializeParam(
          data['guid'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        totalBudget: deserializeParam(
          data['totalBudget'],
          ParamType.double,
          false,
        ),
        includeCategories:
            deserializeStructParam<BudgetTrasactionCategoriesStruct>(
          data['includeCategories'],
          ParamType.DataStruct,
          true,
          structBuilder: BudgetTrasactionCategoriesStruct.fromSerializableMap,
        ),
        createOnLocalTime: deserializeParam(
          data['createOnLocalTime'],
          ParamType.DateTime,
          false,
        ),
        updateOnLocalTime: deserializeParam(
          data['updateOnLocalTime'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'BudgetStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is BudgetStruct &&
        guid == other.guid &&
        name == other.name &&
        totalBudget == other.totalBudget &&
        listEquality.equals(includeCategories, other.includeCategories) &&
        createOnLocalTime == other.createOnLocalTime &&
        updateOnLocalTime == other.updateOnLocalTime;
  }

  @override
  int get hashCode => const ListEquality().hash([
        guid,
        name,
        totalBudget,
        includeCategories,
        createOnLocalTime,
        updateOnLocalTime
      ]);
}

BudgetStruct createBudgetStruct({
  String? guid,
  String? name,
  double? totalBudget,
  DateTime? createOnLocalTime,
  DateTime? updateOnLocalTime,
}) =>
    BudgetStruct(
      guid: guid,
      name: name,
      totalBudget: totalBudget,
      createOnLocalTime: createOnLocalTime,
      updateOnLocalTime: updateOnLocalTime,
    );
