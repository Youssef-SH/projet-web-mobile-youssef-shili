// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accept_student_invite_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AcceptStudentInviteDto extends AcceptStudentInviteDto {
  @override
  final String token;
  @override
  final String fullName;
  @override
  final String password;

  factory _$AcceptStudentInviteDto(
          [void Function(AcceptStudentInviteDtoBuilder)? updates]) =>
      (AcceptStudentInviteDtoBuilder()..update(updates))._build();

  _$AcceptStudentInviteDto._(
      {required this.token, required this.fullName, required this.password})
      : super._();
  @override
  AcceptStudentInviteDto rebuild(
          void Function(AcceptStudentInviteDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AcceptStudentInviteDtoBuilder toBuilder() =>
      AcceptStudentInviteDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AcceptStudentInviteDto &&
        token == other.token &&
        fullName == other.fullName &&
        password == other.password;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, token.hashCode);
    _$hash = $jc(_$hash, fullName.hashCode);
    _$hash = $jc(_$hash, password.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AcceptStudentInviteDto')
          ..add('token', token)
          ..add('fullName', fullName)
          ..add('password', password))
        .toString();
  }
}

class AcceptStudentInviteDtoBuilder
    implements Builder<AcceptStudentInviteDto, AcceptStudentInviteDtoBuilder> {
  _$AcceptStudentInviteDto? _$v;

  String? _token;
  String? get token => _$this._token;
  set token(String? token) => _$this._token = token;

  String? _fullName;
  String? get fullName => _$this._fullName;
  set fullName(String? fullName) => _$this._fullName = fullName;

  String? _password;
  String? get password => _$this._password;
  set password(String? password) => _$this._password = password;

  AcceptStudentInviteDtoBuilder() {
    AcceptStudentInviteDto._defaults(this);
  }

  AcceptStudentInviteDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _token = $v.token;
      _fullName = $v.fullName;
      _password = $v.password;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AcceptStudentInviteDto other) {
    _$v = other as _$AcceptStudentInviteDto;
  }

  @override
  void update(void Function(AcceptStudentInviteDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AcceptStudentInviteDto build() => _build();

  _$AcceptStudentInviteDto _build() {
    final _$result = _$v ??
        _$AcceptStudentInviteDto._(
          token: BuiltValueNullFieldError.checkNotNull(
              token, r'AcceptStudentInviteDto', 'token'),
          fullName: BuiltValueNullFieldError.checkNotNull(
              fullName, r'AcceptStudentInviteDto', 'fullName'),
          password: BuiltValueNullFieldError.checkNotNull(
              password, r'AcceptStudentInviteDto', 'password'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
