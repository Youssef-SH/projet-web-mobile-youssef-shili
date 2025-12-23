// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accept_student_user_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const AcceptStudentUserDtoRoleEnum _$acceptStudentUserDtoRoleEnum_student =
    const AcceptStudentUserDtoRoleEnum._('student');
const AcceptStudentUserDtoRoleEnum _$acceptStudentUserDtoRoleEnum_club =
    const AcceptStudentUserDtoRoleEnum._('club');
const AcceptStudentUserDtoRoleEnum _$acceptStudentUserDtoRoleEnum_admin =
    const AcceptStudentUserDtoRoleEnum._('admin');

AcceptStudentUserDtoRoleEnum _$acceptStudentUserDtoRoleEnumValueOf(
    String name) {
  switch (name) {
    case 'student':
      return _$acceptStudentUserDtoRoleEnum_student;
    case 'club':
      return _$acceptStudentUserDtoRoleEnum_club;
    case 'admin':
      return _$acceptStudentUserDtoRoleEnum_admin;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<AcceptStudentUserDtoRoleEnum>
    _$acceptStudentUserDtoRoleEnumValues =
    BuiltSet<AcceptStudentUserDtoRoleEnum>(const <AcceptStudentUserDtoRoleEnum>[
  _$acceptStudentUserDtoRoleEnum_student,
  _$acceptStudentUserDtoRoleEnum_club,
  _$acceptStudentUserDtoRoleEnum_admin,
]);

Serializer<AcceptStudentUserDtoRoleEnum>
    _$acceptStudentUserDtoRoleEnumSerializer =
    _$AcceptStudentUserDtoRoleEnumSerializer();

class _$AcceptStudentUserDtoRoleEnumSerializer
    implements PrimitiveSerializer<AcceptStudentUserDtoRoleEnum> {
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
  final Iterable<Type> types = const <Type>[AcceptStudentUserDtoRoleEnum];
  @override
  final String wireName = 'AcceptStudentUserDtoRoleEnum';

  @override
  Object serialize(Serializers serializers, AcceptStudentUserDtoRoleEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  AcceptStudentUserDtoRoleEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      AcceptStudentUserDtoRoleEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$AcceptStudentUserDto extends AcceptStudentUserDto {
  @override
  final String id;
  @override
  final String email;
  @override
  final AcceptStudentUserDtoRoleEnum role;
  @override
  final JsonObject? fullName;

  factory _$AcceptStudentUserDto(
          [void Function(AcceptStudentUserDtoBuilder)? updates]) =>
      (AcceptStudentUserDtoBuilder()..update(updates))._build();

  _$AcceptStudentUserDto._(
      {required this.id,
      required this.email,
      required this.role,
      this.fullName})
      : super._();
  @override
  AcceptStudentUserDto rebuild(
          void Function(AcceptStudentUserDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AcceptStudentUserDtoBuilder toBuilder() =>
      AcceptStudentUserDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AcceptStudentUserDto &&
        id == other.id &&
        email == other.email &&
        role == other.role &&
        fullName == other.fullName;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, role.hashCode);
    _$hash = $jc(_$hash, fullName.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AcceptStudentUserDto')
          ..add('id', id)
          ..add('email', email)
          ..add('role', role)
          ..add('fullName', fullName))
        .toString();
  }
}

class AcceptStudentUserDtoBuilder
    implements Builder<AcceptStudentUserDto, AcceptStudentUserDtoBuilder> {
  _$AcceptStudentUserDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  AcceptStudentUserDtoRoleEnum? _role;
  AcceptStudentUserDtoRoleEnum? get role => _$this._role;
  set role(AcceptStudentUserDtoRoleEnum? role) => _$this._role = role;

  JsonObject? _fullName;
  JsonObject? get fullName => _$this._fullName;
  set fullName(JsonObject? fullName) => _$this._fullName = fullName;

  AcceptStudentUserDtoBuilder() {
    AcceptStudentUserDto._defaults(this);
  }

  AcceptStudentUserDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _email = $v.email;
      _role = $v.role;
      _fullName = $v.fullName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AcceptStudentUserDto other) {
    _$v = other as _$AcceptStudentUserDto;
  }

  @override
  void update(void Function(AcceptStudentUserDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AcceptStudentUserDto build() => _build();

  _$AcceptStudentUserDto _build() {
    final _$result = _$v ??
        _$AcceptStudentUserDto._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'AcceptStudentUserDto', 'id'),
          email: BuiltValueNullFieldError.checkNotNull(
              email, r'AcceptStudentUserDto', 'email'),
          role: BuiltValueNullFieldError.checkNotNull(
              role, r'AcceptStudentUserDto', 'role'),
          fullName: fullName,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
