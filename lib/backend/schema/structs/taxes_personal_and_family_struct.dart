// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TaxesPersonalAndFamilyStruct extends BaseStruct {
  TaxesPersonalAndFamilyStruct({
    String? guid,
    MaritalStatus? maritalStatus,
    int? numberOfChild,
    List<String>? parentsChecked,
    int? numberOfParent,
    int? numberOfDisablePeople,
  })  : _guid = guid,
        _maritalStatus = maritalStatus,
        _numberOfChild = numberOfChild,
        _parentsChecked = parentsChecked,
        _numberOfParent = numberOfParent,
        _numberOfDisablePeople = numberOfDisablePeople;

  // "guid" field.
  String? _guid;
  String get guid => _guid ?? '';
  set guid(String? val) => _guid = val;

  bool hasGuid() => _guid != null;

  // "maritalStatus" field.
  MaritalStatus? _maritalStatus;
  MaritalStatus get maritalStatus => _maritalStatus ?? MaritalStatus.Single;
  set maritalStatus(MaritalStatus? val) => _maritalStatus = val;

  bool hasMaritalStatus() => _maritalStatus != null;

  // "numberOfChild" field.
  int? _numberOfChild;
  int get numberOfChild => _numberOfChild ?? 0;
  set numberOfChild(int? val) => _numberOfChild = val;

  void incrementNumberOfChild(int amount) =>
      numberOfChild = numberOfChild + amount;

  bool hasNumberOfChild() => _numberOfChild != null;

  // "parentsChecked" field.
  List<String>? _parentsChecked;
  List<String> get parentsChecked => _parentsChecked ?? const [];
  set parentsChecked(List<String>? val) => _parentsChecked = val;

  void updateParentsChecked(Function(List<String>) updateFn) {
    updateFn(_parentsChecked ??= []);
  }

  bool hasParentsChecked() => _parentsChecked != null;

  // "numberOfParent" field.
  int? _numberOfParent;
  int get numberOfParent => _numberOfParent ?? 0;
  set numberOfParent(int? val) => _numberOfParent = val;

  void incrementNumberOfParent(int amount) =>
      numberOfParent = numberOfParent + amount;

  bool hasNumberOfParent() => _numberOfParent != null;

  // "numberOfDisablePeople" field.
  int? _numberOfDisablePeople;
  int get numberOfDisablePeople => _numberOfDisablePeople ?? 0;
  set numberOfDisablePeople(int? val) => _numberOfDisablePeople = val;

  void incrementNumberOfDisablePeople(int amount) =>
      numberOfDisablePeople = numberOfDisablePeople + amount;

  bool hasNumberOfDisablePeople() => _numberOfDisablePeople != null;

  static TaxesPersonalAndFamilyStruct fromMap(Map<String, dynamic> data) =>
      TaxesPersonalAndFamilyStruct(
        guid: data['guid'] as String?,
        maritalStatus: deserializeEnum<MaritalStatus>(data['maritalStatus']),
        numberOfChild: castToType<int>(data['numberOfChild']),
        parentsChecked: getDataList(data['parentsChecked']),
        numberOfParent: castToType<int>(data['numberOfParent']),
        numberOfDisablePeople: castToType<int>(data['numberOfDisablePeople']),
      );

  static TaxesPersonalAndFamilyStruct? maybeFromMap(dynamic data) => data is Map
      ? TaxesPersonalAndFamilyStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'guid': _guid,
        'maritalStatus': _maritalStatus?.serialize(),
        'numberOfChild': _numberOfChild,
        'parentsChecked': _parentsChecked,
        'numberOfParent': _numberOfParent,
        'numberOfDisablePeople': _numberOfDisablePeople,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'guid': serializeParam(
          _guid,
          ParamType.String,
        ),
        'maritalStatus': serializeParam(
          _maritalStatus,
          ParamType.Enum,
        ),
        'numberOfChild': serializeParam(
          _numberOfChild,
          ParamType.int,
        ),
        'parentsChecked': serializeParam(
          _parentsChecked,
          ParamType.String,
          isList: true,
        ),
        'numberOfParent': serializeParam(
          _numberOfParent,
          ParamType.int,
        ),
        'numberOfDisablePeople': serializeParam(
          _numberOfDisablePeople,
          ParamType.int,
        ),
      }.withoutNulls;

  static TaxesPersonalAndFamilyStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      TaxesPersonalAndFamilyStruct(
        guid: deserializeParam(
          data['guid'],
          ParamType.String,
          false,
        ),
        maritalStatus: deserializeParam<MaritalStatus>(
          data['maritalStatus'],
          ParamType.Enum,
          false,
        ),
        numberOfChild: deserializeParam(
          data['numberOfChild'],
          ParamType.int,
          false,
        ),
        parentsChecked: deserializeParam<String>(
          data['parentsChecked'],
          ParamType.String,
          true,
        ),
        numberOfParent: deserializeParam(
          data['numberOfParent'],
          ParamType.int,
          false,
        ),
        numberOfDisablePeople: deserializeParam(
          data['numberOfDisablePeople'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'TaxesPersonalAndFamilyStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is TaxesPersonalAndFamilyStruct &&
        guid == other.guid &&
        maritalStatus == other.maritalStatus &&
        numberOfChild == other.numberOfChild &&
        listEquality.equals(parentsChecked, other.parentsChecked) &&
        numberOfParent == other.numberOfParent &&
        numberOfDisablePeople == other.numberOfDisablePeople;
  }

  @override
  int get hashCode => const ListEquality().hash([
        guid,
        maritalStatus,
        numberOfChild,
        parentsChecked,
        numberOfParent,
        numberOfDisablePeople
      ]);
}

TaxesPersonalAndFamilyStruct createTaxesPersonalAndFamilyStruct({
  String? guid,
  MaritalStatus? maritalStatus,
  int? numberOfChild,
  int? numberOfParent,
  int? numberOfDisablePeople,
}) =>
    TaxesPersonalAndFamilyStruct(
      guid: guid,
      maritalStatus: maritalStatus,
      numberOfChild: numberOfChild,
      numberOfParent: numberOfParent,
      numberOfDisablePeople: numberOfDisablePeople,
    );
