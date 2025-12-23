// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RefreshResponseDto extends RefreshResponseDto {
  @override
  final String accessToken;
  @override
  final String refreshToken;

  factory _$RefreshResponseDto(
          [void Function(RefreshResponseDtoBuilder)? updates]) =>
      (RefreshResponseDtoBuilder()..update(updates))._build();

  _$RefreshResponseDto._(
      {required this.accessToken, required this.refreshToken})
      : super._();
  @override
  RefreshResponseDto rebuild(
          void Function(RefreshResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RefreshResponseDtoBuilder toBuilder() =>
      RefreshResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RefreshResponseDto &&
        accessToken == other.accessToken &&
        refreshToken == other.refreshToken;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, accessToken.hashCode);
    _$hash = $jc(_$hash, refreshToken.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RefreshResponseDto')
          ..add('accessToken', accessToken)
          ..add('refreshToken', refreshToken))
        .toString();
  }
}

class RefreshResponseDtoBuilder
    implements Builder<RefreshResponseDto, RefreshResponseDtoBuilder> {
  _$RefreshResponseDto? _$v;

  String? _accessToken;
  String? get accessToken => _$this._accessToken;
  set accessToken(String? accessToken) => _$this._accessToken = accessToken;

  String? _refreshToken;
  String? get refreshToken => _$this._refreshToken;
  set refreshToken(String? refreshToken) => _$this._refreshToken = refreshToken;

  RefreshResponseDtoBuilder() {
    RefreshResponseDto._defaults(this);
  }

  RefreshResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _accessToken = $v.accessToken;
      _refreshToken = $v.refreshToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RefreshResponseDto other) {
    _$v = other as _$RefreshResponseDto;
  }

  @override
  void update(void Function(RefreshResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RefreshResponseDto build() => _build();

  _$RefreshResponseDto _build() {
    final _$result = _$v ??
        _$RefreshResponseDto._(
          accessToken: BuiltValueNullFieldError.checkNotNull(
              accessToken, r'RefreshResponseDto', 'accessToken'),
          refreshToken: BuiltValueNullFieldError.checkNotNull(
              refreshToken, r'RefreshResponseDto', 'refreshToken'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
