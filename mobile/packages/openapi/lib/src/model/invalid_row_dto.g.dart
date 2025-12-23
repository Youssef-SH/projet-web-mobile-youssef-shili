// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invalid_row_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$InvalidRowDto extends InvalidRowDto {
  @override
  final num row;
  @override
  final String email;
  @override
  final String reason;

  factory _$InvalidRowDto([void Function(InvalidRowDtoBuilder)? updates]) =>
      (InvalidRowDtoBuilder()..update(updates))._build();

  _$InvalidRowDto._(
      {required this.row, required this.email, required this.reason})
      : super._();
  @override
  InvalidRowDto rebuild(void Function(InvalidRowDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InvalidRowDtoBuilder toBuilder() => InvalidRowDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InvalidRowDto &&
        row == other.row &&
        email == other.email &&
        reason == other.reason;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, row.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, reason.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'InvalidRowDto')
          ..add('row', row)
          ..add('email', email)
          ..add('reason', reason))
        .toString();
  }
}

class InvalidRowDtoBuilder
    implements Builder<InvalidRowDto, InvalidRowDtoBuilder> {
  _$InvalidRowDto? _$v;

  num? _row;
  num? get row => _$this._row;
  set row(num? row) => _$this._row = row;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _reason;
  String? get reason => _$this._reason;
  set reason(String? reason) => _$this._reason = reason;

  InvalidRowDtoBuilder() {
    InvalidRowDto._defaults(this);
  }

  InvalidRowDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _row = $v.row;
      _email = $v.email;
      _reason = $v.reason;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InvalidRowDto other) {
    _$v = other as _$InvalidRowDto;
  }

  @override
  void update(void Function(InvalidRowDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  InvalidRowDto build() => _build();

  _$InvalidRowDto _build() {
    final _$result = _$v ??
        _$InvalidRowDto._(
          row: BuiltValueNullFieldError.checkNotNull(
              row, r'InvalidRowDto', 'row'),
          email: BuiltValueNullFieldError.checkNotNull(
              email, r'InvalidRowDto', 'email'),
          reason: BuiltValueNullFieldError.checkNotNull(
              reason, r'InvalidRowDto', 'reason'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
