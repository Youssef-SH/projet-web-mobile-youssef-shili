// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_rename_club_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AdminRenameClubDto extends AdminRenameClubDto {
  @override
  final String name;

  factory _$AdminRenameClubDto(
          [void Function(AdminRenameClubDtoBuilder)? updates]) =>
      (AdminRenameClubDtoBuilder()..update(updates))._build();

  _$AdminRenameClubDto._({required this.name}) : super._();
  @override
  AdminRenameClubDto rebuild(
          void Function(AdminRenameClubDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AdminRenameClubDtoBuilder toBuilder() =>
      AdminRenameClubDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AdminRenameClubDto && name == other.name;
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
    return (newBuiltValueToStringHelper(r'AdminRenameClubDto')
          ..add('name', name))
        .toString();
  }
}

class AdminRenameClubDtoBuilder
    implements Builder<AdminRenameClubDto, AdminRenameClubDtoBuilder> {
  _$AdminRenameClubDto? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  AdminRenameClubDtoBuilder() {
    AdminRenameClubDto._defaults(this);
  }

  AdminRenameClubDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AdminRenameClubDto other) {
    _$v = other as _$AdminRenameClubDto;
  }

  @override
  void update(void Function(AdminRenameClubDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AdminRenameClubDto build() => _build();

  _$AdminRenameClubDto _build() {
    final _$result = _$v ??
        _$AdminRenameClubDto._(
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'AdminRenameClubDto', 'name'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
