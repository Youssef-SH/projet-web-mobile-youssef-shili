// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_club_profile_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateClubProfileResponseDto extends UpdateClubProfileResponseDto {
  @override
  final JsonObject? description;
  @override
  final JsonObject? logoUrl;

  factory _$UpdateClubProfileResponseDto(
          [void Function(UpdateClubProfileResponseDtoBuilder)? updates]) =>
      (UpdateClubProfileResponseDtoBuilder()..update(updates))._build();

  _$UpdateClubProfileResponseDto._({this.description, this.logoUrl})
      : super._();
  @override
  UpdateClubProfileResponseDto rebuild(
          void Function(UpdateClubProfileResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateClubProfileResponseDtoBuilder toBuilder() =>
      UpdateClubProfileResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateClubProfileResponseDto &&
        description == other.description &&
        logoUrl == other.logoUrl;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, logoUrl.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpdateClubProfileResponseDto')
          ..add('description', description)
          ..add('logoUrl', logoUrl))
        .toString();
  }
}

class UpdateClubProfileResponseDtoBuilder
    implements
        Builder<UpdateClubProfileResponseDto,
            UpdateClubProfileResponseDtoBuilder> {
  _$UpdateClubProfileResponseDto? _$v;

  JsonObject? _description;
  JsonObject? get description => _$this._description;
  set description(JsonObject? description) => _$this._description = description;

  JsonObject? _logoUrl;
  JsonObject? get logoUrl => _$this._logoUrl;
  set logoUrl(JsonObject? logoUrl) => _$this._logoUrl = logoUrl;

  UpdateClubProfileResponseDtoBuilder() {
    UpdateClubProfileResponseDto._defaults(this);
  }

  UpdateClubProfileResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _description = $v.description;
      _logoUrl = $v.logoUrl;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateClubProfileResponseDto other) {
    _$v = other as _$UpdateClubProfileResponseDto;
  }

  @override
  void update(void Function(UpdateClubProfileResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateClubProfileResponseDto build() => _build();

  _$UpdateClubProfileResponseDto _build() {
    final _$result = _$v ??
        _$UpdateClubProfileResponseDto._(
          description: description,
          logoUrl: logoUrl,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
