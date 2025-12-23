// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'me_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const MeResponseDtoRoleEnum _$meResponseDtoRoleEnum_student =
    const MeResponseDtoRoleEnum._('student');
const MeResponseDtoRoleEnum _$meResponseDtoRoleEnum_club =
    const MeResponseDtoRoleEnum._('club');
const MeResponseDtoRoleEnum _$meResponseDtoRoleEnum_admin =
    const MeResponseDtoRoleEnum._('admin');

MeResponseDtoRoleEnum _$meResponseDtoRoleEnumValueOf(String name) {
  switch (name) {
    case 'student':
      return _$meResponseDtoRoleEnum_student;
    case 'club':
      return _$meResponseDtoRoleEnum_club;
    case 'admin':
      return _$meResponseDtoRoleEnum_admin;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<MeResponseDtoRoleEnum> _$meResponseDtoRoleEnumValues =
    BuiltSet<MeResponseDtoRoleEnum>(const <MeResponseDtoRoleEnum>[
  _$meResponseDtoRoleEnum_student,
  _$meResponseDtoRoleEnum_club,
  _$meResponseDtoRoleEnum_admin,
]);

Serializer<MeResponseDtoRoleEnum> _$meResponseDtoRoleEnumSerializer =
    _$MeResponseDtoRoleEnumSerializer();

class _$MeResponseDtoRoleEnumSerializer
    implements PrimitiveSerializer<MeResponseDtoRoleEnum> {
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
  final Iterable<Type> types = const <Type>[MeResponseDtoRoleEnum];
  @override
  final String wireName = 'MeResponseDtoRoleEnum';

  @override
  Object serialize(Serializers serializers, MeResponseDtoRoleEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  MeResponseDtoRoleEnum deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      MeResponseDtoRoleEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$MeResponseDto extends MeResponseDto {
  @override
  final String id;
  @override
  final String email;
  @override
  final MeResponseDtoRoleEnum role;
  @override
  final JsonObject? fullName;
  @override
  final JsonObject? clubId;

  factory _$MeResponseDto([void Function(MeResponseDtoBuilder)? updates]) =>
      (MeResponseDtoBuilder()..update(updates))._build();

  _$MeResponseDto._(
      {required this.id,
      required this.email,
      required this.role,
      this.fullName,
      this.clubId})
      : super._();
  @override
  MeResponseDto rebuild(void Function(MeResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MeResponseDtoBuilder toBuilder() => MeResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MeResponseDto &&
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
    return (newBuiltValueToStringHelper(r'MeResponseDto')
          ..add('id', id)
          ..add('email', email)
          ..add('role', role)
          ..add('fullName', fullName)
          ..add('clubId', clubId))
        .toString();
  }
}

class MeResponseDtoBuilder
    implements Builder<MeResponseDto, MeResponseDtoBuilder> {
  _$MeResponseDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  MeResponseDtoRoleEnum? _role;
  MeResponseDtoRoleEnum? get role => _$this._role;
  set role(MeResponseDtoRoleEnum? role) => _$this._role = role;

  JsonObject? _fullName;
  JsonObject? get fullName => _$this._fullName;
  set fullName(JsonObject? fullName) => _$this._fullName = fullName;

  JsonObject? _clubId;
  JsonObject? get clubId => _$this._clubId;
  set clubId(JsonObject? clubId) => _$this._clubId = clubId;

  MeResponseDtoBuilder() {
    MeResponseDto._defaults(this);
  }

  MeResponseDtoBuilder get _$this {
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
  void replace(MeResponseDto other) {
    _$v = other as _$MeResponseDto;
  }

  @override
  void update(void Function(MeResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MeResponseDto build() => _build();

  _$MeResponseDto _build() {
    final _$result = _$v ??
        _$MeResponseDto._(
          id: BuiltValueNullFieldError.checkNotNull(id, r'MeResponseDto', 'id'),
          email: BuiltValueNullFieldError.checkNotNull(
              email, r'MeResponseDto', 'email'),
          role: BuiltValueNullFieldError.checkNotNull(
              role, r'MeResponseDto', 'role'),
          fullName: fullName,
          clubId: clubId,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
