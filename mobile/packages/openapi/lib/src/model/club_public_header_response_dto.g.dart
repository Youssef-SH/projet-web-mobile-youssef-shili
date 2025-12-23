// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'club_public_header_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ClubPublicHeaderResponseDto extends ClubPublicHeaderResponseDto {
  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String logoUrl;
  @override
  final num followerCount;
  @override
  final num postCount;
  @override
  final bool? isFollowed;
  @override
  final bool? isActive;

  factory _$ClubPublicHeaderResponseDto(
          [void Function(ClubPublicHeaderResponseDtoBuilder)? updates]) =>
      (ClubPublicHeaderResponseDtoBuilder()..update(updates))._build();

  _$ClubPublicHeaderResponseDto._(
      {required this.id,
      required this.name,
      required this.description,
      required this.logoUrl,
      required this.followerCount,
      required this.postCount,
      this.isFollowed,
      this.isActive})
      : super._();
  @override
  ClubPublicHeaderResponseDto rebuild(
          void Function(ClubPublicHeaderResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClubPublicHeaderResponseDtoBuilder toBuilder() =>
      ClubPublicHeaderResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClubPublicHeaderResponseDto &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        logoUrl == other.logoUrl &&
        followerCount == other.followerCount &&
        postCount == other.postCount &&
        isFollowed == other.isFollowed &&
        isActive == other.isActive;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, logoUrl.hashCode);
    _$hash = $jc(_$hash, followerCount.hashCode);
    _$hash = $jc(_$hash, postCount.hashCode);
    _$hash = $jc(_$hash, isFollowed.hashCode);
    _$hash = $jc(_$hash, isActive.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ClubPublicHeaderResponseDto')
          ..add('id', id)
          ..add('name', name)
          ..add('description', description)
          ..add('logoUrl', logoUrl)
          ..add('followerCount', followerCount)
          ..add('postCount', postCount)
          ..add('isFollowed', isFollowed)
          ..add('isActive', isActive))
        .toString();
  }
}

class ClubPublicHeaderResponseDtoBuilder
    implements
        Builder<ClubPublicHeaderResponseDto,
            ClubPublicHeaderResponseDtoBuilder> {
  _$ClubPublicHeaderResponseDto? _$v;

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

  num? _followerCount;
  num? get followerCount => _$this._followerCount;
  set followerCount(num? followerCount) =>
      _$this._followerCount = followerCount;

  num? _postCount;
  num? get postCount => _$this._postCount;
  set postCount(num? postCount) => _$this._postCount = postCount;

  bool? _isFollowed;
  bool? get isFollowed => _$this._isFollowed;
  set isFollowed(bool? isFollowed) => _$this._isFollowed = isFollowed;

  bool? _isActive;
  bool? get isActive => _$this._isActive;
  set isActive(bool? isActive) => _$this._isActive = isActive;

  ClubPublicHeaderResponseDtoBuilder() {
    ClubPublicHeaderResponseDto._defaults(this);
  }

  ClubPublicHeaderResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _description = $v.description;
      _logoUrl = $v.logoUrl;
      _followerCount = $v.followerCount;
      _postCount = $v.postCount;
      _isFollowed = $v.isFollowed;
      _isActive = $v.isActive;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ClubPublicHeaderResponseDto other) {
    _$v = other as _$ClubPublicHeaderResponseDto;
  }

  @override
  void update(void Function(ClubPublicHeaderResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClubPublicHeaderResponseDto build() => _build();

  _$ClubPublicHeaderResponseDto _build() {
    final _$result = _$v ??
        _$ClubPublicHeaderResponseDto._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'ClubPublicHeaderResponseDto', 'id'),
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'ClubPublicHeaderResponseDto', 'name'),
          description: BuiltValueNullFieldError.checkNotNull(
              description, r'ClubPublicHeaderResponseDto', 'description'),
          logoUrl: BuiltValueNullFieldError.checkNotNull(
              logoUrl, r'ClubPublicHeaderResponseDto', 'logoUrl'),
          followerCount: BuiltValueNullFieldError.checkNotNull(
              followerCount, r'ClubPublicHeaderResponseDto', 'followerCount'),
          postCount: BuiltValueNullFieldError.checkNotNull(
              postCount, r'ClubPublicHeaderResponseDto', 'postCount'),
          isFollowed: isFollowed,
          isActive: isActive,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
