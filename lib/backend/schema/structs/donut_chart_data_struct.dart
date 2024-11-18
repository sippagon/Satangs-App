// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DonutChartDataStruct extends BaseStruct {
  DonutChartDataStruct({
    String? label,
    double? value,
    Color? color,
    double? total,
    String? categoryName,
  })  : _label = label,
        _value = value,
        _color = color,
        _total = total,
        _categoryName = categoryName;

  // "label" field.
  String? _label;
  String get label => _label ?? '';
  set label(String? val) => _label = val;

  bool hasLabel() => _label != null;

  // "value" field.
  double? _value;
  double get value => _value ?? 0.0;
  set value(double? val) => _value = val;

  void incrementValue(double amount) => value = value + amount;

  bool hasValue() => _value != null;

  // "color" field.
  Color? _color;
  Color? get color => _color;
  set color(Color? val) => _color = val;

  bool hasColor() => _color != null;

  // "total" field.
  double? _total;
  double get total => _total ?? 0.0;
  set total(double? val) => _total = val;

  void incrementTotal(double amount) => total = total + amount;

  bool hasTotal() => _total != null;

  // "categoryName" field.
  String? _categoryName;
  String get categoryName => _categoryName ?? '';
  set categoryName(String? val) => _categoryName = val;

  bool hasCategoryName() => _categoryName != null;

  static DonutChartDataStruct fromMap(Map<String, dynamic> data) =>
      DonutChartDataStruct(
        label: data['label'] as String?,
        value: castToType<double>(data['value']),
        color: getSchemaColor(data['color']),
        total: castToType<double>(data['total']),
        categoryName: data['categoryName'] as String?,
      );

  static DonutChartDataStruct? maybeFromMap(dynamic data) => data is Map
      ? DonutChartDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'label': _label,
        'value': _value,
        'color': _color,
        'total': _total,
        'categoryName': _categoryName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'label': serializeParam(
          _label,
          ParamType.String,
        ),
        'value': serializeParam(
          _value,
          ParamType.double,
        ),
        'color': serializeParam(
          _color,
          ParamType.Color,
        ),
        'total': serializeParam(
          _total,
          ParamType.double,
        ),
        'categoryName': serializeParam(
          _categoryName,
          ParamType.String,
        ),
      }.withoutNulls;

  static DonutChartDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      DonutChartDataStruct(
        label: deserializeParam(
          data['label'],
          ParamType.String,
          false,
        ),
        value: deserializeParam(
          data['value'],
          ParamType.double,
          false,
        ),
        color: deserializeParam(
          data['color'],
          ParamType.Color,
          false,
        ),
        total: deserializeParam(
          data['total'],
          ParamType.double,
          false,
        ),
        categoryName: deserializeParam(
          data['categoryName'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DonutChartDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DonutChartDataStruct &&
        label == other.label &&
        value == other.value &&
        color == other.color &&
        total == other.total &&
        categoryName == other.categoryName;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([label, value, color, total, categoryName]);
}

DonutChartDataStruct createDonutChartDataStruct({
  String? label,
  double? value,
  Color? color,
  double? total,
  String? categoryName,
}) =>
    DonutChartDataStruct(
      label: label,
      value: value,
      color: color,
      total: total,
      categoryName: categoryName,
    );
