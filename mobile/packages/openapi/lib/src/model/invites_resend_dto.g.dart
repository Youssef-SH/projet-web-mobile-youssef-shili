// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invites_resend_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$InvitesResendDto extends InvitesResendDto {
  @override
  final BuiltList<String> emails;

  factory _$InvitesResendDto(
          [void Function(InvitesResendDtoBuilder)? updates]) =>
      (InvitesResendDtoBuilder()..update(updates))._build();

  _$InvitesResendDto._({required this.emails}) : super._();
  @override
  InvitesResendDto rebuild(void Function(InvitesResendDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InvitesResendDtoBuilder toBuilder() =>
      InvitesResendDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InvitesResendDto && emails == other.emails;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, emails.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'InvitesResendDto')
          ..add('emails', emails))
        .toString();
  }
}

class InvitesResendDtoBuilder
    implements Builder<InvitesResendDto, InvitesResendDtoBuilder> {
  _$InvitesResendDto? _$v;

  ListBuilder<String>? _emails;
  ListBuilder<String> get emails => _$this._emails ??= ListBuilder<String>();
  set emails(ListBuilder<String>? emails) => _$this._emails = emails;

  InvitesResendDtoBuilder() {
    InvitesResendDto._defaults(this);
  }

  InvitesResendDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _emails = $v.emails.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InvitesResendDto other) {
    _$v = other as _$InvitesResendDto;
  }

  @override
  void update(void Function(InvitesResendDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  InvitesResendDto build() => _build();

  _$InvitesResendDto _build() {
    _$InvitesResendDto _$result;
    try {
      _$result = _$v ??
          _$InvitesResendDto._(
            emails: emails.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'emails';
        emails.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'InvitesResendDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
