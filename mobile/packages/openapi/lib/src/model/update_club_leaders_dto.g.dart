// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_club_leaders_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateClubLeadersDto extends UpdateClubLeadersDto {
  @override
  final BuiltList<ClubLeaderInputDto> leaders;

  factory _$UpdateClubLeadersDto(
          [void Function(UpdateClubLeadersDtoBuilder)? updates]) =>
      (UpdateClubLeadersDtoBuilder()..update(updates))._build();

  _$UpdateClubLeadersDto._({required this.leaders}) : super._();
  @override
  UpdateClubLeadersDto rebuild(
          void Function(UpdateClubLeadersDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateClubLeadersDtoBuilder toBuilder() =>
      UpdateClubLeadersDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateClubLeadersDto && leaders == other.leaders;
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
    return (newBuiltValueToStringHelper(r'UpdateClubLeadersDto')
          ..add('leaders', leaders))
        .toString();
  }
}

class UpdateClubLeadersDtoBuilder
    implements Builder<UpdateClubLeadersDto, UpdateClubLeadersDtoBuilder> {
  _$UpdateClubLeadersDto? _$v;

  ListBuilder<ClubLeaderInputDto>? _leaders;
  ListBuilder<ClubLeaderInputDto> get leaders =>
      _$this._leaders ??= ListBuilder<ClubLeaderInputDto>();
  set leaders(ListBuilder<ClubLeaderInputDto>? leaders) =>
      _$this._leaders = leaders;

  UpdateClubLeadersDtoBuilder() {
    UpdateClubLeadersDto._defaults(this);
  }

  UpdateClubLeadersDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _leaders = $v.leaders.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateClubLeadersDto other) {
    _$v = other as _$UpdateClubLeadersDto;
  }

  @override
  void update(void Function(UpdateClubLeadersDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateClubLeadersDto build() => _build();

  _$UpdateClubLeadersDto _build() {
    _$UpdateClubLeadersDto _$result;
    try {
      _$result = _$v ??
          _$UpdateClubLeadersDto._(
            leaders: leaders.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'leaders';
        leaders.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'UpdateClubLeadersDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
