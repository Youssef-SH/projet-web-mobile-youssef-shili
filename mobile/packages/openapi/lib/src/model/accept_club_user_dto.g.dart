// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accept_club_user_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const AcceptClubUserDtoRoleEnum _$acceptClubUserDtoRoleEnum_student =
    const AcceptClubUserDtoRoleEnum._('student');
const AcceptClubUserDtoRoleEnum _$acceptClubUserDtoRoleEnum_club =
    const AcceptClubUserDtoRoleEnum._('club');
const AcceptClubUserDtoRoleEnum _$acceptClubUserDtoRoleEnum_admin =
    const AcceptClubUserDtoRoleEnum._('admin');

AcceptClubUserDtoRoleEnum _$acceptClubUserDtoRoleEnumValueOf(String name) {
  switch (name) {
    case 'student':
      return _$acceptClubUserDtoRoleEnum_student;
    case 'club':
      return _$acceptClubUserDtoRoleEnum_club;
    case 'admin':
      return _$acceptClubUserDtoRoleEnum_admin;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<AcceptClubUserDtoRoleEnum> _$acceptClubUserDtoRoleEnumValues =
    BuiltSet<AcceptClubUserDtoRoleEnum>(const <AcceptClubUserDtoRoleEnum>[
  _$acceptClubUserDtoRoleEnum_student,
  _$acceptClubUserDtoRoleEnum_club,
  _$acceptClubUserDtoRoleEnum_admin,
]);

Serializer<AcceptClubUserDtoRoleEnum> _$acceptClubUserDtoRoleEnumSerializer =
    _$AcceptClubUserDtoRoleEnumSerializer();

class _$AcceptClubUserDtoRoleEnumSerializer
    implements PrimitiveSerializer<AcceptClubUserDtoRoleEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'student': 'Student',
    'club': 'Club',
    'admin': 'Admin',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'Student': 'student',
    'Club': 'club',
    'Admin': 'admin',
  };

  @override
  final Iterable<Type> types = const <Type>[AcceptClubUserDtoRoleEnum];
  @override
  final String wireName = 'AcceptClubUserDtoRoleEnum';

  @override
  Object serialize(Serializers serializers, AcceptClubUserDtoRoleEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  AcceptClubUserDtoRoleEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      AcceptClubUserDtoRoleEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$AcceptClubUserDto extends AcceptClubUserDto {
  @override
  final String id;
  @override
  final String email;
  @override
  final AcceptClubUserDtoRoleEnum role;
  @override
  final JsonObject? fullName;
  @override
  final String clubId;

  factory _$AcceptClubUserDto(
          [void Function(AcceptClubUserDtoBuilder)? updates]) =>
      (AcceptClubUserDtoBuilder()..update(updates))._build();

  _$AcceptClubUserDto._(
      {required this.id,
      required this.email,
      required this.role,
      this.fullName,
      required this.clubId})
      : super._();
  @override
  AcceptClubUserDto rebuild(void Function(AcceptClubUserDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AcceptClubUserDtoBuilder toBuilder() =>
      AcceptClubUserDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AcceptClubUserDto &&
        id == other.id &&
        email == other.email &&
        role == other.role &&
        fullName == other.fullName &&
        clubId == other.clubId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, role.hashCode);
    _$hash = $jc(_$hash, fullName.hashCode);
    _$hash = $jc(_$hash, clubId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AcceptClubUserDto')
          ..add('id', id)
          ..add('email', email)
          ..add('role', role)
          ..add('fullName', fullName)
          ..add('clubId', clubId))
        .toString();
  }
}

class AcceptClubUserDtoBuilder
    implements Builder<AcceptClubUserDto, AcceptClubUserDtoBuilder> {
  _$AcceptClubUserDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  AcceptClubUserDtoRoleEnum? _role;
  AcceptClubUserDtoRoleEnum? get role => _$this._role;
  set role(AcceptClubUserDtoRoleEnum? role) => _$this._role = role;

  JsonObject? _fullName;
  JsonObject? get fullName => _$this._fullName;
  set fullName(JsonObject? fullName) => _$this._fullName = fullName;

  String? _clubId;
  String? get clubId => _$this._clubId;
  set clubId(String? clubId) => _$this._clubId = clubId;

  AcceptClubUserDtoBuilder() {
    AcceptClubUserDto._defaults(this);
  }

  AcceptClubUserDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _email = $v.email;
      _role = $v.role;
      _fullName = $v.fullName;
      _clubId = $v.clubId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AcceptClubUserDto other) {
    _$v = other as _$AcceptClubUserDto;
  }

  @override
  void update(void Function(AcceptClubUserDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AcceptClubUserDto build() => _build();

  _$AcceptClubUserDto _build() {
    final _$result = _$v ??
        _$AcceptClubUserDto._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'AcceptClubUserDto', 'id'),
          email: BuiltValueNullFieldError.checkNotNull(
              email, r'AcceptClubUserDto', 'email'),
          role: BuiltValueNullFieldError.checkNotNull(
              role, r'AcceptClubUserDto', 'role'),
          fullName: fullName,
          clubId: BuiltValueNullFieldError.checkNotNull(
              clubId, r'AcceptClubUserDto', 'clubId'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
