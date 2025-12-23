// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accept_student_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AcceptStudentResponseDto extends AcceptStudentResponseDto {
  @override
  final String accessToken;
  @override
  final String refreshToken;
  @override
  final AcceptStudentUserDto user;

  factory _$AcceptStudentResponseDto(
          [void Function(AcceptStudentResponseDtoBuilder)? updates]) =>
      (AcceptStudentResponseDtoBuilder()..update(updates))._build();

  _$AcceptStudentResponseDto._(
      {required this.accessToken,
      required this.refreshToken,
      required this.user})
      : super._();
  @override
  AcceptStudentResponseDto rebuild(
          void Function(AcceptStudentResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AcceptStudentResponseDtoBuilder toBuilder() =>
      AcceptStudentResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AcceptStudentResponseDto &&
        accessToken == other.accessToken &&
        refreshToken == other.refreshToken &&
        user == other.user;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, accessToken.hashCode);
    _$hash = $jc(_$hash, refreshToken.hashCode);
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AcceptStudentResponseDto')
          ..add('accessToken', accessToken)
          ..add('refreshToken', refreshToken)
          ..add('user', user))
        .toString();
  }
}

class AcceptStudentResponseDtoBuilder
    implements
        Builder<AcceptStudentResponseDto, AcceptStudentResponseDtoBuilder> {
  _$AcceptStudentResponseDto? _$v;

  String? _accessToken;
  String? get accessToken => _$this._accessToken;
  set accessToken(String? accessToken) => _$this._accessToken = accessToken;

  String? _refreshToken;
  String? get refreshToken => _$this._refreshToken;
  set refreshToken(String? refreshToken) => _$this._refreshToken = refreshToken;

  AcceptStudentUserDtoBuilder? _user;
  AcceptStudentUserDtoBuilder get user =>
      _$this._user ??= AcceptStudentUserDtoBuilder();
  set user(AcceptStudentUserDtoBuilder? user) => _$this._user = user;

  AcceptStudentResponseDtoBuilder() {
    AcceptStudentResponseDto._defaults(this);
  }

  AcceptStudentResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _accessToken = $v.accessToken;
      _refreshToken = $v.refreshToken;
      _user = $v.user.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AcceptStudentResponseDto other) {
    _$v = other as _$AcceptStudentResponseDto;
  }

  @override
  void update(void Function(AcceptStudentResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AcceptStudentResponseDto build() => _build();

  _$AcceptStudentResponseDto _build() {
    _$AcceptStudentResponseDto _$result;
    try {
      _$result = _$v ??
          _$AcceptStudentResponseDto._(
            accessToken: BuiltValueNullFieldError.checkNotNull(
                accessToken, r'AcceptStudentResponseDto', 'accessToken'),
            refreshToken: BuiltValueNullFieldError.checkNotNull(
                refreshToken, r'AcceptStudentResponseDto', 'refreshToken'),
            user: user.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        user.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AcceptStudentResponseDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
