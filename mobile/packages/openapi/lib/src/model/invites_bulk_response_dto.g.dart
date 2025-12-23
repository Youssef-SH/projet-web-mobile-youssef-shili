// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invites_bulk_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const InvitesBulkResponseDtoAccountTypeEnum
    _$invitesBulkResponseDtoAccountTypeEnum_student =
    const InvitesBulkResponseDtoAccountTypeEnum._('student');
const InvitesBulkResponseDtoAccountTypeEnum
    _$invitesBulkResponseDtoAccountTypeEnum_club =
    const InvitesBulkResponseDtoAccountTypeEnum._('club');

InvitesBulkResponseDtoAccountTypeEnum
    _$invitesBulkResponseDtoAccountTypeEnumValueOf(String name) {
  switch (name) {
    case 'student':
      return _$invitesBulkResponseDtoAccountTypeEnum_student;
    case 'club':
      return _$invitesBulkResponseDtoAccountTypeEnum_club;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<InvitesBulkResponseDtoAccountTypeEnum>
    _$invitesBulkResponseDtoAccountTypeEnumValues = BuiltSet<
        InvitesBulkResponseDtoAccountTypeEnum>(const <InvitesBulkResponseDtoAccountTypeEnum>[
  _$invitesBulkResponseDtoAccountTypeEnum_student,
  _$invitesBulkResponseDtoAccountTypeEnum_club,
]);

const InvitesBulkResponseDtoModeEnum _$invitesBulkResponseDtoModeEnum_add =
    const InvitesBulkResponseDtoModeEnum._('add');
const InvitesBulkResponseDtoModeEnum _$invitesBulkResponseDtoModeEnum_replace =
    const InvitesBulkResponseDtoModeEnum._('replace');

InvitesBulkResponseDtoModeEnum _$invitesBulkResponseDtoModeEnumValueOf(
    String name) {
  switch (name) {
    case 'add':
      return _$invitesBulkResponseDtoModeEnum_add;
    case 'replace':
      return _$invitesBulkResponseDtoModeEnum_replace;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<InvitesBulkResponseDtoModeEnum>
    _$invitesBulkResponseDtoModeEnumValues = BuiltSet<
        InvitesBulkResponseDtoModeEnum>(const <InvitesBulkResponseDtoModeEnum>[
  _$invitesBulkResponseDtoModeEnum_add,
  _$invitesBulkResponseDtoModeEnum_replace,
]);

Serializer<InvitesBulkResponseDtoAccountTypeEnum>
    _$invitesBulkResponseDtoAccountTypeEnumSerializer =
    _$InvitesBulkResponseDtoAccountTypeEnumSerializer();
Serializer<InvitesBulkResponseDtoModeEnum>
    _$invitesBulkResponseDtoModeEnumSerializer =
    _$InvitesBulkResponseDtoModeEnumSerializer();

class _$InvitesBulkResponseDtoAccountTypeEnumSerializer
    implements PrimitiveSerializer<InvitesBulkResponseDtoAccountTypeEnum> {
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
    InvitesBulkResponseDtoAccountTypeEnum
  ];
  @override
  final String wireName = 'InvitesBulkResponseDtoAccountTypeEnum';

  @override
  Object serialize(
          Serializers serializers, InvitesBulkResponseDtoAccountTypeEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  InvitesBulkResponseDtoAccountTypeEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      InvitesBulkResponseDtoAccountTypeEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$InvitesBulkResponseDtoModeEnumSerializer
    implements PrimitiveSerializer<InvitesBulkResponseDtoModeEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'add': 'add',
    'replace': 'replace',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'add': 'add',
    'replace': 'replace',
  };

  @override
  final Iterable<Type> types = const <Type>[InvitesBulkResponseDtoModeEnum];
  @override
  final String wireName = 'InvitesBulkResponseDtoModeEnum';

  @override
  Object serialize(
          Serializers serializers, InvitesBulkResponseDtoModeEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  InvitesBulkResponseDtoModeEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      InvitesBulkResponseDtoModeEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$InvitesBulkResponseDto extends InvitesBulkResponseDto {
  @override
  final InvitesBulkResponseDtoAccountTypeEnum accountType;
  @override
  final InvitesBulkResponseDtoModeEnum mode;
  @override
  final num created;
  @override
  final num skipped;
  @override
  final num deactivated;

  factory _$InvitesBulkResponseDto(
          [void Function(InvitesBulkResponseDtoBuilder)? updates]) =>
      (InvitesBulkResponseDtoBuilder()..update(updates))._build();

  _$InvitesBulkResponseDto._(
      {required this.accountType,
      required this.mode,
      required this.created,
      required this.skipped,
      required this.deactivated})
      : super._();
  @override
  InvitesBulkResponseDto rebuild(
          void Function(InvitesBulkResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InvitesBulkResponseDtoBuilder toBuilder() =>
      InvitesBulkResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InvitesBulkResponseDto &&
        accountType == other.accountType &&
        mode == other.mode &&
        created == other.created &&
        skipped == other.skipped &&
        deactivated == other.deactivated;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, accountType.hashCode);
    _$hash = $jc(_$hash, mode.hashCode);
    _$hash = $jc(_$hash, created.hashCode);
    _$hash = $jc(_$hash, skipped.hashCode);
    _$hash = $jc(_$hash, deactivated.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'InvitesBulkResponseDto')
          ..add('accountType', accountType)
          ..add('mode', mode)
          ..add('created', created)
          ..add('skipped', skipped)
          ..add('deactivated', deactivated))
        .toString();
  }
}

class InvitesBulkResponseDtoBuilder
    implements Builder<InvitesBulkResponseDto, InvitesBulkResponseDtoBuilder> {
  _$InvitesBulkResponseDto? _$v;

  InvitesBulkResponseDtoAccountTypeEnum? _accountType;
  InvitesBulkResponseDtoAccountTypeEnum? get accountType => _$this._accountType;
  set accountType(InvitesBulkResponseDtoAccountTypeEnum? accountType) =>
      _$this._accountType = accountType;

  InvitesBulkResponseDtoModeEnum? _mode;
  InvitesBulkResponseDtoModeEnum? get mode => _$this._mode;
  set mode(InvitesBulkResponseDtoModeEnum? mode) => _$this._mode = mode;

  num? _created;
  num? get created => _$this._created;
  set created(num? created) => _$this._created = created;

  num? _skipped;
  num? get skipped => _$this._skipped;
  set skipped(num? skipped) => _$this._skipped = skipped;

  num? _deactivated;
  num? get deactivated => _$this._deactivated;
  set deactivated(num? deactivated) => _$this._deactivated = deactivated;

  InvitesBulkResponseDtoBuilder() {
    InvitesBulkResponseDto._defaults(this);
  }

  InvitesBulkResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _accountType = $v.accountType;
      _mode = $v.mode;
      _created = $v.created;
      _skipped = $v.skipped;
      _deactivated = $v.deactivated;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InvitesBulkResponseDto other) {
    _$v = other as _$InvitesBulkResponseDto;
  }

  @override
  void update(void Function(InvitesBulkResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  InvitesBulkResponseDto build() => _build();

  _$InvitesBulkResponseDto _build() {
    final _$result = _$v ??
        _$InvitesBulkResponseDto._(
          accountType: BuiltValueNullFieldError.checkNotNull(
              accountType, r'InvitesBulkResponseDto', 'accountType'),
          mode: BuiltValueNullFieldError.checkNotNull(
              mode, r'InvitesBulkResponseDto', 'mode'),
          created: BuiltValueNullFieldError.checkNotNull(
              created, r'InvitesBulkResponseDto', 'created'),
          skipped: BuiltValueNullFieldError.checkNotNull(
              skipped, r'InvitesBulkResponseDto', 'skipped'),
          deactivated: BuiltValueNullFieldError.checkNotNull(
              deactivated, r'InvitesBulkResponseDto', 'deactivated'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
