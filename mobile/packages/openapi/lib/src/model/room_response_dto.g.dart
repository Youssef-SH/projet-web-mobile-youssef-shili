// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RoomResponseDto extends RoomResponseDto {
  @override
  final String id;
  @override
  final String name;

  factory _$RoomResponseDto([void Function(RoomResponseDtoBuilder)? updates]) =>
      (RoomResponseDtoBuilder()..update(updates))._build();

  _$RoomResponseDto._({required this.id, required this.name}) : super._();
  @override
  RoomResponseDto rebuild(void Function(RoomResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RoomResponseDtoBuilder toBuilder() => RoomResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RoomResponseDto && id == other.id && name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RoomResponseDto')
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class RoomResponseDtoBuilder
    implements Builder<RoomResponseDto, RoomResponseDtoBuilder> {
  _$RoomResponseDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  RoomResponseDtoBuilder() {
    RoomResponseDto._defaults(this);
  }

  RoomResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RoomResponseDto other) {
    _$v = other as _$RoomResponseDto;
  }

  @override
  void update(void Function(RoomResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RoomResponseDto build() => _build();

  _$RoomResponseDto _build() {
    final _$result = _$v ??
        _$RoomResponseDto._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'RoomResponseDto', 'id'),
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'RoomResponseDto', 'name'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
