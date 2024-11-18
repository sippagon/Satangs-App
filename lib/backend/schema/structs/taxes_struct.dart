// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TaxesStruct extends BaseStruct {
  TaxesStruct({
    String? guid,
    String? name,
    String? year,
    double? taxesToBePaid,
    TaxesPersonalAndFamilyStruct? personalInformation,
    TaxesIncomeStruct? taxesIncomeInformation,
    TaxesDeductionStruct? taxesDeductionInformation,
    DateTime? createOnLocalTime,
    DateTime? updateOnLocalTime,
  })  : _guid = guid,
        _name = name,
        _year = year,
        _taxesToBePaid = taxesToBePaid,
        _personalInformation = personalInformation,
        _taxesIncomeInformation = taxesIncomeInformation,
        _taxesDeductionInformation = taxesDeductionInformation,
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

  // "year" field.
  String? _year;
  String get year => _year ?? '';
  set year(String? val) => _year = val;

  bool hasYear() => _year != null;

  // "taxesToBePaid" field.
  double? _taxesToBePaid;
  double get taxesToBePaid => _taxesToBePaid ?? 0.0;
  set taxesToBePaid(double? val) => _taxesToBePaid = val;

  void incrementTaxesToBePaid(double amount) =>
      taxesToBePaid = taxesToBePaid + amount;

  bool hasTaxesToBePaid() => _taxesToBePaid != null;

  // "personalInformation" field.
  TaxesPersonalAndFamilyStruct? _personalInformation;
  TaxesPersonalAndFamilyStruct get personalInformation =>
      _personalInformation ?? TaxesPersonalAndFamilyStruct();
  set personalInformation(TaxesPersonalAndFamilyStruct? val) =>
      _personalInformation = val;

  void updatePersonalInformation(
      Function(TaxesPersonalAndFamilyStruct) updateFn) {
    updateFn(_personalInformation ??= TaxesPersonalAndFamilyStruct());
  }

  bool hasPersonalInformation() => _personalInformation != null;

  // "taxesIncomeInformation" field.
  TaxesIncomeStruct? _taxesIncomeInformation;
  TaxesIncomeStruct get taxesIncomeInformation =>
      _taxesIncomeInformation ?? TaxesIncomeStruct();
  set taxesIncomeInformation(TaxesIncomeStruct? val) =>
      _taxesIncomeInformation = val;

  void updateTaxesIncomeInformation(Function(TaxesIncomeStruct) updateFn) {
    updateFn(_taxesIncomeInformation ??= TaxesIncomeStruct());
  }

  bool hasTaxesIncomeInformation() => _taxesIncomeInformation != null;

  // "taxesDeductionInformation" field.
  TaxesDeductionStruct? _taxesDeductionInformation;
  TaxesDeductionStruct get taxesDeductionInformation =>
      _taxesDeductionInformation ?? TaxesDeductionStruct();
  set taxesDeductionInformation(TaxesDeductionStruct? val) =>
      _taxesDeductionInformation = val;

  void updateTaxesDeductionInformation(
      Function(TaxesDeductionStruct) updateFn) {
    updateFn(_taxesDeductionInformation ??= TaxesDeductionStruct());
  }

  bool hasTaxesDeductionInformation() => _taxesDeductionInformation != null;

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

  static TaxesStruct fromMap(Map<String, dynamic> data) => TaxesStruct(
        guid: data['guid'] as String?,
        name: data['name'] as String?,
        year: data['year'] as String?,
        taxesToBePaid: castToType<double>(data['taxesToBePaid']),
        personalInformation: TaxesPersonalAndFamilyStruct.maybeFromMap(
            data['personalInformation']),
        taxesIncomeInformation:
            TaxesIncomeStruct.maybeFromMap(data['taxesIncomeInformation']),
        taxesDeductionInformation: TaxesDeductionStruct.maybeFromMap(
            data['taxesDeductionInformation']),
        createOnLocalTime: data['createOnLocalTime'] as DateTime?,
        updateOnLocalTime: data['updateOnLocalTime'] as DateTime?,
      );

  static TaxesStruct? maybeFromMap(dynamic data) =>
      data is Map ? TaxesStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'guid': _guid,
        'name': _name,
        'year': _year,
        'taxesToBePaid': _taxesToBePaid,
        'personalInformation': _personalInformation?.toMap(),
        'taxesIncomeInformation': _taxesIncomeInformation?.toMap(),
        'taxesDeductionInformation': _taxesDeductionInformation?.toMap(),
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
        'year': serializeParam(
          _year,
          ParamType.String,
        ),
        'taxesToBePaid': serializeParam(
          _taxesToBePaid,
          ParamType.double,
        ),
        'personalInformation': serializeParam(
          _personalInformation,
          ParamType.DataStruct,
        ),
        'taxesIncomeInformation': serializeParam(
          _taxesIncomeInformation,
          ParamType.DataStruct,
        ),
        'taxesDeductionInformation': serializeParam(
          _taxesDeductionInformation,
          ParamType.DataStruct,
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

  static TaxesStruct fromSerializableMap(Map<String, dynamic> data) =>
      TaxesStruct(
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
        year: deserializeParam(
          data['year'],
          ParamType.String,
          false,
        ),
        taxesToBePaid: deserializeParam(
          data['taxesToBePaid'],
          ParamType.double,
          false,
        ),
        personalInformation: deserializeStructParam(
          data['personalInformation'],
          ParamType.DataStruct,
          false,
          structBuilder: TaxesPersonalAndFamilyStruct.fromSerializableMap,
        ),
        taxesIncomeInformation: deserializeStructParam(
          data['taxesIncomeInformation'],
          ParamType.DataStruct,
          false,
          structBuilder: TaxesIncomeStruct.fromSerializableMap,
        ),
        taxesDeductionInformation: deserializeStructParam(
          data['taxesDeductionInformation'],
          ParamType.DataStruct,
          false,
          structBuilder: TaxesDeductionStruct.fromSerializableMap,
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
  String toString() => 'TaxesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TaxesStruct &&
        guid == other.guid &&
        name == other.name &&
        year == other.year &&
        taxesToBePaid == other.taxesToBePaid &&
        personalInformation == other.personalInformation &&
        taxesIncomeInformation == other.taxesIncomeInformation &&
        taxesDeductionInformation == other.taxesDeductionInformation &&
        createOnLocalTime == other.createOnLocalTime &&
        updateOnLocalTime == other.updateOnLocalTime;
  }

  @override
  int get hashCode => const ListEquality().hash([
        guid,
        name,
        year,
        taxesToBePaid,
        personalInformation,
        taxesIncomeInformation,
        taxesDeductionInformation,
        createOnLocalTime,
        updateOnLocalTime
      ]);
}

TaxesStruct createTaxesStruct({
  String? guid,
  String? name,
  String? year,
  double? taxesToBePaid,
  TaxesPersonalAndFamilyStruct? personalInformation,
  TaxesIncomeStruct? taxesIncomeInformation,
  TaxesDeductionStruct? taxesDeductionInformation,
  DateTime? createOnLocalTime,
  DateTime? updateOnLocalTime,
}) =>
    TaxesStruct(
      guid: guid,
      name: name,
      year: year,
      taxesToBePaid: taxesToBePaid,
      personalInformation:
          personalInformation ?? TaxesPersonalAndFamilyStruct(),
      taxesIncomeInformation: taxesIncomeInformation ?? TaxesIncomeStruct(),
      taxesDeductionInformation:
          taxesDeductionInformation ?? TaxesDeductionStruct(),
      createOnLocalTime: createOnLocalTime,
      updateOnLocalTime: updateOnLocalTime,
    );
