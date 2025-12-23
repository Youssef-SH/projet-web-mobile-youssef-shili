// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_create_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RoomCreateResponseDto extends RoomCreateResponseDto {
  @override
  final String id;
  @override
  final String name;

  factory _$RoomCreateResponseDto(
          [void Function(RoomCreateResponseDtoBuilder)? updates]) =>
      (RoomCreateResponseDtoBuilder()..update(updates))._build();

  _$RoomCreateResponseDto._({required this.id, required this.name}) : super._();
  @override
  RoomCreateResponseDto rebuild(
          void Function(RoomCreateResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RoomCreateResponseDtoBuilder toBuilder() =>
      RoomCreateResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RoomCreateResponseDto &&
        id == other.id &&
        name == other.name;
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
    return (newBuiltValueToStringHelper(r'RoomCreateResponseDto')
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class RoomCreateResponseDtoBuilder
    implements Builder<RoomCreateResponseDto, RoomCreateResponseDtoBuilder> {
  _$RoomCreateResponseDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  RoomCreateResponseDtoBuilder() {
    RoomCreateResponseDto._defaults(this);
  }

  RoomCreateResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RoomCreateResponseDto other) {
    _$v = other as _$RoomCreateResponseDto;
  }

  @override
  void update(void Function(RoomCreateResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RoomCreateResponseDto build() => _build();

  _$RoomCreateResponseDto _build() {
    final _$result = _$v ??
        _$RoomCreateResponseDto._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'RoomCreateResponseDto', 'id'),
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'RoomCreateResponseDto', 'name'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
