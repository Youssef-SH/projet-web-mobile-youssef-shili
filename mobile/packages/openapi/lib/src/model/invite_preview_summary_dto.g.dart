// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invite_preview_summary_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const InvitePreviewSummaryDtoAccountTypeEnum
    _$invitePreviewSummaryDtoAccountTypeEnum_student =
    const InvitePreviewSummaryDtoAccountTypeEnum._('student');
const InvitePreviewSummaryDtoAccountTypeEnum
    _$invitePreviewSummaryDtoAccountTypeEnum_club =
    const InvitePreviewSummaryDtoAccountTypeEnum._('club');

InvitePreviewSummaryDtoAccountTypeEnum
    _$invitePreviewSummaryDtoAccountTypeEnumValueOf(String name) {
  switch (name) {
    case 'student':
      return _$invitePreviewSummaryDtoAccountTypeEnum_student;
    case 'club':
      return _$invitePreviewSummaryDtoAccountTypeEnum_club;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<InvitePreviewSummaryDtoAccountTypeEnum>
    _$invitePreviewSummaryDtoAccountTypeEnumValues = BuiltSet<
        InvitePreviewSummaryDtoAccountTypeEnum>(const <InvitePreviewSummaryDtoAccountTypeEnum>[
  _$invitePreviewSummaryDtoAccountTypeEnum_student,
  _$invitePreviewSummaryDtoAccountTypeEnum_club,
]);

const InvitePreviewSummaryDtoModeEnum _$invitePreviewSummaryDtoModeEnum_add =
    const InvitePreviewSummaryDtoModeEnum._('add');
const InvitePreviewSummaryDtoModeEnum
    _$invitePreviewSummaryDtoModeEnum_replace =
    const InvitePreviewSummaryDtoModeEnum._('replace');

InvitePreviewSummaryDtoModeEnum _$invitePreviewSummaryDtoModeEnumValueOf(
    String name) {
  switch (name) {
    case 'add':
      return _$invitePreviewSummaryDtoModeEnum_add;
    case 'replace':
      return _$invitePreviewSummaryDtoModeEnum_replace;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<InvitePreviewSummaryDtoModeEnum>
    _$invitePreviewSummaryDtoModeEnumValues = BuiltSet<
        InvitePreviewSummaryDtoModeEnum>(const <InvitePreviewSummaryDtoModeEnum>[
  _$invitePreviewSummaryDtoModeEnum_add,
  _$invitePreviewSummaryDtoModeEnum_replace,
]);

Serializer<InvitePreviewSummaryDtoAccountTypeEnum>
    _$invitePreviewSummaryDtoAccountTypeEnumSerializer =
    _$InvitePreviewSummaryDtoAccountTypeEnumSerializer();
Serializer<InvitePreviewSummaryDtoModeEnum>
    _$invitePreviewSummaryDtoModeEnumSerializer =
    _$InvitePreviewSummaryDtoModeEnumSerializer();

class _$InvitePreviewSummaryDtoAccountTypeEnumSerializer
    implements PrimitiveSerializer<InvitePreviewSummaryDtoAccountTypeEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'student': 'Student',
    'club': 'Club',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'Student': 'student',
    'Club': 'club',
  };

  @override
  final Iterable<Type> types = const <Type>[
    InvitePreviewSummaryDtoAccountTypeEnum
  ];
  @override
  final String wireName = 'InvitePreviewSummaryDtoAccountTypeEnum';

  @override
  Object serialize(Serializers serializers,
          InvitePreviewSummaryDtoAccountTypeEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  InvitePreviewSummaryDtoAccountTypeEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      InvitePreviewSummaryDtoAccountTypeEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$InvitePreviewSummaryDtoModeEnumSerializer
    implements PrimitiveSerializer<InvitePreviewSummaryDtoModeEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'add': 'add',
    'replace': 'replace',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'add': 'add',
    'replace': 'replace',
  };

  @override
  final Iterable<Type> types = const <Type>[InvitePreviewSummaryDtoModeEnum];
  @override
  final String wireName = 'InvitePreviewSummaryDtoModeEnum';

  @override
  Object serialize(
          Serializers serializers, InvitePreviewSummaryDtoModeEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  InvitePreviewSummaryDtoModeEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      InvitePreviewSummaryDtoModeEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$InvitePreviewSummaryDto extends InvitePreviewSummaryDto {
  @override
  final InvitePreviewSummaryDtoAccountTypeEnum accountType;
  @override
  final InvitePreviewSummaryDtoModeEnum mode;
  @override
  final num totalRows;
  @override
  final num willCreate;
  @override
  final num willSkip;
  @override
  final num willDeactivate;

  factory _$InvitePreviewSummaryDto(
          [void Function(InvitePreviewSummaryDtoBuilder)? updates]) =>
      (InvitePreviewSummaryDtoBuilder()..update(updates))._build();

  _$InvitePreviewSummaryDto._(
      {required this.accountType,
      required this.mode,
      required this.totalRows,
      required this.willCreate,
      required this.willSkip,
      required this.willDeactivate})
      : super._();
  @override
  InvitePreviewSummaryDto rebuild(
          void Function(InvitePreviewSummaryDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InvitePreviewSummaryDtoBuilder toBuilder() =>
      InvitePreviewSummaryDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InvitePreviewSummaryDto &&
        accountType == other.accountType &&
        mode == other.mode &&
        totalRows == other.totalRows &&
        willCreate == other.willCreate &&
        willSkip == other.willSkip &&
        willDeactivate == other.willDeactivate;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, accountType.hashCode);
    _$hash = $jc(_$hash, mode.hashCode);
    _$hash = $jc(_$hash, totalRows.hashCode);
    _$hash = $jc(_$hash, willCreate.hashCode);
    _$hash = $jc(_$hash, willSkip.hashCode);
    _$hash = $jc(_$hash, willDeactivate.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'InvitePreviewSummaryDto')
          ..add('accountType', accountType)
          ..add('mode', mode)
          ..add('totalRows', totalRows)
          ..add('willCreate', willCreate)
          ..add('willSkip', willSkip)
          ..add('willDeactivate', willDeactivate))
        .toString();
  }
}

class InvitePreviewSummaryDtoBuilder
    implements
        Builder<InvitePreviewSummaryDto, InvitePreviewSummaryDtoBuilder> {
  _$InvitePreviewSummaryDto? _$v;

  InvitePreviewSummaryDtoAccountTypeEnum? _accountType;
  InvitePreviewSummaryDtoAccountTypeEnum? get accountType =>
      _$this._accountType;
  set accountType(InvitePreviewSummaryDtoAccountTypeEnum? accountType) =>
      _$this._accountType = accountType;

  InvitePreviewSummaryDtoModeEnum? _mode;
  InvitePreviewSummaryDtoModeEnum? get mode => _$this._mode;
  set mode(InvitePreviewSummaryDtoModeEnum? mode) => _$this._mode = mode;

  num? _totalRows;
  num? get totalRows => _$this._totalRows;
  set totalRows(num? totalRows) => _$this._totalRows = totalRows;

  num? _willCreate;
  num? get willCreate => _$this._willCreate;
  set willCreate(num? willCreate) => _$this._willCreate = willCreate;

  num? _willSkip;
  num? get willSkip => _$this._willSkip;
  set willSkip(num? willSkip) => _$this._willSkip = willSkip;

  num? _willDeactivate;
  num? get willDeactivate => _$this._willDeactivate;
  set willDeactivate(num? willDeactivate) =>
      _$this._willDeactivate = willDeactivate;

  InvitePreviewSummaryDtoBuilder() {
    InvitePreviewSummaryDto._defaults(this);
  }

  InvitePreviewSummaryDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _accountType = $v.accountType;
      _mode = $v.mode;
      _totalRows = $v.totalRows;
      _willCreate = $v.willCreate;
      _willSkip = $v.willSkip;
      _willDeactivate = $v.willDeactivate;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InvitePreviewSummaryDto other) {
    _$v = other as _$InvitePreviewSummaryDto;
  }

  @override
  void update(void Function(InvitePreviewSummaryDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  InvitePreviewSummaryDto build() => _build();

  _$InvitePreviewSummaryDto _build() {
    final _$result = _$v ??
        _$InvitePreviewSummaryDto._(
          accountType: BuiltValueNullFieldError.checkNotNull(
              accountType, r'InvitePreviewSummaryDto', 'accountType'),
          mode: BuiltValueNullFieldError.checkNotNull(
              mode, r'InvitePreviewSummaryDto', 'mode'),
          totalRows: BuiltValueNullFieldError.checkNotNull(
              totalRows, r'InvitePreviewSummaryDto', 'totalRows'),
          willCreate: BuiltValueNullFieldError.checkNotNull(
              willCreate, r'InvitePreviewSummaryDto', 'willCreate'),
          willSkip: BuiltValueNullFieldError.checkNotNull(
              willSkip, r'InvitePreviewSummaryDto', 'willSkip'),
          willDeactivate: BuiltValueNullFieldError.checkNotNull(
              willDeactivate, r'InvitePreviewSummaryDto', 'willDeactivate'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
