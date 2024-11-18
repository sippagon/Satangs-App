// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TaxesDeductionStruct extends BaseStruct {
  TaxesDeductionStruct({
    double? personal,
    double? spouse,
    double? child,
    double? parents,
    double? disabledPerson,
    double? healthInsurance,
    double? lifeInsurance,
    double? socialSecurity,
    double? parentsHealthInsurance,
    double? rmf,
    double? ssf,
    double? providentFund,
    double? gpf,
    double? pensionLifeInsurance,
    double? nsf,
    double? generalDonate,
    double? otherDonate,
    double? partyDonate,
    double? total,
  })  : _personal = personal,
        _spouse = spouse,
        _child = child,
        _parents = parents,
        _disabledPerson = disabledPerson,
        _healthInsurance = healthInsurance,
        _lifeInsurance = lifeInsurance,
        _socialSecurity = socialSecurity,
        _parentsHealthInsurance = parentsHealthInsurance,
        _rmf = rmf,
        _ssf = ssf,
        _providentFund = providentFund,
        _gpf = gpf,
        _pensionLifeInsurance = pensionLifeInsurance,
        _nsf = nsf,
        _generalDonate = generalDonate,
        _otherDonate = otherDonate,
        _partyDonate = partyDonate,
        _total = total;

  // "personal" field.
  double? _personal;
  double get personal => _personal ?? 60000.0;
  set personal(double? val) => _personal = val;

  void incrementPersonal(double amount) => personal = personal + amount;

  bool hasPersonal() => _personal != null;

  // "spouse" field.
  double? _spouse;
  double get spouse => _spouse ?? 0.0;
  set spouse(double? val) => _spouse = val;

  void incrementSpouse(double amount) => spouse = spouse + amount;

  bool hasSpouse() => _spouse != null;

  // "child" field.
  double? _child;
  double get child => _child ?? 0.0;
  set child(double? val) => _child = val;

  void incrementChild(double amount) => child = child + amount;

  bool hasChild() => _child != null;

  // "parents" field.
  double? _parents;
  double get parents => _parents ?? 0.0;
  set parents(double? val) => _parents = val;

  void incrementParents(double amount) => parents = parents + amount;

  bool hasParents() => _parents != null;

  // "disabledPerson" field.
  double? _disabledPerson;
  double get disabledPerson => _disabledPerson ?? 0.0;
  set disabledPerson(double? val) => _disabledPerson = val;

  void incrementDisabledPerson(double amount) =>
      disabledPerson = disabledPerson + amount;

  bool hasDisabledPerson() => _disabledPerson != null;

  // "healthInsurance" field.
  double? _healthInsurance;
  double get healthInsurance => _healthInsurance ?? 0.0;
  set healthInsurance(double? val) => _healthInsurance = val;

  void incrementHealthInsurance(double amount) =>
      healthInsurance = healthInsurance + amount;

  bool hasHealthInsurance() => _healthInsurance != null;

  // "lifeInsurance" field.
  double? _lifeInsurance;
  double get lifeInsurance => _lifeInsurance ?? 0.0;
  set lifeInsurance(double? val) => _lifeInsurance = val;

  void incrementLifeInsurance(double amount) =>
      lifeInsurance = lifeInsurance + amount;

  bool hasLifeInsurance() => _lifeInsurance != null;

  // "socialSecurity" field.
  double? _socialSecurity;
  double get socialSecurity => _socialSecurity ?? 0.0;
  set socialSecurity(double? val) => _socialSecurity = val;

  void incrementSocialSecurity(double amount) =>
      socialSecurity = socialSecurity + amount;

  bool hasSocialSecurity() => _socialSecurity != null;

  // "parentsHealthInsurance" field.
  double? _parentsHealthInsurance;
  double get parentsHealthInsurance => _parentsHealthInsurance ?? 0.0;
  set parentsHealthInsurance(double? val) => _parentsHealthInsurance = val;

  void incrementParentsHealthInsurance(double amount) =>
      parentsHealthInsurance = parentsHealthInsurance + amount;

  bool hasParentsHealthInsurance() => _parentsHealthInsurance != null;

  // "RMF" field.
  double? _rmf;
  double get rmf => _rmf ?? 0.0;
  set rmf(double? val) => _rmf = val;

  void incrementRmf(double amount) => rmf = rmf + amount;

  bool hasRmf() => _rmf != null;

  // "SSF" field.
  double? _ssf;
  double get ssf => _ssf ?? 0.0;
  set ssf(double? val) => _ssf = val;

  void incrementSsf(double amount) => ssf = ssf + amount;

  bool hasSsf() => _ssf != null;

  // "providentFund" field.
  double? _providentFund;
  double get providentFund => _providentFund ?? 0.0;
  set providentFund(double? val) => _providentFund = val;

  void incrementProvidentFund(double amount) =>
      providentFund = providentFund + amount;

  bool hasProvidentFund() => _providentFund != null;

  // "GPF" field.
  double? _gpf;
  double get gpf => _gpf ?? 0.0;
  set gpf(double? val) => _gpf = val;

  void incrementGpf(double amount) => gpf = gpf + amount;

  bool hasGpf() => _gpf != null;

  // "pensionLifeInsurance" field.
  double? _pensionLifeInsurance;
  double get pensionLifeInsurance => _pensionLifeInsurance ?? 0.0;
  set pensionLifeInsurance(double? val) => _pensionLifeInsurance = val;

  void incrementPensionLifeInsurance(double amount) =>
      pensionLifeInsurance = pensionLifeInsurance + amount;

  bool hasPensionLifeInsurance() => _pensionLifeInsurance != null;

  // "NSF" field.
  double? _nsf;
  double get nsf => _nsf ?? 0.0;
  set nsf(double? val) => _nsf = val;

  void incrementNsf(double amount) => nsf = nsf + amount;

  bool hasNsf() => _nsf != null;

  // "generalDonate" field.
  double? _generalDonate;
  double get generalDonate => _generalDonate ?? 0.0;
  set generalDonate(double? val) => _generalDonate = val;

  void incrementGeneralDonate(double amount) =>
      generalDonate = generalDonate + amount;

  bool hasGeneralDonate() => _generalDonate != null;

  // "otherDonate" field.
  double? _otherDonate;
  double get otherDonate => _otherDonate ?? 0.0;
  set otherDonate(double? val) => _otherDonate = val;

  void incrementOtherDonate(double amount) =>
      otherDonate = otherDonate + amount;

  bool hasOtherDonate() => _otherDonate != null;

  // "partyDonate" field.
  double? _partyDonate;
  double get partyDonate => _partyDonate ?? 0.0;
  set partyDonate(double? val) => _partyDonate = val;

  void incrementPartyDonate(double amount) =>
      partyDonate = partyDonate + amount;

  bool hasPartyDonate() => _partyDonate != null;

  // "total" field.
  double? _total;
  double get total => _total ?? 0.0;
  set total(double? val) => _total = val;

  void incrementTotal(double amount) => total = total + amount;

  bool hasTotal() => _total != null;

  static TaxesDeductionStruct fromMap(Map<String, dynamic> data) =>
      TaxesDeductionStruct(
        personal: castToType<double>(data['personal']),
        spouse: castToType<double>(data['spouse']),
        child: castToType<double>(data['child']),
        parents: castToType<double>(data['parents']),
        disabledPerson: castToType<double>(data['disabledPerson']),
        healthInsurance: castToType<double>(data['healthInsurance']),
        lifeInsurance: castToType<double>(data['lifeInsurance']),
        socialSecurity: castToType<double>(data['socialSecurity']),
        parentsHealthInsurance:
            castToType<double>(data['parentsHealthInsurance']),
        rmf: castToType<double>(data['RMF']),
        ssf: castToType<double>(data['SSF']),
        providentFund: castToType<double>(data['providentFund']),
        gpf: castToType<double>(data['GPF']),
        pensionLifeInsurance: castToType<double>(data['pensionLifeInsurance']),
        nsf: castToType<double>(data['NSF']),
        generalDonate: castToType<double>(data['generalDonate']),
        otherDonate: castToType<double>(data['otherDonate']),
        partyDonate: castToType<double>(data['partyDonate']),
        total: castToType<double>(data['total']),
      );

  static TaxesDeductionStruct? maybeFromMap(dynamic data) => data is Map
      ? TaxesDeductionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'personal': _personal,
        'spouse': _spouse,
        'child': _child,
        'parents': _parents,
        'disabledPerson': _disabledPerson,
        'healthInsurance': _healthInsurance,
        'lifeInsurance': _lifeInsurance,
        'socialSecurity': _socialSecurity,
        'parentsHealthInsurance': _parentsHealthInsurance,
        'RMF': _rmf,
        'SSF': _ssf,
        'providentFund': _providentFund,
        'GPF': _gpf,
        'pensionLifeInsurance': _pensionLifeInsurance,
        'NSF': _nsf,
        'generalDonate': _generalDonate,
        'otherDonate': _otherDonate,
        'partyDonate': _partyDonate,
        'total': _total,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'personal': serializeParam(
          _personal,
          ParamType.double,
        ),
        'spouse': serializeParam(
          _spouse,
          ParamType.double,
        ),
        'child': serializeParam(
          _child,
          ParamType.double,
        ),
        'parents': serializeParam(
          _parents,
          ParamType.double,
        ),
        'disabledPerson': serializeParam(
          _disabledPerson,
          ParamType.double,
        ),
        'healthInsurance': serializeParam(
          _healthInsurance,
          ParamType.double,
        ),
        'lifeInsurance': serializeParam(
          _lifeInsurance,
          ParamType.double,
        ),
        'socialSecurity': serializeParam(
          _socialSecurity,
          ParamType.double,
        ),
        'parentsHealthInsurance': serializeParam(
          _parentsHealthInsurance,
          ParamType.double,
        ),
        'RMF': serializeParam(
          _rmf,
          ParamType.double,
        ),
        'SSF': serializeParam(
          _ssf,
          ParamType.double,
        ),
        'providentFund': serializeParam(
          _providentFund,
          ParamType.double,
        ),
        'GPF': serializeParam(
          _gpf,
          ParamType.double,
        ),
        'pensionLifeInsurance': serializeParam(
          _pensionLifeInsurance,
          ParamType.double,
        ),
        'NSF': serializeParam(
          _nsf,
          ParamType.double,
        ),
        'generalDonate': serializeParam(
          _generalDonate,
          ParamType.double,
        ),
        'otherDonate': serializeParam(
          _otherDonate,
          ParamType.double,
        ),
        'partyDonate': serializeParam(
          _partyDonate,
          ParamType.double,
        ),
        'total': serializeParam(
          _total,
          ParamType.double,
        ),
      }.withoutNulls;

  static TaxesDeductionStruct fromSerializableMap(Map<String, dynamic> data) =>
      TaxesDeductionStruct(
        personal: deserializeParam(
          data['personal'],
          ParamType.double,
          false,
        ),
        spouse: deserializeParam(
          data['spouse'],
          ParamType.double,
          false,
        ),
        child: deserializeParam(
          data['child'],
          ParamType.double,
          false,
        ),
        parents: deserializeParam(
          data['parents'],
          ParamType.double,
          false,
        ),
        disabledPerson: deserializeParam(
          data['disabledPerson'],
          ParamType.double,
          false,
        ),
        healthInsurance: deserializeParam(
          data['healthInsurance'],
          ParamType.double,
          false,
        ),
        lifeInsurance: deserializeParam(
          data['lifeInsurance'],
          ParamType.double,
          false,
        ),
        socialSecurity: deserializeParam(
          data['socialSecurity'],
          ParamType.double,
          false,
        ),
        parentsHealthInsurance: deserializeParam(
          data['parentsHealthInsurance'],
          ParamType.double,
          false,
        ),
        rmf: deserializeParam(
          data['RMF'],
          ParamType.double,
          false,
        ),
        ssf: deserializeParam(
          data['SSF'],
          ParamType.double,
          false,
        ),
        providentFund: deserializeParam(
          data['providentFund'],
          ParamType.double,
          false,
        ),
        gpf: deserializeParam(
          data['GPF'],
          ParamType.double,
          false,
        ),
        pensionLifeInsurance: deserializeParam(
          data['pensionLifeInsurance'],
          ParamType.double,
          false,
        ),
        nsf: deserializeParam(
          data['NSF'],
          ParamType.double,
          false,
        ),
        generalDonate: deserializeParam(
          data['generalDonate'],
          ParamType.double,
          false,
        ),
        otherDonate: deserializeParam(
          data['otherDonate'],
          ParamType.double,
          false,
        ),
        partyDonate: deserializeParam(
          data['partyDonate'],
          ParamType.double,
          false,
        ),
        total: deserializeParam(
          data['total'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'TaxesDeductionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TaxesDeductionStruct &&
        personal == other.personal &&
        spouse == other.spouse &&
        child == other.child &&
        parents == other.parents &&
        disabledPerson == other.disabledPerson &&
        healthInsurance == other.healthInsurance &&
        lifeInsurance == other.lifeInsurance &&
        socialSecurity == other.socialSecurity &&
        parentsHealthInsurance == other.parentsHealthInsurance &&
        rmf == other.rmf &&
        ssf == other.ssf &&
        providentFund == other.providentFund &&
        gpf == other.gpf &&
        pensionLifeInsurance == other.pensionLifeInsurance &&
        nsf == other.nsf &&
        generalDonate == other.generalDonate &&
        otherDonate == other.otherDonate &&
        partyDonate == other.partyDonate &&
        total == other.total;
  }

  @override
  int get hashCode => const ListEquality().hash([
        personal,
        spouse,
        child,
        parents,
        disabledPerson,
        healthInsurance,
        lifeInsurance,
        socialSecurity,
        parentsHealthInsurance,
        rmf,
        ssf,
        providentFund,
        gpf,
        pensionLifeInsurance,
        nsf,
        generalDonate,
        otherDonate,
        partyDonate,
        total
      ]);
}

TaxesDeductionStruct createTaxesDeductionStruct({
  double? personal,
  double? spouse,
  double? child,
  double? parents,
  double? disabledPerson,
  double? healthInsurance,
  double? lifeInsurance,
  double? socialSecurity,
  double? parentsHealthInsurance,
  double? rmf,
  double? ssf,
  double? providentFund,
  double? gpf,
  double? pensionLifeInsurance,
  double? nsf,
  double? generalDonate,
  double? otherDonate,
  double? partyDonate,
  double? total,
}) =>
    TaxesDeductionStruct(
      personal: personal,
      spouse: spouse,
      child: child,
      parents: parents,
      disabledPerson: disabledPerson,
      healthInsurance: healthInsurance,
      lifeInsurance: lifeInsurance,
      socialSecurity: socialSecurity,
      parentsHealthInsurance: parentsHealthInsurance,
      rmf: rmf,
      ssf: ssf,
      providentFund: providentFund,
      gpf: gpf,
      pensionLifeInsurance: pensionLifeInsurance,
      nsf: nsf,
      generalDonate: generalDonate,
      otherDonate: otherDonate,
      partyDonate: partyDonate,
      total: total,
    );
