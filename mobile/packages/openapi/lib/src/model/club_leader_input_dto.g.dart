// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'club_leader_input_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ClubLeaderInputDtoRoleEnum _$clubLeaderInputDtoRoleEnum_president =
    const ClubLeaderInputDtoRoleEnum._('president');
const ClubLeaderInputDtoRoleEnum _$clubLeaderInputDtoRoleEnum_vicePresident =
    const ClubLeaderInputDtoRoleEnum._('vicePresident');

ClubLeaderInputDtoRoleEnum _$clubLeaderInputDtoRoleEnumValueOf(String name) {
  switch (name) {
    case 'president':
      return _$clubLeaderInputDtoRoleEnum_president;
    case 'vicePresident':
      return _$clubLeaderInputDtoRoleEnum_vicePresident;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ClubLeaderInputDtoRoleEnum> _$clubLeaderInputDtoRoleEnumValues =
    BuiltSet<ClubLeaderInputDtoRoleEnum>(const <ClubLeaderInputDtoRoleEnum>[
  _$clubLeaderInputDtoRoleEnum_president,
  _$clubLeaderInputDtoRoleEnum_vicePresident,
]);

const ClubLeaderInputDtoStudyLevelEnum _$clubLeaderInputDtoStudyLevelEnum_cPI1 =
    const ClubLeaderInputDtoStudyLevelEnum._('cPI1');
const ClubLeaderInputDtoStudyLevelEnum _$clubLeaderInputDtoStudyLevelEnum_cPI2 =
    const ClubLeaderInputDtoStudyLevelEnum._('cPI2');
const ClubLeaderInputDtoStudyLevelEnum _$clubLeaderInputDtoStudyLevelEnum_l1 =
    const ClubLeaderInputDtoStudyLevelEnum._('l1');
const ClubLeaderInputDtoStudyLevelEnum _$clubLeaderInputDtoStudyLevelEnum_l2 =
    const ClubLeaderInputDtoStudyLevelEnum._('l2');
const ClubLeaderInputDtoStudyLevelEnum _$clubLeaderInputDtoStudyLevelEnum_l3 =
    const ClubLeaderInputDtoStudyLevelEnum._('l3');
const ClubLeaderInputDtoStudyLevelEnum _$clubLeaderInputDtoStudyLevelEnum_iNG1 =
    const ClubLeaderInputDtoStudyLevelEnum._('iNG1');
const ClubLeaderInputDtoStudyLevelEnum _$clubLeaderInputDtoStudyLevelEnum_iNG2 =
    const ClubLeaderInputDtoStudyLevelEnum._('iNG2');
const ClubLeaderInputDtoStudyLevelEnum _$clubLeaderInputDtoStudyLevelEnum_iNG3 =
    const ClubLeaderInputDtoStudyLevelEnum._('iNG3');
const ClubLeaderInputDtoStudyLevelEnum _$clubLeaderInputDtoStudyLevelEnum_m1 =
    const ClubLeaderInputDtoStudyLevelEnum._('m1');
const ClubLeaderInputDtoStudyLevelEnum _$clubLeaderInputDtoStudyLevelEnum_m2 =
    const ClubLeaderInputDtoStudyLevelEnum._('m2');

ClubLeaderInputDtoStudyLevelEnum _$clubLeaderInputDtoStudyLevelEnumValueOf(
    String name) {
  switch (name) {
    case 'cPI1':
      return _$clubLeaderInputDtoStudyLevelEnum_cPI1;
    case 'cPI2':
      return _$clubLeaderInputDtoStudyLevelEnum_cPI2;
    case 'l1':
      return _$clubLeaderInputDtoStudyLevelEnum_l1;
    case 'l2':
      return _$clubLeaderInputDtoStudyLevelEnum_l2;
    case 'l3':
      return _$clubLeaderInputDtoStudyLevelEnum_l3;
    case 'iNG1':
      return _$clubLeaderInputDtoStudyLevelEnum_iNG1;
    case 'iNG2':
      return _$clubLeaderInputDtoStudyLevelEnum_iNG2;
    case 'iNG3':
      return _$clubLeaderInputDtoStudyLevelEnum_iNG3;
    case 'm1':
      return _$clubLeaderInputDtoStudyLevelEnum_m1;
    case 'm2':
      return _$clubLeaderInputDtoStudyLevelEnum_m2;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ClubLeaderInputDtoStudyLevelEnum>
    _$clubLeaderInputDtoStudyLevelEnumValues = BuiltSet<
        ClubLeaderInputDtoStudyLevelEnum>(const <ClubLeaderInputDtoStudyLevelEnum>[
  _$clubLeaderInputDtoStudyLevelEnum_cPI1,
  _$clubLeaderInputDtoStudyLevelEnum_cPI2,
  _$clubLeaderInputDtoStudyLevelEnum_l1,
  _$clubLeaderInputDtoStudyLevelEnum_l2,
  _$clubLeaderInputDtoStudyLevelEnum_l3,
  _$clubLeaderInputDtoStudyLevelEnum_iNG1,
  _$clubLeaderInputDtoStudyLevelEnum_iNG2,
  _$clubLeaderInputDtoStudyLevelEnum_iNG3,
  _$clubLeaderInputDtoStudyLevelEnum_m1,
  _$clubLeaderInputDtoStudyLevelEnum_m2,
]);

Serializer<ClubLeaderInputDtoRoleEnum> _$clubLeaderInputDtoRoleEnumSerializer =
    _$ClubLeaderInputDtoRoleEnumSerializer();
Serializer<ClubLeaderInputDtoStudyLevelEnum>
    _$clubLeaderInputDtoStudyLevelEnumSerializer =
    _$ClubLeaderInputDtoStudyLevelEnumSerializer();

class _$ClubLeaderInputDtoRoleEnumSerializer
    implements PrimitiveSerializer<ClubLeaderInputDtoRoleEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'president': 'President',
    'vicePresident': 'VicePresident',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'President': 'president',
    'VicePresident': 'vicePresident',
  };

  @override
  final Iterable<Type> types = const <Type>[ClubLeaderInputDtoRoleEnum];
  @override
  final String wireName = 'ClubLeaderInputDtoRoleEnum';

  @override
  Object serialize(Serializers serializers, ClubLeaderInputDtoRoleEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ClubLeaderInputDtoRoleEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ClubLeaderInputDtoRoleEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$ClubLeaderInputDtoStudyLevelEnumSerializer
    implements PrimitiveSerializer<ClubLeaderInputDtoStudyLevelEnum> {
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
  final Iterable<Type> types = const <Type>[ClubLeaderInputDtoStudyLevelEnum];
  @override
  final String wireName = 'ClubLeaderInputDtoStudyLevelEnum';

  @override
  Object serialize(
          Serializers serializers, ClubLeaderInputDtoStudyLevelEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ClubLeaderInputDtoStudyLevelEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ClubLeaderInputDtoStudyLevelEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$ClubLeaderInputDto extends ClubLeaderInputDto {
  @override
  final ClubLeaderInputDtoRoleEnum role;
  @override
  final String fullName;
  @override
  final String email;
  @override
  final String phone;
  @override
  final String cin;
  @override
  final ClubLeaderInputDtoStudyLevelEnum studyLevel;
  @override
  final String specialization;

  factory _$ClubLeaderInputDto(
          [void Function(ClubLeaderInputDtoBuilder)? updates]) =>
      (ClubLeaderInputDtoBuilder()..update(updates))._build();

  _$ClubLeaderInputDto._(
      {required this.role,
      required this.fullName,
      required this.email,
      required this.phone,
      required this.cin,
      required this.studyLevel,
      required this.specialization})
      : super._();
  @override
  ClubLeaderInputDto rebuild(
          void Function(ClubLeaderInputDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClubLeaderInputDtoBuilder toBuilder() =>
      ClubLeaderInputDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClubLeaderInputDto &&
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
    return (newBuiltValueToStringHelper(r'ClubLeaderInputDto')
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

class ClubLeaderInputDtoBuilder
    implements Builder<ClubLeaderInputDto, ClubLeaderInputDtoBuilder> {
  _$ClubLeaderInputDto? _$v;

  ClubLeaderInputDtoRoleEnum? _role;
  ClubLeaderInputDtoRoleEnum? get role => _$this._role;
  set role(ClubLeaderInputDtoRoleEnum? role) => _$this._role = role;

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

  ClubLeaderInputDtoStudyLevelEnum? _studyLevel;
  ClubLeaderInputDtoStudyLevelEnum? get studyLevel => _$this._studyLevel;
  set studyLevel(ClubLeaderInputDtoStudyLevelEnum? studyLevel) =>
      _$this._studyLevel = studyLevel;

  String? _specialization;
  String? get specialization => _$this._specialization;
  set specialization(String? specialization) =>
      _$this._specialization = specialization;

  ClubLeaderInputDtoBuilder() {
    ClubLeaderInputDto._defaults(this);
  }

  ClubLeaderInputDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
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
  void replace(ClubLeaderInputDto other) {
    _$v = other as _$ClubLeaderInputDto;
  }

  @override
  void update(void Function(ClubLeaderInputDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClubLeaderInputDto build() => _build();

  _$ClubLeaderInputDto _build() {
    final _$result = _$v ??
        _$ClubLeaderInputDto._(
          role: BuiltValueNullFieldError.checkNotNull(
              role, r'ClubLeaderInputDto', 'role'),
          fullName: BuiltValueNullFieldError.checkNotNull(
              fullName, r'ClubLeaderInputDto', 'fullName'),
          email: BuiltValueNullFieldError.checkNotNull(
              email, r'ClubLeaderInputDto', 'email'),
          phone: BuiltValueNullFieldError.checkNotNull(
              phone, r'ClubLeaderInputDto', 'phone'),
          cin: BuiltValueNullFieldError.checkNotNull(
              cin, r'ClubLeaderInputDto', 'cin'),
          studyLevel: BuiltValueNullFieldError.checkNotNull(
              studyLevel, r'ClubLeaderInputDto', 'studyLevel'),
          specialization: BuiltValueNullFieldError.checkNotNull(
              specialization, r'ClubLeaderInputDto', 'specialization'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
