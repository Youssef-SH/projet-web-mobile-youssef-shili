// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clubs_list_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ClubsListResponseDto extends ClubsListResponseDto {
  @override
  final BuiltList<ClubCardResponseDto> clubs;

  factory _$ClubsListResponseDto(
          [void Function(ClubsListResponseDtoBuilder)? updates]) =>
      (ClubsListResponseDtoBuilder()..update(updates))._build();

  _$ClubsListResponseDto._({required this.clubs}) : super._();
  @override
  ClubsListResponseDto rebuild(
          void Function(ClubsListResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClubsListResponseDtoBuilder toBuilder() =>
      ClubsListResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClubsListResponseDto && clubs == other.clubs;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, clubs.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ClubsListResponseDto')
          ..add('clubs', clubs))
        .toString();
  }
}

class ClubsListResponseDtoBuilder
    implements Builder<ClubsListResponseDto, ClubsListResponseDtoBuilder> {
  _$ClubsListResponseDto? _$v;

  ListBuilder<ClubCardResponseDto>? _clubs;
  ListBuilder<ClubCardResponseDto> get clubs =>
      _$this._clubs ??= ListBuilder<ClubCardResponseDto>();
  set clubs(ListBuilder<ClubCardResponseDto>? clubs) => _$this._clubs = clubs;

  ClubsListResponseDtoBuilder() {
    ClubsListResponseDto._defaults(this);
  }

  ClubsListResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _clubs = $v.clubs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ClubsListResponseDto other) {
    _$v = other as _$ClubsListResponseDto;
  }

  @override
  void update(void Function(ClubsListResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClubsListResponseDto build() => _build();

  _$ClubsListResponseDto _build() {
    _$ClubsListResponseDto _$result;
    try {
      _$result = _$v ??
          _$ClubsListResponseDto._(
            clubs: clubs.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'clubs';
        clubs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ClubsListResponseDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
