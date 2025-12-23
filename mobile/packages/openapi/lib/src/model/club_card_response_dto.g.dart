// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'club_card_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ClubCardResponseDto extends ClubCardResponseDto {
  @override
  final String id;
  @override
  final String name;
  @override
  final String logoUrl;

  factory _$ClubCardResponseDto(
          [void Function(ClubCardResponseDtoBuilder)? updates]) =>
      (ClubCardResponseDtoBuilder()..update(updates))._build();

  _$ClubCardResponseDto._(
      {required this.id, required this.name, required this.logoUrl})
      : super._();
  @override
  ClubCardResponseDto rebuild(
          void Function(ClubCardResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClubCardResponseDtoBuilder toBuilder() =>
      ClubCardResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClubCardResponseDto &&
        id == other.id &&
        name == other.name &&
        logoUrl == other.logoUrl;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, logoUrl.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ClubCardResponseDto')
          ..add('id', id)
          ..add('name', name)
          ..add('logoUrl', logoUrl))
        .toString();
  }
}

class ClubCardResponseDtoBuilder
    implements Builder<ClubCardResponseDto, ClubCardResponseDtoBuilder> {
  _$ClubCardResponseDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _logoUrl;
  String? get logoUrl => _$this._logoUrl;
  set logoUrl(String? logoUrl) => _$this._logoUrl = logoUrl;

  ClubCardResponseDtoBuilder() {
    ClubCardResponseDto._defaults(this);
  }

  ClubCardResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _logoUrl = $v.logoUrl;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ClubCardResponseDto other) {
    _$v = other as _$ClubCardResponseDto;
  }

  @override
  void update(void Function(ClubCardResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClubCardResponseDto build() => _build();

  _$ClubCardResponseDto _build() {
    final _$result = _$v ??
        _$ClubCardResponseDto._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'ClubCardResponseDto', 'id'),
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'ClubCardResponseDto', 'name'),
          logoUrl: BuiltValueNullFieldError.checkNotNull(
              logoUrl, r'ClubCardResponseDto', 'logoUrl'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
