// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accept_club_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AcceptClubResponseDto extends AcceptClubResponseDto {
  @override
  final String accessToken;
  @override
  final String refreshToken;
  @override
  final AcceptClubUserDto user;

  factory _$AcceptClubResponseDto(
          [void Function(AcceptClubResponseDtoBuilder)? updates]) =>
      (AcceptClubResponseDtoBuilder()..update(updates))._build();

  _$AcceptClubResponseDto._(
      {required this.accessToken,
      required this.refreshToken,
      required this.user})
      : super._();
  @override
  AcceptClubResponseDto rebuild(
          void Function(AcceptClubResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AcceptClubResponseDtoBuilder toBuilder() =>
      AcceptClubResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AcceptClubResponseDto &&
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
    return (newBuiltValueToStringHelper(r'AcceptClubResponseDto')
          ..add('accessToken', accessToken)
          ..add('refreshToken', refreshToken)
          ..add('user', user))
        .toString();
  }
}

class AcceptClubResponseDtoBuilder
    implements Builder<AcceptClubResponseDto, AcceptClubResponseDtoBuilder> {
  _$AcceptClubResponseDto? _$v;

  String? _accessToken;
  String? get accessToken => _$this._accessToken;
  set accessToken(String? accessToken) => _$this._accessToken = accessToken;

  String? _refreshToken;
  String? get refreshToken => _$this._refreshToken;
  set refreshToken(String? refreshToken) => _$this._refreshToken = refreshToken;

  AcceptClubUserDtoBuilder? _user;
  AcceptClubUserDtoBuilder get user =>
      _$this._user ??= AcceptClubUserDtoBuilder();
  set user(AcceptClubUserDtoBuilder? user) => _$this._user = user;

  AcceptClubResponseDtoBuilder() {
    AcceptClubResponseDto._defaults(this);
  }

  AcceptClubResponseDtoBuilder get _$this {
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
  void replace(AcceptClubResponseDto other) {
    _$v = other as _$AcceptClubResponseDto;
  }

  @override
  void update(void Function(AcceptClubResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AcceptClubResponseDto build() => _build();

  _$AcceptClubResponseDto _build() {
    _$AcceptClubResponseDto _$result;
    try {
      _$result = _$v ??
          _$AcceptClubResponseDto._(
            accessToken: BuiltValueNullFieldError.checkNotNull(
                accessToken, r'AcceptClubResponseDto', 'accessToken'),
            refreshToken: BuiltValueNullFieldError.checkNotNull(
                refreshToken, r'AcceptClubResponseDto', 'refreshToken'),
            user: user.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        user.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AcceptClubResponseDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
