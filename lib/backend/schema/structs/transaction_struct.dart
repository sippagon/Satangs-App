// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TransactionStruct extends BaseStruct {
  TransactionStruct({
    String? guid,
    DateTime? date,
    double? amount,
    String? typeId,
    String? categoryId,
    String? accountId,
    String? targetAccountId,
    DateTime? createOnLocalTime,
    DateTime? updateOnLocalTime,
  })  : _guid = guid,
        _date = date,
        _amount = amount,
        _typeId = typeId,
        _categoryId = categoryId,
        _accountId = accountId,
        _targetAccountId = targetAccountId,
        _createOnLocalTime = createOnLocalTime,
        _updateOnLocalTime = updateOnLocalTime;

  // "guid" field.
  String? _guid;
  String get guid => _guid ?? '';
  set guid(String? val) => _guid = val;

  bool hasGuid() => _guid != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;

  bool hasDate() => _date != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  set amount(double? val) => _amount = val;

  void incrementAmount(double amount) => amount = amount + amount;

  bool hasAmount() => _amount != null;

  // "typeId" field.
  String? _typeId;
  String get typeId => _typeId ?? '';
  set typeId(String? val) => _typeId = val;

  bool hasTypeId() => _typeId != null;

  // "categoryId" field.
  String? _categoryId;
  String get categoryId => _categoryId ?? '';
  set categoryId(String? val) => _categoryId = val;

  bool hasCategoryId() => _categoryId != null;

  // "accountId" field.
  String? _accountId;
  String get accountId => _accountId ?? '';
  set accountId(String? val) => _accountId = val;

  bool hasAccountId() => _accountId != null;

  // "targetAccountId" field.
  String? _targetAccountId;
  String get targetAccountId => _targetAccountId ?? '';
  set targetAccountId(String? val) => _targetAccountId = val;

  bool hasTargetAccountId() => _targetAccountId != null;

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

  static TransactionStruct fromMap(Map<String, dynamic> data) =>
      TransactionStruct(
        guid: data['guid'] as String?,
        date: data['date'] as DateTime?,
        amount: castToType<double>(data['amount']),
        typeId: data['typeId'] as String?,
        categoryId: data['categoryId'] as String?,
        accountId: data['accountId'] as String?,
        targetAccountId: data['targetAccountId'] as String?,
        createOnLocalTime: data['createOnLocalTime'] as DateTime?,
        updateOnLocalTime: data['updateOnLocalTime'] as DateTime?,
      );

  static TransactionStruct? maybeFromMap(dynamic data) => data is Map
      ? TransactionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'guid': _guid,
        'date': _date,
        'amount': _amount,
        'typeId': _typeId,
        'categoryId': _categoryId,
        'accountId': _accountId,
        'targetAccountId': _targetAccountId,
        'createOnLocalTime': _createOnLocalTime,
        'updateOnLocalTime': _updateOnLocalTime,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'guid': serializeParam(
          _guid,
          ParamType.String,
        ),
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
        'amount': serializeParam(
          _amount,
          ParamType.double,
        ),
        'typeId': serializeParam(
          _typeId,
          ParamType.String,
        ),
        'categoryId': serializeParam(
          _categoryId,
          ParamType.String,
        ),
        'accountId': serializeParam(
          _accountId,
          ParamType.String,
        ),
        'targetAccountId': serializeParam(
          _targetAccountId,
          ParamType.String,
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

  static TransactionStruct fromSerializableMap(Map<String, dynamic> data) =>
      TransactionStruct(
        guid: deserializeParam(
          data['guid'],
          ParamType.String,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
        amount: deserializeParam(
          data['amount'],
          ParamType.double,
          false,
        ),
        typeId: deserializeParam(
          data['typeId'],
          ParamType.String,
          false,
        ),
        categoryId: deserializeParam(
          data['categoryId'],
          ParamType.String,
          false,
        ),
        accountId: deserializeParam(
          data['accountId'],
          ParamType.String,
          false,
        ),
        targetAccountId: deserializeParam(
          data['targetAccountId'],
          ParamType.String,
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
  String toString() => 'TransactionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TransactionStruct &&
        guid == other.guid &&
        date == other.date &&
        amount == other.amount &&
        typeId == other.typeId &&
        categoryId == other.categoryId &&
        accountId == other.accountId &&
        targetAccountId == other.targetAccountId &&
        createOnLocalTime == other.createOnLocalTime &&
        updateOnLocalTime == other.updateOnLocalTime;
  }

  @override
  int get hashCode => const ListEquality().hash([
        guid,
        date,
        amount,
        typeId,
        categoryId,
        accountId,
        targetAccountId,
        createOnLocalTime,
        updateOnLocalTime
      ]);
}

TransactionStruct createTransactionStruct({
  String? guid,
  DateTime? date,
  double? amount,
  String? typeId,
  String? categoryId,
  String? accountId,
  String? targetAccountId,
  DateTime? createOnLocalTime,
  DateTime? updateOnLocalTime,
}) =>
    TransactionStruct(
      guid: guid,
      date: date,
      amount: amount,
      typeId: typeId,
      categoryId: categoryId,
      accountId: accountId,
      targetAccountId: targetAccountId,
      createOnLocalTime: createOnLocalTime,
      updateOnLocalTime: updateOnLocalTime,
    );
