// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TransactionCategoriesStruct extends BaseStruct {
  TransactionCategoriesStruct({
    String? guid,
    String? name,
    String? nameEn,
    TransactionType? type,
    int? sequence,
    bool? active,
  })  : _guid = guid,
        _name = name,
        _nameEn = nameEn,
        _type = type,
        _sequence = sequence,
        _active = active;

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

  // "nameEn" field.
  String? _nameEn;
  String get nameEn => _nameEn ?? '';
  set nameEn(String? val) => _nameEn = val;

  bool hasNameEn() => _nameEn != null;

  // "type" field.
  TransactionType? _type;
  TransactionType? get type => _type;
  set type(TransactionType? val) => _type = val;

  bool hasType() => _type != null;

  // "sequence" field.
  int? _sequence;
  int get sequence => _sequence ?? 0;
  set sequence(int? val) => _sequence = val;

  void incrementSequence(int amount) => sequence = sequence + amount;

  bool hasSequence() => _sequence != null;

  // "active" field.
  bool? _active;
  bool get active => _active ?? true;
  set active(bool? val) => _active = val;

  bool hasActive() => _active != null;

  static TransactionCategoriesStruct fromMap(Map<String, dynamic> data) =>
      TransactionCategoriesStruct(
        guid: data['guid'] as String?,
        name: data['name'] as String?,
        nameEn: data['nameEn'] as String?,
        type: deserializeEnum<TransactionType>(data['type']),
        sequence: castToType<int>(data['sequence']),
        active: data['active'] as bool?,
      );

  static TransactionCategoriesStruct? maybeFromMap(dynamic data) => data is Map
      ? TransactionCategoriesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'guid': _guid,
        'name': _name,
        'nameEn': _nameEn,
        'type': _type?.serialize(),
        'sequence': _sequence,
        'active': _active,
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
        'nameEn': serializeParam(
          _nameEn,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.Enum,
        ),
        'sequence': serializeParam(
          _sequence,
          ParamType.int,
        ),
        'active': serializeParam(
          _active,
          ParamType.bool,
        ),
      }.withoutNulls;

  static TransactionCategoriesStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      TransactionCategoriesStruct(
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
        nameEn: deserializeParam(
          data['nameEn'],
          ParamType.String,
          false,
        ),
        type: deserializeParam<TransactionType>(
          data['type'],
          ParamType.Enum,
          false,
        ),
        sequence: deserializeParam(
          data['sequence'],
          ParamType.int,
          false,
        ),
        active: deserializeParam(
          data['active'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'TransactionCategoriesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TransactionCategoriesStruct &&
        guid == other.guid &&
        name == other.name &&
        nameEn == other.nameEn &&
        type == other.type &&
        sequence == other.sequence &&
        active == other.active;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([guid, name, nameEn, type, sequence, active]);
}

TransactionCategoriesStruct createTransactionCategoriesStruct({
  String? guid,
  String? name,
  String? nameEn,
  TransactionType? type,
  int? sequence,
  bool? active,
}) =>
    TransactionCategoriesStruct(
      guid: guid,
      name: name,
      nameEn: nameEn,
      type: type,
      sequence: sequence,
      active: active,
    );
