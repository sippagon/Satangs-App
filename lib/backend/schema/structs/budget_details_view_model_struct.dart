// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BudgetDetailsViewModelStruct extends BaseStruct {
  BudgetDetailsViewModelStruct({
    String? guid,
    String? name,
    double? totalBudget,
    double? totalUsage,
    double? totalUsagePercentage,
    int? indexInList,
    List<BudgetDetailsCategoriesViewModelStruct>? categoriesList,
  })  : _guid = guid,
        _name = name,
        _totalBudget = totalBudget,
        _totalUsage = totalUsage,
        _totalUsagePercentage = totalUsagePercentage,
        _indexInList = indexInList,
        _categoriesList = categoriesList;

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

  // "totalUsage" field.
  double? _totalUsage;
  double get totalUsage => _totalUsage ?? 0.0;
  set totalUsage(double? val) => _totalUsage = val;

  void incrementTotalUsage(double amount) => totalUsage = totalUsage + amount;

  bool hasTotalUsage() => _totalUsage != null;

  // "totalUsagePercentage" field.
  double? _totalUsagePercentage;
  double get totalUsagePercentage => _totalUsagePercentage ?? 0.0;
  set totalUsagePercentage(double? val) => _totalUsagePercentage = val;

  void incrementTotalUsagePercentage(double amount) =>
      totalUsagePercentage = totalUsagePercentage + amount;

  bool hasTotalUsagePercentage() => _totalUsagePercentage != null;

  // "indexInList" field.
  int? _indexInList;
  int get indexInList => _indexInList ?? 0;
  set indexInList(int? val) => _indexInList = val;

  void incrementIndexInList(int amount) => indexInList = indexInList + amount;

  bool hasIndexInList() => _indexInList != null;

  // "categoriesList" field.
  List<BudgetDetailsCategoriesViewModelStruct>? _categoriesList;
  List<BudgetDetailsCategoriesViewModelStruct> get categoriesList =>
      _categoriesList ?? const [];
  set categoriesList(List<BudgetDetailsCategoriesViewModelStruct>? val) =>
      _categoriesList = val;

  void updateCategoriesList(
      Function(List<BudgetDetailsCategoriesViewModelStruct>) updateFn) {
    updateFn(_categoriesList ??= []);
  }

  bool hasCategoriesList() => _categoriesList != null;

  static BudgetDetailsViewModelStruct fromMap(Map<String, dynamic> data) =>
      BudgetDetailsViewModelStruct(
        guid: data['guid'] as String?,
        name: data['name'] as String?,
        totalBudget: castToType<double>(data['totalBudget']),
        totalUsage: castToType<double>(data['totalUsage']),
        totalUsagePercentage: castToType<double>(data['totalUsagePercentage']),
        indexInList: castToType<int>(data['indexInList']),
        categoriesList: getStructList(
          data['categoriesList'],
          BudgetDetailsCategoriesViewModelStruct.fromMap,
        ),
      );

  static BudgetDetailsViewModelStruct? maybeFromMap(dynamic data) => data is Map
      ? BudgetDetailsViewModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'guid': _guid,
        'name': _name,
        'totalBudget': _totalBudget,
        'totalUsage': _totalUsage,
        'totalUsagePercentage': _totalUsagePercentage,
        'indexInList': _indexInList,
        'categoriesList': _categoriesList?.map((e) => e.toMap()).toList(),
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
        'totalUsage': serializeParam(
          _totalUsage,
          ParamType.double,
        ),
        'totalUsagePercentage': serializeParam(
          _totalUsagePercentage,
          ParamType.double,
        ),
        'indexInList': serializeParam(
          _indexInList,
          ParamType.int,
        ),
        'categoriesList': serializeParam(
          _categoriesList,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static BudgetDetailsViewModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      BudgetDetailsViewModelStruct(
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
        totalUsage: deserializeParam(
          data['totalUsage'],
          ParamType.double,
          false,
        ),
        totalUsagePercentage: deserializeParam(
          data['totalUsagePercentage'],
          ParamType.double,
          false,
        ),
        indexInList: deserializeParam(
          data['indexInList'],
          ParamType.int,
          false,
        ),
        categoriesList:
            deserializeStructParam<BudgetDetailsCategoriesViewModelStruct>(
          data['categoriesList'],
          ParamType.DataStruct,
          true,
          structBuilder:
              BudgetDetailsCategoriesViewModelStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'BudgetDetailsViewModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is BudgetDetailsViewModelStruct &&
        guid == other.guid &&
        name == other.name &&
        totalBudget == other.totalBudget &&
        totalUsage == other.totalUsage &&
        totalUsagePercentage == other.totalUsagePercentage &&
        indexInList == other.indexInList &&
        listEquality.equals(categoriesList, other.categoriesList);
  }

  @override
  int get hashCode => const ListEquality().hash([
        guid,
        name,
        totalBudget,
        totalUsage,
        totalUsagePercentage,
        indexInList,
        categoriesList
      ]);
}

BudgetDetailsViewModelStruct createBudgetDetailsViewModelStruct({
  String? guid,
  String? name,
  double? totalBudget,
  double? totalUsage,
  double? totalUsagePercentage,
  int? indexInList,
}) =>
    BudgetDetailsViewModelStruct(
      guid: guid,
      name: name,
      totalBudget: totalBudget,
      totalUsage: totalUsage,
      totalUsagePercentage: totalUsagePercentage,
      indexInList: indexInList,
    );
