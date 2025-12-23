// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'club_self_profile_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ClubSelfProfileResponseDto extends ClubSelfProfileResponseDto {
  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String logoUrl;
  @override
  final BuiltList<ClubLeaderDto> leaders;

  factory _$ClubSelfProfileResponseDto(
          [void Function(ClubSelfProfileResponseDtoBuilder)? updates]) =>
      (ClubSelfProfileResponseDtoBuilder()..update(updates))._build();

  _$ClubSelfProfileResponseDto._(
      {required this.id,
      required this.name,
      required this.description,
      required this.logoUrl,
      required this.leaders})
      : super._();
  @override
  ClubSelfProfileResponseDto rebuild(
          void Function(ClubSelfProfileResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClubSelfProfileResponseDtoBuilder toBuilder() =>
      ClubSelfProfileResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClubSelfProfileResponseDto &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        logoUrl == other.logoUrl &&
        leaders == other.leaders;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, logoUrl.hashCode);
    _$hash = $jc(_$hash, leaders.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ClubSelfProfileResponseDto')
          ..add('id', id)
          ..add('name', name)
          ..add('description', description)
          ..add('logoUrl', logoUrl)
          ..add('leaders', leaders))
        .toString();
  }
}

class ClubSelfProfileResponseDtoBuilder
    implements
        Builder<ClubSelfProfileResponseDto, ClubSelfProfileResponseDtoBuilder> {
  _$ClubSelfProfileResponseDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _logoUrl;
  String? get logoUrl => _$this._logoUrl;
  set logoUrl(String? logoUrl) => _$this._logoUrl = logoUrl;

  ListBuilder<ClubLeaderDto>? _leaders;
  ListBuilder<ClubLeaderDto> get leaders =>
      _$this._leaders ??= ListBuilder<ClubLeaderDto>();
  set leaders(ListBuilder<ClubLeaderDto>? leaders) => _$this._leaders = leaders;

  ClubSelfProfileResponseDtoBuilder() {
    ClubSelfProfileResponseDto._defaults(this);
  }

  ClubSelfProfileResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _description = $v.description;
      _logoUrl = $v.logoUrl;
      _leaders = $v.leaders.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ClubSelfProfileResponseDto other) {
    _$v = other as _$ClubSelfProfileResponseDto;
  }

  @override
  void update(void Function(ClubSelfProfileResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClubSelfProfileResponseDto build() => _build();

  _$ClubSelfProfileResponseDto _build() {
    _$ClubSelfProfileResponseDto _$result;
    try {
      _$result = _$v ??
          _$ClubSelfProfileResponseDto._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'ClubSelfProfileResponseDto', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'ClubSelfProfileResponseDto', 'name'),
            description: BuiltValueNullFieldError.checkNotNull(
                description, r'ClubSelfProfileResponseDto', 'description'),
            logoUrl: BuiltValueNullFieldError.checkNotNull(
                logoUrl, r'ClubSelfProfileResponseDto', 'logoUrl'),
            leaders: leaders.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'leaders';
        leaders.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ClubSelfProfileResponseDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
