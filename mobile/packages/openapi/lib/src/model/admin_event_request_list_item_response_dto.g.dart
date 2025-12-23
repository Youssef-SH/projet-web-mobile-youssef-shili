// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_event_request_list_item_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const AdminEventRequestListItemResponseDtoEventTypeEnum
    _$adminEventRequestListItemResponseDtoEventTypeEnum_scientific =
    const AdminEventRequestListItemResponseDtoEventTypeEnum._('scientific');
const AdminEventRequestListItemResponseDtoEventTypeEnum
    _$adminEventRequestListItemResponseDtoEventTypeEnum_social =
    const AdminEventRequestListItemResponseDtoEventTypeEnum._('social');
const AdminEventRequestListItemResponseDtoEventTypeEnum
    _$adminEventRequestListItemResponseDtoEventTypeEnum_entertainment =
    const AdminEventRequestListItemResponseDtoEventTypeEnum._('entertainment');
const AdminEventRequestListItemResponseDtoEventTypeEnum
    _$adminEventRequestListItemResponseDtoEventTypeEnum_national =
    const AdminEventRequestListItemResponseDtoEventTypeEnum._('national');
const AdminEventRequestListItemResponseDtoEventTypeEnum
    _$adminEventRequestListItemResponseDtoEventTypeEnum_sports =
    const AdminEventRequestListItemResponseDtoEventTypeEnum._('sports');
const AdminEventRequestListItemResponseDtoEventTypeEnum
    _$adminEventRequestListItemResponseDtoEventTypeEnum_artistic =
    const AdminEventRequestListItemResponseDtoEventTypeEnum._('artistic');
const AdminEventRequestListItemResponseDtoEventTypeEnum
    _$adminEventRequestListItemResponseDtoEventTypeEnum_other =
    const AdminEventRequestListItemResponseDtoEventTypeEnum._('other');

