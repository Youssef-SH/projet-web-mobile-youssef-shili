// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'club_leader_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ClubLeaderDtoRoleEnum _$clubLeaderDtoRoleEnum_president =
    const ClubLeaderDtoRoleEnum._('president');
const ClubLeaderDtoRoleEnum _$clubLeaderDtoRoleEnum_vicePresident =
    const ClubLeaderDtoRoleEnum._('vicePresident');

ClubLeaderDtoRoleEnum _$clubLeaderDtoRoleEnumValueOf(String name) {
  switch (name) {
    case 'president':
      return _$clubLeaderDtoRoleEnum_president;
    case 'vicePresident':
      return _$clubLeaderDtoRoleEnum_vicePresident;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ClubLeaderDtoRoleEnum> _$clubLeaderDtoRoleEnumValues =
    BuiltSet<ClubLeaderDtoRoleEnum>(const <ClubLeaderDtoRoleEnum>[
  _$clubLeaderDtoRoleEnum_president,
  _$clubLeaderDtoRoleEnum_vicePresident,
]);

const ClubLeaderDtoStudyLevelEnum _$clubLeaderDtoStudyLevelEnum_cPI1 =
    const ClubLeaderDtoStudyLevelEnum._('cPI1');
const ClubLeaderDtoStudyLevelEnum _$clubLeaderDtoStudyLevelEnum_cPI2 =
    const ClubLeaderDtoStudyLevelEnum._('cPI2');
const ClubLeaderDtoStudyLevelEnum _$clubLeaderDtoStudyLevelEnum_l1 =
    const ClubLeaderDtoStudyLevelEnum._('l1');
const ClubLeaderDtoStudyLevelEnum _$clubLeaderDtoStudyLevelEnum_l2 =
    const ClubLeaderDtoStudyLevelEnum._('l2');
const ClubLeaderDtoStudyLevelEnum _$clubLeaderDtoStudyLevelEnum_l3 =
    const ClubLeaderDtoStudyLevelEnum._('l3');
const ClubLeaderDtoStudyLevelEnum _$clubLeaderDtoStudyLevelEnum_iNG1 =
    const ClubLeaderDtoStudyLevelEnum._('iNG1');
const ClubLeaderDtoStudyLevelEnum _$clubLeaderDtoStudyLevelEnum_iNG2 =
    const ClubLeaderDtoStudyLevelEnum._('iNG2');
const ClubLeaderDtoStudyLevelEnum _$clubLeaderDtoStudyLevelEnum_iNG3 =
    const ClubLeaderDtoStudyLevelEnum._('iNG3');
const ClubLeaderDtoStudyLevelEnum _$clubLeaderDtoStudyLevelEnum_m1 =
    const ClubLeaderDtoStudyLevelEnum._('m1');
const ClubLeaderDtoStudyLevelEnum _$clubLeaderDtoStudyLevelEnum_m2 =
    const ClubLeaderDtoStudyLevelEnum._('m2');

ClubLeaderDtoStudyLevelEnum _$clubLeaderDtoStudyLevelEnumValueOf(String name) {
  switch (name) {
    case 'cPI1':
      return _$clubLeaderDtoStudyLevelEnum_cPI1;
    case 'cPI2':
      return _$clubLeaderDtoStudyLevelEnum_cPI2;
    case 'l1':
      return _$clubLeaderDtoStudyLevelEnum_l1;
    case 'l2':
      return _$clubLeaderDtoStudyLevelEnum_l2;
    case 'l3':
      return _$clubLeaderDtoStudyLevelEnum_l3;
    case 'iNG1':
      return _$clubLeaderDtoStudyLevelEnum_iNG1;
    case 'iNG2':
      return _$clubLeaderDtoStudyLevelEnum_iNG2;
    case 'iNG3':
      return _$clubLeaderDtoStudyLevelEnum_iNG3;
    case 'm1':
      return _$clubLeaderDtoStudyLevelEnum_m1;
    case 'm2':
      return _$clubLeaderDtoStudyLevelEnum_m2;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ClubLeaderDtoStudyLevelEnum>
    _$clubLeaderDtoStudyLevelEnumValues =
    BuiltSet<ClubLeaderDtoStudyLevelEnum>(const <ClubLeaderDtoStudyLevelEnum>[
  _$clubLeaderDtoStudyLevelEnum_cPI1,
  _$clubLeaderDtoStudyLevelEnum_cPI2,
  _$clubLeaderDtoStudyLevelEnum_l1,
  _$clubLeaderDtoStudyLevelEnum_l2,
  _$clubLeaderDtoStudyLevelEnum_l3,
  _$clubLeaderDtoStudyLevelEnum_iNG1,
  _$clubLeaderDtoStudyLevelEnum_iNG2,
  _$clubLeaderDtoStudyLevelEnum_iNG3,
  _$clubLeaderDtoStudyLevelEnum_m1,
  _$clubLeaderDtoStudyLevelEnum_m2,
]);

Serializer<ClubLeaderDtoRoleEnum> _$clubLeaderDtoRoleEnumSerializer =
    _$ClubLeaderDtoRoleEnumSerializer();
Serializer<ClubLeaderDtoStudyLevelEnum>
    _$clubLeaderDtoStudyLevelEnumSerializer =
    _$ClubLeaderDtoStudyLevelEnumSerializer();

class _$ClubLeaderDtoRoleEnumSerializer
    implements PrimitiveSerializer<ClubLeaderDtoRoleEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'president': 'President',
    'vicePresident': 'VicePresident',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'President': 'president',
    'VicePresident': 'vicePresident',
  };

  @override
  final Iterable<Type> types = const <Type>[ClubLeaderDtoRoleEnum];
  @override
  final String wireName = 'ClubLeaderDtoRoleEnum';

  @override
  Object serialize(Serializers serializers, ClubLeaderDtoRoleEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ClubLeaderDtoRoleEnum deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ClubLeaderDtoRoleEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$ClubLeaderDtoStudyLevelEnumSerializer
    implements PrimitiveSerializer<ClubLeaderDtoStudyLevelEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'cPI1': 'CPI1',
    'cPI2': 'CPI2',
    'l1': 'L1',
    'l2': 'L2',
    'l3': 'L3',
    'iNG1': 'ING1',
    'iNG2': 'ING2',
    'iNG3': 'ING3',
    'm1': 'M1',
    'm2': 'M2',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'CPI1': 'cPI1',
    'CPI2': 'cPI2',
    'L1': 'l1',
    'L2': 'l2',
    'L3': 'l3',
    'ING1': 'iNG1',
    'ING2': 'iNG2',
    'ING3': 'iNG3',
    'M1': 'm1',
    'M2': 'm2',
  };

  @override
  final Iterable<Type> types = const <Type>[ClubLeaderDtoStudyLevelEnum];
  @override
  final String wireName = 'ClubLeaderDtoStudyLevelEnum';

  @override
  Object serialize(Serializers serializers, ClubLeaderDtoStudyLevelEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ClubLeaderDtoStudyLevelEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ClubLeaderDtoStudyLevelEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$ClubLeaderDto extends ClubLeaderDto {
  @override
  final String? id;
  @override
  final ClubLeaderDtoRoleEnum role;
  @override
  final String fullName;
  @override
  final String email;
  @override
  final String phone;
  @override
  final String cin;
  @override
  final ClubLeaderDtoStudyLevelEnum studyLevel;
  @override
  final String specialization;

  factory _$ClubLeaderDto([void Function(ClubLeaderDtoBuilder)? updates]) =>
      (ClubLeaderDtoBuilder()..update(updates))._build();

  _$ClubLeaderDto._(
      {this.id,
      required this.role,
      required this.fullName,
      required this.email,
      required this.phone,
      required this.cin,
      required this.studyLevel,
      required this.specialization})
      : super._();
  @override
  ClubLeaderDto rebuild(void Function(ClubLeaderDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClubLeaderDtoBuilder toBuilder() => ClubLeaderDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClubLeaderDto &&
        id == other.id &&
        role == other.role &&
        fullName == other.fullName &&
        email == other.email &&
        phone == other.phone &&
        cin == other.cin &&
        studyLevel == other.studyLevel &&
        specialization == other.specialization;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, role.hashCode);
    _$hash = $jc(_$hash, fullName.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, phone.hashCode);
    _$hash = $jc(_$hash, cin.hashCode);
    _$hash = $jc(_$hash, studyLevel.hashCode);
    _$hash = $jc(_$hash, specialization.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ClubLeaderDto')
          ..add('id', id)
          ..add('role', role)
          ..add('fullName', fullName)
          ..add('email', email)
          ..add('phone', phone)
          ..add('cin', cin)
          ..add('studyLevel', studyLevel)
          ..add('specialization', specialization))
        .toString();
  }
}

class ClubLeaderDtoBuilder
    implements Builder<ClubLeaderDto, ClubLeaderDtoBuilder> {
  _$ClubLeaderDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  ClubLeaderDtoRoleEnum? _role;
  ClubLeaderDtoRoleEnum? get role => _$this._role;
  set role(ClubLeaderDtoRoleEnum? role) => _$this._role = role;

  String? _fullName;
  String? get fullName => _$this._fullName;
  set fullName(String? fullName) => _$this._fullName = fullName;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(String? phone) => _$this._phone = phone;

  String? _cin;
  String? get cin => _$this._cin;
  set cin(String? cin) => _$this._cin = cin;

  ClubLeaderDtoStudyLevelEnum? _studyLevel;
  ClubLeaderDtoStudyLevelEnum? get studyLevel => _$this._studyLevel;
  set studyLevel(ClubLeaderDtoStudyLevelEnum? studyLevel) =>
      _$this._studyLevel = studyLevel;

  String? _specialization;
  String? get specialization => _$this._specialization;
  set specialization(String? specialization) =>
      _$this._specialization = specialization;

  ClubLeaderDtoBuilder() {
    ClubLeaderDto._defaults(this);
  }

  ClubLeaderDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _role = $v.role;
      _fullName = $v.fullName;
      _email = $v.email;
      _phone = $v.phone;
      _cin = $v.cin;
      _studyLevel = $v.studyLevel;
      _specialization = $v.specialization;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ClubLeaderDto other) {
    _$v = other as _$ClubLeaderDto;
  }

  @override
  void update(void Function(ClubLeaderDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClubLeaderDto build() => _build();

  _$ClubLeaderDto _build() {
    final _$result = _$v ??
        _$ClubLeaderDto._(
          id: id,
          role: BuiltValueNullFieldError.checkNotNull(
              role, r'ClubLeaderDto', 'role'),
          fullName: BuiltValueNullFieldError.checkNotNull(
              fullName, r'ClubLeaderDto', 'fullName'),
          email: BuiltValueNullFieldError.checkNotNull(
              email, r'ClubLeaderDto', 'email'),
          phone: BuiltValueNullFieldError.checkNotNull(
              phone, r'ClubLeaderDto', 'phone'),
          cin: BuiltValueNullFieldError.checkNotNull(
              cin, r'ClubLeaderDto', 'cin'),
          studyLevel: BuiltValueNullFieldError.checkNotNull(
              studyLevel, r'ClubLeaderDto', 'studyLevel'),
          specialization: BuiltValueNullFieldError.checkNotNull(
              specialization, r'ClubLeaderDto', 'specialization'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
