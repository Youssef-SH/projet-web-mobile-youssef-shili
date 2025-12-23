// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_room_change_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$EventRoomChangeResponseDto extends EventRoomChangeResponseDto {
  @override
  final String id;
  @override
  final String location;

  factory _$EventRoomChangeResponseDto(
          [void Function(EventRoomChangeResponseDtoBuilder)? updates]) =>
      (EventRoomChangeResponseDtoBuilder()..update(updates))._build();

  _$EventRoomChangeResponseDto._({required this.id, required this.location})
      : super._();
  @override
  EventRoomChangeResponseDto rebuild(
          void Function(EventRoomChangeResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EventRoomChangeResponseDtoBuilder toBuilder() =>
      EventRoomChangeResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EventRoomChangeResponseDto &&
        id == other.id &&
        location == other.location;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EventRoomChangeResponseDto')
          ..add('id', id)
          ..add('location', location))
        .toString();
  }
}

class EventRoomChangeResponseDtoBuilder
    implements
        Builder<EventRoomChangeResponseDto, EventRoomChangeResponseDtoBuilder> {
  _$EventRoomChangeResponseDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _location;
  String? get location => _$this._location;
  set location(String? location) => _$this._location = location;

  EventRoomChangeResponseDtoBuilder() {
    EventRoomChangeResponseDto._defaults(this);
  }

  EventRoomChangeResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _location = $v.location;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EventRoomChangeResponseDto other) {
    _$v = other as _$EventRoomChangeResponseDto;
  }

  @override
  void update(void Function(EventRoomChangeResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EventRoomChangeResponseDto build() => _build();

  _$EventRoomChangeResponseDto _build() {
    final _$result = _$v ??
        _$EventRoomChangeResponseDto._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'EventRoomChangeResponseDto', 'id'),
          location: BuiltValueNullFieldError.checkNotNull(
              location, r'EventRoomChangeResponseDto', 'location'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
