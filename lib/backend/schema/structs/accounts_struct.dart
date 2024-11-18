// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AccountsStruct extends BaseStruct {
  AccountsStruct({
    String? guid,
    String? name,
    String? description,
    AccountType? type,
    Color? color,
    double? initialAmount,
    double? currentAmount,
    bool? active,
    DateTime? createOnLocalTime,
    DateTime? updateOnLocalTime,
  })  : _guid = guid,
        _name = name,
        _description = description,
        _type = type,
        _color = color,
        _initialAmount = initialAmount,
        _currentAmount = currentAmount,
        _active = active,
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

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "type" field.
  AccountType? _type;
  AccountType get type => _type ?? AccountType.Savings;
  set type(AccountType? val) => _type = val;

  bool hasType() => _type != null;

  // "color" field.
  Color? _color;
  Color get color => _color ?? const Color(0xFF7262FF);
  set color(Color? val) => _color = val;

  bool hasColor() => _color != null;

  // "initialAmount" field.
  double? _initialAmount;
  double get initialAmount => _initialAmount ?? 0.0;
  set initialAmount(double? val) => _initialAmount = val;

  void incrementInitialAmount(double amount) =>
      initialAmount = initialAmount + amount;

  bool hasInitialAmount() => _initialAmount != null;

  // "currentAmount" field.
  double? _currentAmount;
  double get currentAmount => _currentAmount ?? 0.0;
  set currentAmount(double? val) => _currentAmount = val;

  void incrementCurrentAmount(double amount) =>
      currentAmount = currentAmount + amount;

  bool hasCurrentAmount() => _currentAmount != null;

  // "active" field.
  bool? _active;
  bool get active => _active ?? true;
  set active(bool? val) => _active = val;

  bool hasActive() => _active != null;

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

  static AccountsStruct fromMap(Map<String, dynamic> data) => AccountsStruct(
        guid: data['guid'] as String?,
        name: data['name'] as String?,
        description: data['description'] as String?,
        type: deserializeEnum<AccountType>(data['type']),
        color: getSchemaColor(data['color']),
        initialAmount: castToType<double>(data['initialAmount']),
        currentAmount: castToType<double>(data['currentAmount']),
        active: data['active'] as bool?,
        createOnLocalTime: data['createOnLocalTime'] as DateTime?,
        updateOnLocalTime: data['updateOnLocalTime'] as DateTime?,
      );

  static AccountsStruct? maybeFromMap(dynamic data) =>
      data is Map ? AccountsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'guid': _guid,
        'name': _name,
        'description': _description,
        'type': _type?.serialize(),
        'color': _color,
        'initialAmount': _initialAmount,
        'currentAmount': _currentAmount,
        'active': _active,
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
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.Enum,
        ),
        'color': serializeParam(
          _color,
          ParamType.Color,
        ),
        'initialAmount': serializeParam(
          _initialAmount,
          ParamType.double,
        ),
        'currentAmount': serializeParam(
          _currentAmount,
          ParamType.double,
        ),
        'active': serializeParam(
          _active,
          ParamType.bool,
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

  static AccountsStruct fromSerializableMap(Map<String, dynamic> data) =>
      AccountsStruct(
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
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        type: deserializeParam<AccountType>(
          data['type'],
          ParamType.Enum,
          false,
        ),
        color: deserializeParam(
          data['color'],
          ParamType.Color,
          false,
        ),
        initialAmount: deserializeParam(
          data['initialAmount'],
          ParamType.double,
          false,
        ),
        currentAmount: deserializeParam(
          data['currentAmount'],
          ParamType.double,
          false,
        ),
        active: deserializeParam(
          data['active'],
          ParamType.bool,
          false,
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
  String toString() => 'AccountsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AccountsStruct &&
        guid == other.guid &&
        name == other.name &&
        description == other.description &&
        type == other.type &&
        color == other.color &&
        initialAmount == other.initialAmount &&
        currentAmount == other.currentAmount &&
        active == other.active &&
        createOnLocalTime == other.createOnLocalTime &&
        updateOnLocalTime == other.updateOnLocalTime;
  }

  @override
  int get hashCode => const ListEquality().hash([
        guid,
        name,
        description,
        type,
        color,
        initialAmount,
        currentAmount,
        active,
        createOnLocalTime,
        updateOnLocalTime
      ]);
}

AccountsStruct createAccountsStruct({
  String? guid,
  String? name,
  String? description,
  AccountType? type,
  Color? color,
  double? initialAmount,
  double? currentAmount,
  bool? active,
  DateTime? createOnLocalTime,
  DateTime? updateOnLocalTime,
}) =>
    AccountsStruct(
      guid: guid,
      name: name,
      description: description,
      type: type,
      color: color,
      initialAmount: initialAmount,
      currentAmount: currentAmount,
      active: active,
      createOnLocalTime: createOnLocalTime,
      updateOnLocalTime: updateOnLocalTime,
    );
