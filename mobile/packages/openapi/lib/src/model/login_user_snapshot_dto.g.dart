// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_user_snapshot_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const LoginUserSnapshotDtoRoleEnum _$loginUserSnapshotDtoRoleEnum_student =
    const LoginUserSnapshotDtoRoleEnum._('student');
const LoginUserSnapshotDtoRoleEnum _$loginUserSnapshotDtoRoleEnum_club =
    const LoginUserSnapshotDtoRoleEnum._('club');
const LoginUserSnapshotDtoRoleEnum _$loginUserSnapshotDtoRoleEnum_admin =
    const LoginUserSnapshotDtoRoleEnum._('admin');

LoginUserSnapshotDtoRoleEnum _$loginUserSnapshotDtoRoleEnumValueOf(
    String name) {
  switch (name) {
    case 'student':
      return _$loginUserSnapshotDtoRoleEnum_student;
    case 'club':
      return _$loginUserSnapshotDtoRoleEnum_club;
    case 'admin':
      return _$loginUserSnapshotDtoRoleEnum_admin;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<LoginUserSnapshotDtoRoleEnum>
    _$loginUserSnapshotDtoRoleEnumValues =
    BuiltSet<LoginUserSnapshotDtoRoleEnum>(const <LoginUserSnapshotDtoRoleEnum>[
  _$loginUserSnapshotDtoRoleEnum_student,
  _$loginUserSnapshotDtoRoleEnum_club,
  _$loginUserSnapshotDtoRoleEnum_admin,
]);

Serializer<LoginUserSnapshotDtoRoleEnum>
    _$loginUserSnapshotDtoRoleEnumSerializer =
    _$LoginUserSnapshotDtoRoleEnumSerializer();

class _$LoginUserSnapshotDtoRoleEnumSerializer
    implements PrimitiveSerializer<LoginUserSnapshotDtoRoleEnum> {
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
  final Iterable<Type> types = const <Type>[LoginUserSnapshotDtoRoleEnum];
  @override
  final String wireName = 'LoginUserSnapshotDtoRoleEnum';

  @override
  Object serialize(Serializers serializers, LoginUserSnapshotDtoRoleEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  LoginUserSnapshotDtoRoleEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      LoginUserSnapshotDtoRoleEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$LoginUserSnapshotDto extends LoginUserSnapshotDto {
  @override
  final String id;
  @override
  final String email;
  @override
  final LoginUserSnapshotDtoRoleEnum role;
  @override
  final JsonObject? fullName;
  @override
  final JsonObject? clubId;

  factory _$LoginUserSnapshotDto(
          [void Function(LoginUserSnapshotDtoBuilder)? updates]) =>
      (LoginUserSnapshotDtoBuilder()..update(updates))._build();

  _$LoginUserSnapshotDto._(
      {required this.id,
      required this.email,
      required this.role,
      this.fullName,
      this.clubId})
      : super._();
  @override
  LoginUserSnapshotDto rebuild(
          void Function(LoginUserSnapshotDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LoginUserSnapshotDtoBuilder toBuilder() =>
      LoginUserSnapshotDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoginUserSnapshotDto &&
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
    return (newBuiltValueToStringHelper(r'LoginUserSnapshotDto')
          ..add('id', id)
          ..add('email', email)
          ..add('role', role)
          ..add('fullName', fullName)
          ..add('clubId', clubId))
        .toString();
  }
}

class LoginUserSnapshotDtoBuilder
    implements Builder<LoginUserSnapshotDto, LoginUserSnapshotDtoBuilder> {
  _$LoginUserSnapshotDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  LoginUserSnapshotDtoRoleEnum? _role;
  LoginUserSnapshotDtoRoleEnum? get role => _$this._role;
  set role(LoginUserSnapshotDtoRoleEnum? role) => _$this._role = role;

  JsonObject? _fullName;
  JsonObject? get fullName => _$this._fullName;
  set fullName(JsonObject? fullName) => _$this._fullName = fullName;

  JsonObject? _clubId;
  JsonObject? get clubId => _$this._clubId;
  set clubId(JsonObject? clubId) => _$this._clubId = clubId;

  LoginUserSnapshotDtoBuilder() {
    LoginUserSnapshotDto._defaults(this);
  }

  LoginUserSnapshotDtoBuilder get _$this {
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
  void replace(LoginUserSnapshotDto other) {
    _$v = other as _$LoginUserSnapshotDto;
  }

  @override
  void update(void Function(LoginUserSnapshotDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LoginUserSnapshotDto build() => _build();

  _$LoginUserSnapshotDto _build() {
    final _$result = _$v ??
        _$LoginUserSnapshotDto._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'LoginUserSnapshotDto', 'id'),
          email: BuiltValueNullFieldError.checkNotNull(
              email, r'LoginUserSnapshotDto', 'email'),
          role: BuiltValueNullFieldError.checkNotNull(
              role, r'LoginUserSnapshotDto', 'role'),
          fullName: fullName,
          clubId: clubId,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
