// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'club_leaders_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ClubLeadersResponseDto extends ClubLeadersResponseDto {
  @override
  final String clubId;
  @override
  final BuiltList<ClubLeaderDto> leaders;

  factory _$ClubLeadersResponseDto(
          [void Function(ClubLeadersResponseDtoBuilder)? updates]) =>
      (ClubLeadersResponseDtoBuilder()..update(updates))._build();

  _$ClubLeadersResponseDto._({required this.clubId, required this.leaders})
      : super._();
  @override
  ClubLeadersResponseDto rebuild(
          void Function(ClubLeadersResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClubLeadersResponseDtoBuilder toBuilder() =>
      ClubLeadersResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClubLeadersResponseDto &&
        clubId == other.clubId &&
        leaders == other.leaders;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, clubId.hashCode);
    _$hash = $jc(_$hash, leaders.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ClubLeadersResponseDto')
          ..add('clubId', clubId)
          ..add('leaders', leaders))
        .toString();
  }
}

class ClubLeadersResponseDtoBuilder
    implements Builder<ClubLeadersResponseDto, ClubLeadersResponseDtoBuilder> {
  _$ClubLeadersResponseDto? _$v;

  String? _clubId;
  String? get clubId => _$this._clubId;
  set clubId(String? clubId) => _$this._clubId = clubId;

  ListBuilder<ClubLeaderDto>? _leaders;
  ListBuilder<ClubLeaderDto> get leaders =>
      _$this._leaders ??= ListBuilder<ClubLeaderDto>();
  set leaders(ListBuilder<ClubLeaderDto>? leaders) => _$this._leaders = leaders;

  ClubLeadersResponseDtoBuilder() {
    ClubLeadersResponseDto._defaults(this);
  }

  ClubLeadersResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _clubId = $v.clubId;
      _leaders = $v.leaders.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ClubLeadersResponseDto other) {
    _$v = other as _$ClubLeadersResponseDto;
  }

  @override
  void update(void Function(ClubLeadersResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClubLeadersResponseDto build() => _build();

  _$ClubLeadersResponseDto _build() {
    _$ClubLeadersResponseDto _$result;
    try {
      _$result = _$v ??
          _$ClubLeadersResponseDto._(
            clubId: BuiltValueNullFieldError.checkNotNull(
                clubId, r'ClubLeadersResponseDto', 'clubId'),
            leaders: leaders.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'leaders';
        leaders.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ClubLeadersResponseDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
