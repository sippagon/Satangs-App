import 'package:collection/collection.dart';

enum AccountType {
  Savings,
}

enum TransactionType {
  Income,
  Expense,
  Transfer,
}

enum DateFilterRange {
  oneMonth,
  threeMonth,
  thisYear,
}

enum EditOrDeleteDataType {
  Goal,
  Budget,
}

enum AppStateDataListType {
  Account,
  Transaction,
  Goal,
  Budget,
  Taxes,
}

enum TaxsDeductionGroup {
  PersonalOrFamily,
  InsuranceOrInvestments,
  Donation,
  Other,
}

enum MaritalStatus {
  Single,
  Engaged,
  Married,
  Separated,
  Divorced,
  Widowed,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (AccountType):
      return AccountType.values.deserialize(value) as T?;
    case (TransactionType):
      return TransactionType.values.deserialize(value) as T?;
    case (DateFilterRange):
      return DateFilterRange.values.deserialize(value) as T?;
    case (EditOrDeleteDataType):
      return EditOrDeleteDataType.values.deserialize(value) as T?;
    case (AppStateDataListType):
      return AppStateDataListType.values.deserialize(value) as T?;
    case (TaxsDeductionGroup):
      return TaxsDeductionGroup.values.deserialize(value) as T?;
    case (MaritalStatus):
      return MaritalStatus.values.deserialize(value) as T?;
    default:
      return null;
  }
}
