// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_room_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateRoomDto extends CreateRoomDto {
  @override
  final String name;

  factory _$CreateRoomDto([void Function(CreateRoomDtoBuilder)? updates]) =>
      (CreateRoomDtoBuilder()..update(updates))._build();

  _$CreateRoomDto._({required this.name}) : super._();
  @override
  CreateRoomDto rebuild(void Function(CreateRoomDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateRoomDtoBuilder toBuilder() => CreateRoomDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateRoomDto && name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateRoomDto')..add('name', name))
        .toString();
  }
}

class CreateRoomDtoBuilder
    implements Builder<CreateRoomDto, CreateRoomDtoBuilder> {
  _$CreateRoomDto? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  CreateRoomDtoBuilder() {
    CreateRoomDto._defaults(this);
  }

  CreateRoomDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateRoomDto other) {
    _$v = other as _$CreateRoomDto;
  }

  @override
  void update(void Function(CreateRoomDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateRoomDto build() => _build();

  _$CreateRoomDto _build() {
    final _$result = _$v ??
        _$CreateRoomDto._(
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'CreateRoomDto', 'name'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
