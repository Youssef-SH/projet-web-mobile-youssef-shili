// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invites_preview_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$InvitesPreviewResponseDto extends InvitesPreviewResponseDto {
  @override
  final InvitePreviewSummaryDto summary;
  @override
  final BuiltList<InvalidRowDto> invalidRows;

  factory _$InvitesPreviewResponseDto(
          [void Function(InvitesPreviewResponseDtoBuilder)? updates]) =>
      (InvitesPreviewResponseDtoBuilder()..update(updates))._build();

  _$InvitesPreviewResponseDto._(
      {required this.summary, required this.invalidRows})
      : super._();
  @override
  InvitesPreviewResponseDto rebuild(
          void Function(InvitesPreviewResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InvitesPreviewResponseDtoBuilder toBuilder() =>
      InvitesPreviewResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InvitesPreviewResponseDto &&
        summary == other.summary &&
        invalidRows == other.invalidRows;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, summary.hashCode);
    _$hash = $jc(_$hash, invalidRows.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'InvitesPreviewResponseDto')
          ..add('summary', summary)
          ..add('invalidRows', invalidRows))
        .toString();
  }
}

class InvitesPreviewResponseDtoBuilder
    implements
        Builder<InvitesPreviewResponseDto, InvitesPreviewResponseDtoBuilder> {
  _$InvitesPreviewResponseDto? _$v;

  InvitePreviewSummaryDtoBuilder? _summary;
  InvitePreviewSummaryDtoBuilder get summary =>
      _$this._summary ??= InvitePreviewSummaryDtoBuilder();
  set summary(InvitePreviewSummaryDtoBuilder? summary) =>
      _$this._summary = summary;

  ListBuilder<InvalidRowDto>? _invalidRows;
  ListBuilder<InvalidRowDto> get invalidRows =>
      _$this._invalidRows ??= ListBuilder<InvalidRowDto>();
  set invalidRows(ListBuilder<InvalidRowDto>? invalidRows) =>
      _$this._invalidRows = invalidRows;

  InvitesPreviewResponseDtoBuilder() {
    InvitesPreviewResponseDto._defaults(this);
  }

  InvitesPreviewResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _summary = $v.summary.toBuilder();
      _invalidRows = $v.invalidRows.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InvitesPreviewResponseDto other) {
    _$v = other as _$InvitesPreviewResponseDto;
  }

  @override
  void update(void Function(InvitesPreviewResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  InvitesPreviewResponseDto build() => _build();

  _$InvitesPreviewResponseDto _build() {
    _$InvitesPreviewResponseDto _$result;
    try {
      _$result = _$v ??
          _$InvitesPreviewResponseDto._(
            summary: summary.build(),
            invalidRows: invalidRows.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'summary';
        summary.build();
        _$failedField = 'invalidRows';
        invalidRows.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'InvitesPreviewResponseDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
