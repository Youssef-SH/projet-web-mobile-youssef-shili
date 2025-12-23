// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invites_resend_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$InvitesResendResponseDto extends InvitesResendResponseDto {
  @override
  final num accepted;
  @override
  final num failed;

  factory _$InvitesResendResponseDto(
          [void Function(InvitesResendResponseDtoBuilder)? updates]) =>
      (InvitesResendResponseDtoBuilder()..update(updates))._build();

  _$InvitesResendResponseDto._({required this.accepted, required this.failed})
      : super._();
  @override
  InvitesResendResponseDto rebuild(
          void Function(InvitesResendResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InvitesResendResponseDtoBuilder toBuilder() =>
      InvitesResendResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InvitesResendResponseDto &&
        accepted == other.accepted &&
        failed == other.failed;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, accepted.hashCode);
    _$hash = $jc(_$hash, failed.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'InvitesResendResponseDto')
          ..add('accepted', accepted)
          ..add('failed', failed))
        .toString();
  }
}

class InvitesResendResponseDtoBuilder
    implements
        Builder<InvitesResendResponseDto, InvitesResendResponseDtoBuilder> {
  _$InvitesResendResponseDto? _$v;

  num? _accepted;
  num? get accepted => _$this._accepted;
  set accepted(num? accepted) => _$this._accepted = accepted;

  num? _failed;
  num? get failed => _$this._failed;
  set failed(num? failed) => _$this._failed = failed;

  InvitesResendResponseDtoBuilder() {
    InvitesResendResponseDto._defaults(this);
  }

  InvitesResendResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _accepted = $v.accepted;
      _failed = $v.failed;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InvitesResendResponseDto other) {
    _$v = other as _$InvitesResendResponseDto;
  }

  @override
  void update(void Function(InvitesResendResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  InvitesResendResponseDto build() => _build();

  _$InvitesResendResponseDto _build() {
    final _$result = _$v ??
        _$InvitesResendResponseDto._(
          accepted: BuiltValueNullFieldError.checkNotNull(
              accepted, r'InvitesResendResponseDto', 'accepted'),
          failed: BuiltValueNullFieldError.checkNotNull(
              failed, r'InvitesResendResponseDto', 'failed'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
