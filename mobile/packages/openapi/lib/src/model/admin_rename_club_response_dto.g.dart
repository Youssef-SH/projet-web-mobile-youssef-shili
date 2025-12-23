// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_rename_club_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AdminRenameClubResponseDto extends AdminRenameClubResponseDto {
  @override
  final String id;
  @override
  final String name;

  factory _$AdminRenameClubResponseDto(
          [void Function(AdminRenameClubResponseDtoBuilder)? updates]) =>
      (AdminRenameClubResponseDtoBuilder()..update(updates))._build();

  _$AdminRenameClubResponseDto._({required this.id, required this.name})
      : super._();
  @override
  AdminRenameClubResponseDto rebuild(
          void Function(AdminRenameClubResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AdminRenameClubResponseDtoBuilder toBuilder() =>
      AdminRenameClubResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AdminRenameClubResponseDto &&
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
    return (newBuiltValueToStringHelper(r'AdminRenameClubResponseDto')
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class AdminRenameClubResponseDtoBuilder
    implements
        Builder<AdminRenameClubResponseDto, AdminRenameClubResponseDtoBuilder> {
  _$AdminRenameClubResponseDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  AdminRenameClubResponseDtoBuilder() {
    AdminRenameClubResponseDto._defaults(this);
  }

  AdminRenameClubResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AdminRenameClubResponseDto other) {
    _$v = other as _$AdminRenameClubResponseDto;
  }

  @override
  void update(void Function(AdminRenameClubResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AdminRenameClubResponseDto build() => _build();

  _$AdminRenameClubResponseDto _build() {
    final _$result = _$v ??
        _$AdminRenameClubResponseDto._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'AdminRenameClubResponseDto', 'id'),
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'AdminRenameClubResponseDto', 'name'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
