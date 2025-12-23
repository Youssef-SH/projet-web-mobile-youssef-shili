// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'annex_view_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AnnexViewDto extends AnnexViewDto {
  @override
  final String annexTemplateId;
  @override
  final String annexUrl;
  @override
  final bool validated;

  factory _$AnnexViewDto([void Function(AnnexViewDtoBuilder)? updates]) =>
      (AnnexViewDtoBuilder()..update(updates))._build();

  _$AnnexViewDto._(
      {required this.annexTemplateId,
      required this.annexUrl,
      required this.validated})
      : super._();
  @override
  AnnexViewDto rebuild(void Function(AnnexViewDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AnnexViewDtoBuilder toBuilder() => AnnexViewDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AnnexViewDto &&
        annexTemplateId == other.annexTemplateId &&
        annexUrl == other.annexUrl &&
        validated == other.validated;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, annexTemplateId.hashCode);
    _$hash = $jc(_$hash, annexUrl.hashCode);
    _$hash = $jc(_$hash, validated.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AnnexViewDto')
          ..add('annexTemplateId', annexTemplateId)
          ..add('annexUrl', annexUrl)
          ..add('validated', validated))
        .toString();
  }
}

class AnnexViewDtoBuilder
    implements Builder<AnnexViewDto, AnnexViewDtoBuilder> {
  _$AnnexViewDto? _$v;

  String? _annexTemplateId;
  String? get annexTemplateId => _$this._annexTemplateId;
  set annexTemplateId(String? annexTemplateId) =>
      _$this._annexTemplateId = annexTemplateId;

  String? _annexUrl;
  String? get annexUrl => _$this._annexUrl;
  set annexUrl(String? annexUrl) => _$this._annexUrl = annexUrl;

  bool? _validated;
  bool? get validated => _$this._validated;
  set validated(bool? validated) => _$this._validated = validated;

  AnnexViewDtoBuilder() {
    AnnexViewDto._defaults(this);
  }

  AnnexViewDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _annexTemplateId = $v.annexTemplateId;
      _annexUrl = $v.annexUrl;
      _validated = $v.validated;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AnnexViewDto other) {
    _$v = other as _$AnnexViewDto;
  }

  @override
  void update(void Function(AnnexViewDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AnnexViewDto build() => _build();

  _$AnnexViewDto _build() {
    final _$result = _$v ??
        _$AnnexViewDto._(
          annexTemplateId: BuiltValueNullFieldError.checkNotNull(
              annexTemplateId, r'AnnexViewDto', 'annexTemplateId'),
          annexUrl: BuiltValueNullFieldError.checkNotNull(
              annexUrl, r'AnnexViewDto', 'annexUrl'),
          validated: BuiltValueNullFieldError.checkNotNull(
              validated, r'AnnexViewDto', 'validated'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
