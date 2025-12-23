// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_club_leaders_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateClubLeadersResponseDto extends UpdateClubLeadersResponseDto {
  @override
  final BuiltList<ClubLeaderDto> leaders;

  factory _$UpdateClubLeadersResponseDto(
          [void Function(UpdateClubLeadersResponseDtoBuilder)? updates]) =>
      (UpdateClubLeadersResponseDtoBuilder()..update(updates))._build();

  _$UpdateClubLeadersResponseDto._({required this.leaders}) : super._();
  @override
  UpdateClubLeadersResponseDto rebuild(
          void Function(UpdateClubLeadersResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateClubLeadersResponseDtoBuilder toBuilder() =>
      UpdateClubLeadersResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateClubLeadersResponseDto && leaders == other.leaders;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, leaders.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpdateClubLeadersResponseDto')
          ..add('leaders', leaders))
        .toString();
  }
}

class UpdateClubLeadersResponseDtoBuilder
    implements
        Builder<UpdateClubLeadersResponseDto,
            UpdateClubLeadersResponseDtoBuilder> {
  _$UpdateClubLeadersResponseDto? _$v;

  ListBuilder<ClubLeaderDto>? _leaders;
  ListBuilder<ClubLeaderDto> get leaders =>
      _$this._leaders ??= ListBuilder<ClubLeaderDto>();
  set leaders(ListBuilder<ClubLeaderDto>? leaders) => _$this._leaders = leaders;

  UpdateClubLeadersResponseDtoBuilder() {
    UpdateClubLeadersResponseDto._defaults(this);
  }

  UpdateClubLeadersResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _leaders = $v.leaders.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateClubLeadersResponseDto other) {
    _$v = other as _$UpdateClubLeadersResponseDto;
  }

  @override
  void update(void Function(UpdateClubLeadersResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateClubLeadersResponseDto build() => _build();

  _$UpdateClubLeadersResponseDto _build() {
    _$UpdateClubLeadersResponseDto _$result;
    try {
      _$result = _$v ??
          _$UpdateClubLeadersResponseDto._(
            leaders: leaders.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'leaders';
        leaders.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'UpdateClubLeadersResponseDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
