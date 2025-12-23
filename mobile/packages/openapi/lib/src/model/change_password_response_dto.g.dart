// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ChangePasswordResponseDto extends ChangePasswordResponseDto {
  @override
  final bool ok;
  @override
  final String message;

  factory _$ChangePasswordResponseDto(
          [void Function(ChangePasswordResponseDtoBuilder)? updates]) =>
      (ChangePasswordResponseDtoBuilder()..update(updates))._build();

  _$ChangePasswordResponseDto._({required this.ok, required this.message})
      : super._();
  @override
  ChangePasswordResponseDto rebuild(
          void Function(ChangePasswordResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChangePasswordResponseDtoBuilder toBuilder() =>
      ChangePasswordResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChangePasswordResponseDto &&
        ok == other.ok &&
        message == other.message;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, ok.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChangePasswordResponseDto')
          ..add('ok', ok)
          ..add('message', message))
        .toString();
  }
}

class ChangePasswordResponseDtoBuilder
    implements
        Builder<ChangePasswordResponseDto, ChangePasswordResponseDtoBuilder> {
  _$ChangePasswordResponseDto? _$v;

  bool? _ok;
  bool? get ok => _$this._ok;
  set ok(bool? ok) => _$this._ok = ok;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  ChangePasswordResponseDtoBuilder() {
    ChangePasswordResponseDto._defaults(this);
  }

  ChangePasswordResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ok = $v.ok;
      _message = $v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChangePasswordResponseDto other) {
    _$v = other as _$ChangePasswordResponseDto;
  }

  @override
  void update(void Function(ChangePasswordResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChangePasswordResponseDto build() => _build();

  _$ChangePasswordResponseDto _build() {
    final _$result = _$v ??
        _$ChangePasswordResponseDto._(
          ok: BuiltValueNullFieldError.checkNotNull(
              ok, r'ChangePasswordResponseDto', 'ok'),
          message: BuiltValueNullFieldError.checkNotNull(
              message, r'ChangePasswordResponseDto', 'message'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
