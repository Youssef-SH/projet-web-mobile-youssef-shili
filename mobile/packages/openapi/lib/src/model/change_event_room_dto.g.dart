// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_event_room_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ChangeEventRoomDto extends ChangeEventRoomDto {
  @override
  final String roomId;

  factory _$ChangeEventRoomDto(
          [void Function(ChangeEventRoomDtoBuilder)? updates]) =>
      (ChangeEventRoomDtoBuilder()..update(updates))._build();

  _$ChangeEventRoomDto._({required this.roomId}) : super._();
  @override
  ChangeEventRoomDto rebuild(
          void Function(ChangeEventRoomDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChangeEventRoomDtoBuilder toBuilder() =>
      ChangeEventRoomDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChangeEventRoomDto && roomId == other.roomId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, roomId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChangeEventRoomDto')
          ..add('roomId', roomId))
        .toString();
  }
}

class ChangeEventRoomDtoBuilder
    implements Builder<ChangeEventRoomDto, ChangeEventRoomDtoBuilder> {
  _$ChangeEventRoomDto? _$v;

  String? _roomId;
  String? get roomId => _$this._roomId;
  set roomId(String? roomId) => _$this._roomId = roomId;

  ChangeEventRoomDtoBuilder() {
    ChangeEventRoomDto._defaults(this);
  }

  ChangeEventRoomDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _roomId = $v.roomId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChangeEventRoomDto other) {
    _$v = other as _$ChangeEventRoomDto;
  }

  @override
  void update(void Function(ChangeEventRoomDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChangeEventRoomDto build() => _build();

  _$ChangeEventRoomDto _build() {
    final _$result = _$v ??
        _$ChangeEventRoomDto._(
          roomId: BuiltValueNullFieldError.checkNotNull(
              roomId, r'ChangeEventRoomDto', 'roomId'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