AdminEventRequestListItemResponseDtoEventTypeEnum
    _$adminEventRequestListItemResponseDtoEventTypeEnumValueOf(String name) {
  switch (name) {
    case 'scientific':
      return _$adminEventRequestListItemResponseDtoEventTypeEnum_scientific;
    case 'social':
      return _$adminEventRequestListItemResponseDtoEventTypeEnum_social;
    case 'entertainment':
      return _$adminEventRequestListItemResponseDtoEventTypeEnum_entertainment;
    case 'national':
      return _$adminEventRequestListItemResponseDtoEventTypeEnum_national;
    case 'sports':
      return _$adminEventRequestListItemResponseDtoEventTypeEnum_sports;
    case 'artistic':
      return _$adminEventRequestListItemResponseDtoEventTypeEnum_artistic;
    case 'other':
      return _$adminEventRequestListItemResponseDtoEventTypeEnum_other;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<AdminEventRequestListItemResponseDtoEventTypeEnum>
    _$adminEventRequestListItemResponseDtoEventTypeEnumValues = BuiltSet<
        AdminEventRequestListItemResponseDtoEventTypeEnum>(const <AdminEventRequestListItemResponseDtoEventTypeEnum>[
  _$adminEventRequestListItemResponseDtoEventTypeEnum_scientific,
  _$adminEventRequestListItemResponseDtoEventTypeEnum_social,
  _$adminEventRequestListItemResponseDtoEventTypeEnum_entertainment,
  _$adminEventRequestListItemResponseDtoEventTypeEnum_national,
  _$adminEventRequestListItemResponseDtoEventTypeEnum_sports,
  _$adminEventRequestListItemResponseDtoEventTypeEnum_artistic,
  _$adminEventRequestListItemResponseDtoEventTypeEnum_other,
]);

const AdminEventRequestListItemResponseDtoStatusEnum
    _$adminEventRequestListItemResponseDtoStatusEnum_pending =
    const AdminEventRequestListItemResponseDtoStatusEnum._('pending');
const AdminEventRequestListItemResponseDtoStatusEnum
    _$adminEventRequestListItemResponseDtoStatusEnum_approved =
    const AdminEventRequestListItemResponseDtoStatusEnum._('approved');
const AdminEventRequestListItemResponseDtoStatusEnum
    _$adminEventRequestListItemResponseDtoStatusEnum_rejected =
    const AdminEventRequestListItemResponseDtoStatusEnum._('rejected');

AdminEventRequestListItemResponseDtoStatusEnum
    _$adminEventRequestListItemResponseDtoStatusEnumValueOf(String name) {
  switch (name) {
    case 'pending':
      return _$adminEventRequestListItemResponseDtoStatusEnum_pending;
    case 'approved':
      return _$adminEventRequestListItemResponseDtoStatusEnum_approved;
    case 'rejected':
      return _$adminEventRequestListItemResponseDtoStatusEnum_rejected;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<AdminEventRequestListItemResponseDtoStatusEnum>
    _$adminEventRequestListItemResponseDtoStatusEnumValues = BuiltSet<
        AdminEventRequestListItemResponseDtoStatusEnum>(const <AdminEventRequestListItemResponseDtoStatusEnum>[
  _$adminEventRequestListItemResponseDtoStatusEnum_pending,
  _$adminEventRequestListItemResponseDtoStatusEnum_approved,
  _$adminEventRequestListItemResponseDtoStatusEnum_rejected,
]);

const AdminEventRequestListItemResponseDtoSubmittedByRoleEnum
    _$adminEventRequestListItemResponseDtoSubmittedByRoleEnum_president =
    const AdminEventRequestListItemResponseDtoSubmittedByRoleEnum._(
        'president');
const AdminEventRequestListItemResponseDtoSubmittedByRoleEnum
    _$adminEventRequestListItemResponseDtoSubmittedByRoleEnum_vicePresident =
    const AdminEventRequestListItemResponseDtoSubmittedByRoleEnum._(
        'vicePresident');

AdminEventRequestListItemResponseDtoSubmittedByRoleEnum
    _$adminEventRequestListItemResponseDtoSubmittedByRoleEnumValueOf(
        String name) {
  switch (name) {
    case 'president':
      return _$adminEventRequestListItemResponseDtoSubmittedByRoleEnum_president;
    case 'vicePresident':
      return _$adminEventRequestListItemResponseDtoSubmittedByRoleEnum_vicePresident;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<AdminEventRequestListItemResponseDtoSubmittedByRoleEnum>
    _$adminEventRequestListItemResponseDtoSubmittedByRoleEnumValues = BuiltSet<
        AdminEventRequestListItemResponseDtoSubmittedByRoleEnum>(const <AdminEventRequestListItemResponseDtoSubmittedByRoleEnum>[
  _$adminEventRequestListItemResponseDtoSubmittedByRoleEnum_president,
  _$adminEventRequestListItemResponseDtoSubmittedByRoleEnum_vicePresident,
]);

Serializer<AdminEventRequestListItemResponseDtoEventTypeEnum>
    _$adminEventRequestListItemResponseDtoEventTypeEnumSerializer =
    _$AdminEventRequestListItemResponseDtoEventTypeEnumSerializer();
Serializer<AdminEventRequestListItemResponseDtoStatusEnum>
    _$adminEventRequestListItemResponseDtoStatusEnumSerializer =
    _$AdminEventRequestListItemResponseDtoStatusEnumSerializer();
Serializer<AdminEventRequestListItemResponseDtoSubmittedByRoleEnum>
    _$adminEventRequestListItemResponseDtoSubmittedByRoleEnumSerializer =
    _$AdminEventRequestListItemResponseDtoSubmittedByRoleEnumSerializer();

class _$AdminEventRequestListItemResponseDtoEventTypeEnumSerializer
    implements
        PrimitiveSerializer<AdminEventRequestListItemResponseDtoEventTypeEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'scientific': 'Scientific',
    'social': 'Social',
    'entertainment': 'Entertainment',
    'national': 'National',
    'sports': 'Sports',
    'artistic': 'Artistic',
    'other': 'Other',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'Scientific': 'scientific',
    'Social': 'social',
    'Entertainment': 'entertainment',
    'National': 'national',
    'Sports': 'sports',
    'Artistic': 'artistic',
    'Other': 'other',
  };

  @override
  final Iterable<Type> types = const <Type>[
    AdminEventRequestListItemResponseDtoEventTypeEnum
  ];
  @override
  final String wireName = 'AdminEventRequestListItemResponseDtoEventTypeEnum';

  @override
  Object serialize(Serializers serializers,
          AdminEventRequestListItemResponseDtoEventTypeEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  AdminEventRequestListItemResponseDtoEventTypeEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      AdminEventRequestListItemResponseDtoEventTypeEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$AdminEventRequestListItemResponseDtoStatusEnumSerializer
    implements
        PrimitiveSerializer<AdminEventRequestListItemResponseDtoStatusEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'pending': 'Pending',
    'approved': 'Approved',
    'rejected': 'Rejected',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'Pending': 'pending',
    'Approved': 'approved',
    'Rejected': 'rejected',
  };

  @override
  final Iterable<Type> types = const <Type>[
    AdminEventRequestListItemResponseDtoStatusEnum
  ];
  @override
  final String wireName = 'AdminEventRequestListItemResponseDtoStatusEnum';

  @override
  Object serialize(Serializers serializers,
          AdminEventRequestListItemResponseDtoStatusEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  AdminEventRequestListItemResponseDtoStatusEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      AdminEventRequestListItemResponseDtoStatusEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$AdminEventRequestListItemResponseDtoSubmittedByRoleEnumSerializer
    implements
        PrimitiveSerializer<
            AdminEventRequestListItemResponseDtoSubmittedByRoleEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'president': 'President',
    'vicePresident': 'VicePresident',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'President': 'president',
    'VicePresident': 'vicePresident',
  };

  @override
  final Iterable<Type> types = const <Type>[
    AdminEventRequestListItemResponseDtoSubmittedByRoleEnum
  ];
  @override
  final String wireName =
      'AdminEventRequestListItemResponseDtoSubmittedByRoleEnum';

  @override
  Object serialize(Serializers serializers,
          AdminEventRequestListItemResponseDtoSubmittedByRoleEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  AdminEventRequestListItemResponseDtoSubmittedByRoleEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      AdminEventRequestListItemResponseDtoSubmittedByRoleEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$AdminEventRequestListItemResponseDto
    extends AdminEventRequestListItemResponseDto {
  @override
  final String id;
  @override
  final String title;
  @override
  final AdminEventRequestListItemResponseDtoEventTypeEnum eventType;
  @override
  final String clubName;
  @override
  final AdminEventRequestListItemResponseDtoStatusEnum status;
  @override
  final DateTime startTime;
  @override
  final DateTime endTime;
  @override
  final DateTime submittedAt;
  @override
  final AdminEventRequestListItemResponseDtoSubmittedByRoleEnum submittedByRole;

  factory _$AdminEventRequestListItemResponseDto(
          [void Function(AdminEventRequestListItemResponseDtoBuilder)?
              updates]) =>
      (AdminEventRequestListItemResponseDtoBuilder()..update(updates))._build();

  _$AdminEventRequestListItemResponseDto._(
      {required this.id,
      required this.title,
      required this.eventType,
      required this.clubName,
      required this.status,
      required this.startTime,
      required this.endTime,
      required this.submittedAt,
      required this.submittedByRole})
      : super._();
  @override
  AdminEventRequestListItemResponseDto rebuild(
          void Function(AdminEventRequestListItemResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AdminEventRequestListItemResponseDtoBuilder toBuilder() =>
      AdminEventRequestListItemResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AdminEventRequestListItemResponseDto &&
        id == other.id &&
        title == other.title &&
        eventType == other.eventType &&
        clubName == other.clubName &&
        status == other.status &&
        startTime == other.startTime &&
        endTime == other.endTime &&
        submittedAt == other.submittedAt &&
        submittedByRole == other.submittedByRole;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, eventType.hashCode);
    _$hash = $jc(_$hash, clubName.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, startTime.hashCode);
    _$hash = $jc(_$hash, endTime.hashCode);
    _$hash = $jc(_$hash, submittedAt.hashCode);
    _$hash = $jc(_$hash, submittedByRole.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AdminEventRequestListItemResponseDto')
          ..add('id', id)
          ..add('title', title)
          ..add('eventType', eventType)
          ..add('clubName', clubName)
          ..add('status', status)
          ..add('startTime', startTime)
          ..add('endTime', endTime)
          ..add('submittedAt', submittedAt)
          ..add('submittedByRole', submittedByRole))
        .toString();
  }
}

class AdminEventRequestListItemResponseDtoBuilder
    implements
        Builder<AdminEventRequestListItemResponseDto,
            AdminEventRequestListItemResponseDtoBuilder> {
  _$AdminEventRequestListItemResponseDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  AdminEventRequestListItemResponseDtoEventTypeEnum? _eventType;
  AdminEventRequestListItemResponseDtoEventTypeEnum? get eventType =>
      _$this._eventType;
  set eventType(AdminEventRequestListItemResponseDtoEventTypeEnum? eventType) =>
      _$this._eventType = eventType;

  String? _clubName;
  String? get clubName => _$this._clubName;
  set clubName(String? clubName) => _$this._clubName = clubName;

  AdminEventRequestListItemResponseDtoStatusEnum? _status;
  AdminEventRequestListItemResponseDtoStatusEnum? get status => _$this._status;
  set status(AdminEventRequestListItemResponseDtoStatusEnum? status) =>
      _$this._status = status;

  DateTime? _startTime;
  DateTime? get startTime => _$this._startTime;
  set startTime(DateTime? startTime) => _$this._startTime = startTime;

  DateTime? _endTime;
  DateTime? get endTime => _$this._endTime;
  set endTime(DateTime? endTime) => _$this._endTime = endTime;

  DateTime? _submittedAt;
  DateTime? get submittedAt => _$this._submittedAt;
  set submittedAt(DateTime? submittedAt) => _$this._submittedAt = submittedAt;

  AdminEventRequestListItemResponseDtoSubmittedByRoleEnum? _submittedByRole;
  AdminEventRequestListItemResponseDtoSubmittedByRoleEnum?
      get submittedByRole => _$this._submittedByRole;
  set submittedByRole(
          AdminEventRequestListItemResponseDtoSubmittedByRoleEnum?
              submittedByRole) =>
      _$this._submittedByRole = submittedByRole;

  AdminEventRequestListItemResponseDtoBuilder() {
    AdminEventRequestListItemResponseDto._defaults(this);
  }

  AdminEventRequestListItemResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _eventType = $v.eventType;
      _clubName = $v.clubName;
      _status = $v.status;
      _startTime = $v.startTime;
      _endTime = $v.endTime;
      _submittedAt = $v.submittedAt;
      _submittedByRole = $v.submittedByRole;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AdminEventRequestListItemResponseDto other) {
    _$v = other as _$AdminEventRequestListItemResponseDto;
  }

  @override
  void update(
      void Function(AdminEventRequestListItemResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AdminEventRequestListItemResponseDto build() => _build();

  _$AdminEventRequestListItemResponseDto _build() {
    final _$result = _$v ??
        _$AdminEventRequestListItemResponseDto._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'AdminEventRequestListItemResponseDto', 'id'),
          title: BuiltValueNullFieldError.checkNotNull(
              title, r'AdminEventRequestListItemResponseDto', 'title'),
          eventType: BuiltValueNullFieldError.checkNotNull(
              eventType, r'AdminEventRequestListItemResponseDto', 'eventType'),
          clubName: BuiltValueNullFieldError.checkNotNull(
              clubName, r'AdminEventRequestListItemResponseDto', 'clubName'),
          status: BuiltValueNullFieldError.checkNotNull(
              status, r'AdminEventRequestListItemResponseDto', 'status'),
          startTime: BuiltValueNullFieldError.checkNotNull(
              startTime, r'AdminEventRequestListItemResponseDto', 'startTime'),
          endTime: BuiltValueNullFieldError.checkNotNull(
              endTime, r'AdminEventRequestListItemResponseDto', 'endTime'),
          submittedAt: BuiltValueNullFieldError.checkNotNull(submittedAt,
              r'AdminEventRequestListItemResponseDto', 'submittedAt'),
          submittedByRole: BuiltValueNullFieldError.checkNotNull(
              submittedByRole,
              r'AdminEventRequestListItemResponseDto',
              'submittedByRole'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
