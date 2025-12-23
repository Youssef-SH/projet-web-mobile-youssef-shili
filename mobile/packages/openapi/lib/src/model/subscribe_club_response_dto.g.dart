// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscribe_club_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SubscribeClubResponseDto extends SubscribeClubResponseDto {
  @override
  final String clubId;
  @override
  final bool isFollowed;

  factory _$SubscribeClubResponseDto(
          [void Function(SubscribeClubResponseDtoBuilder)? updates]) =>
      (SubscribeClubResponseDtoBuilder()..update(updates))._build();

  _$SubscribeClubResponseDto._({required this.clubId, required this.isFollowed})
      : super._();
  @override
  SubscribeClubResponseDto rebuild(
          void Function(SubscribeClubResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SubscribeClubResponseDtoBuilder toBuilder() =>
      SubscribeClubResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SubscribeClubResponseDto &&
        clubId == other.clubId &&
        isFollowed == other.isFollowed;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, clubId.hashCode);
    _$hash = $jc(_$hash, isFollowed.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SubscribeClubResponseDto')
          ..add('clubId', clubId)
          ..add('isFollowed', isFollowed))
        .toString();
  }
}

class SubscribeClubResponseDtoBuilder
    implements
        Builder<SubscribeClubResponseDto, SubscribeClubResponseDtoBuilder> {
  _$SubscribeClubResponseDto? _$v;

  String? _clubId;
  String? get clubId => _$this._clubId;
  set clubId(String? clubId) => _$this._clubId = clubId;

  bool? _isFollowed;
  bool? get isFollowed => _$this._isFollowed;
  set isFollowed(bool? isFollowed) => _$this._isFollowed = isFollowed;

  SubscribeClubResponseDtoBuilder() {
    SubscribeClubResponseDto._defaults(this);
  }

  SubscribeClubResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _clubId = $v.clubId;
      _isFollowed = $v.isFollowed;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SubscribeClubResponseDto other) {
    _$v = other as _$SubscribeClubResponseDto;
  }

  @override
  void update(void Function(SubscribeClubResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SubscribeClubResponseDto build() => _build();

  _$SubscribeClubResponseDto _build() {
    final _$result = _$v ??
        _$SubscribeClubResponseDto._(
          clubId: BuiltValueNullFieldError.checkNotNull(
              clubId, r'SubscribeClubResponseDto', 'clubId'),
          isFollowed: BuiltValueNullFieldError.checkNotNull(
              isFollowed, r'SubscribeClubResponseDto', 'isFollowed'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
