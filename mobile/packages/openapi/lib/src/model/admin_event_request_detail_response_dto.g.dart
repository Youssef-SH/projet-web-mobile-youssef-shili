// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_event_request_detail_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const AdminEventRequestDetailResponseDtoEventTypeEnum
    _$adminEventRequestDetailResponseDtoEventTypeEnum_scientific =
    const AdminEventRequestDetailResponseDtoEventTypeEnum._('scientific');
const AdminEventRequestDetailResponseDtoEventTypeEnum
    _$adminEventRequestDetailResponseDtoEventTypeEnum_social =
    const AdminEventRequestDetailResponseDtoEventTypeEnum._('social');
const AdminEventRequestDetailResponseDtoEventTypeEnum
    _$adminEventRequestDetailResponseDtoEventTypeEnum_entertainment =
    const AdminEventRequestDetailResponseDtoEventTypeEnum._('entertainment');
const AdminEventRequestDetailResponseDtoEventTypeEnum
    _$adminEventRequestDetailResponseDtoEventTypeEnum_national =
    const AdminEventRequestDetailResponseDtoEventTypeEnum._('national');
const AdminEventRequestDetailResponseDtoEventTypeEnum
    _$adminEventRequestDetailResponseDtoEventTypeEnum_sports =
    const AdminEventRequestDetailResponseDtoEventTypeEnum._('sports');
const AdminEventRequestDetailResponseDtoEventTypeEnum
    _$adminEventRequestDetailResponseDtoEventTypeEnum_artistic =
    const AdminEventRequestDetailResponseDtoEventTypeEnum._('artistic');
const AdminEventRequestDetailResponseDtoEventTypeEnum
    _$adminEventRequestDetailResponseDtoEventTypeEnum_other =
    const AdminEventRequestDetailResponseDtoEventTypeEnum._('other');

AdminEventRequestDetailResponseDtoEventTypeEnum
    _$adminEventRequestDetailResponseDtoEventTypeEnumValueOf(String name) {
  switch (name) {
    case 'scientific':
      return _$adminEventRequestDetailResponseDtoEventTypeEnum_scientific;
    case 'social':
      return _$adminEventRequestDetailResponseDtoEventTypeEnum_social;
    case 'entertainment':
      return _$adminEventRequestDetailResponseDtoEventTypeEnum_entertainment;
    case 'national':
      return _$adminEventRequestDetailResponseDtoEventTypeEnum_national;
    case 'sports':
      return _$adminEventRequestDetailResponseDtoEventTypeEnum_sports;
    case 'artistic':
      return _$adminEventRequestDetailResponseDtoEventTypeEnum_artistic;
    case 'other':
      return _$adminEventRequestDetailResponseDtoEventTypeEnum_other;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<AdminEventRequestDetailResponseDtoEventTypeEnum>
    _$adminEventRequestDetailResponseDtoEventTypeEnumValues = BuiltSet<
        AdminEventRequestDetailResponseDtoEventTypeEnum>(const <AdminEventRequestDetailResponseDtoEventTypeEnum>[
  _$adminEventRequestDetailResponseDtoEventTypeEnum_scientific,
  _$adminEventRequestDetailResponseDtoEventTypeEnum_social,
  _$adminEventRequestDetailResponseDtoEventTypeEnum_entertainment,
  _$adminEventRequestDetailResponseDtoEventTypeEnum_national,
  _$adminEventRequestDetailResponseDtoEventTypeEnum_sports,
  _$adminEventRequestDetailResponseDtoEventTypeEnum_artistic,
  _$adminEventRequestDetailResponseDtoEventTypeEnum_other,
]);

const AdminEventRequestDetailResponseDtoStatusEnum
    _$adminEventRequestDetailResponseDtoStatusEnum_pending =
    const AdminEventRequestDetailResponseDtoStatusEnum._('pending');
const AdminEventRequestDetailResponseDtoStatusEnum
    _$adminEventRequestDetailResponseDtoStatusEnum_approved =
    const AdminEventRequestDetailResponseDtoStatusEnum._('approved');
const AdminEventRequestDetailResponseDtoStatusEnum
    _$adminEventRequestDetailResponseDtoStatusEnum_rejected =
    const AdminEventRequestDetailResponseDtoStatusEnum._('rejected');

AdminEventRequestDetailResponseDtoStatusEnum
    _$adminEventRequestDetailResponseDtoStatusEnumValueOf(String name) {
  switch (name) {
    case 'pending':
      return _$adminEventRequestDetailResponseDtoStatusEnum_pending;
    case 'approved':
      return _$adminEventRequestDetailResponseDtoStatusEnum_approved;
    case 'rejected':
      return _$adminEventRequestDetailResponseDtoStatusEnum_rejected;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<AdminEventRequestDetailResponseDtoStatusEnum>
    _$adminEventRequestDetailResponseDtoStatusEnumValues = BuiltSet<
        AdminEventRequestDetailResponseDtoStatusEnum>(const <AdminEventRequestDetailResponseDtoStatusEnum>[
  _$adminEventRequestDetailResponseDtoStatusEnum_pending,
  _$adminEventRequestDetailResponseDtoStatusEnum_approved,
  _$adminEventRequestDetailResponseDtoStatusEnum_rejected,
]);

Serializer<AdminEventRequestDetailResponseDtoEventTypeEnum>
    _$adminEventRequestDetailResponseDtoEventTypeEnumSerializer =
    _$AdminEventRequestDetailResponseDtoEventTypeEnumSerializer();
Serializer<AdminEventRequestDetailResponseDtoStatusEnum>
    _$adminEventRequestDetailResponseDtoStatusEnumSerializer =
    _$AdminEventRequestDetailResponseDtoStatusEnumSerializer();

class _$AdminEventRequestDetailResponseDtoEventTypeEnumSerializer
    implements
        PrimitiveSerializer<AdminEventRequestDetailResponseDtoEventTypeEnum> {
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
    AdminEventRequestDetailResponseDtoEventTypeEnum
  ];
  @override
  final String wireName = 'AdminEventRequestDetailResponseDtoEventTypeEnum';

  @override
  Object serialize(Serializers serializers,
          AdminEventRequestDetailResponseDtoEventTypeEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  AdminEventRequestDetailResponseDtoEventTypeEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      AdminEventRequestDetailResponseDtoEventTypeEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$AdminEventRequestDetailResponseDtoStatusEnumSerializer
    implements
        PrimitiveSerializer<AdminEventRequestDetailResponseDtoStatusEnum> {
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
    AdminEventRequestDetailResponseDtoStatusEnum
  ];
  @override
  final String wireName = 'AdminEventRequestDetailResponseDtoStatusEnum';

  @override
  Object serialize(Serializers serializers,
          AdminEventRequestDetailResponseDtoStatusEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  AdminEventRequestDetailResponseDtoStatusEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      AdminEventRequestDetailResponseDtoStatusEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$AdminEventRequestDetailResponseDto
    extends AdminEventRequestDetailResponseDto {
  @override
  final String id;
  @override
  final String clubId;
  @override
  final JsonObject submittedBy;
  @override
  final String title;
  @override
  final String description;
  @override
  final AdminEventRequestDetailResponseDtoEventTypeEnum eventType;
  @override
  final DateTime startTime;
  @override
  final DateTime endTime;
  @override
  final num expectedStudents;
  @override
  final JsonObject? roomId;
  @override
  final JsonObject? externalAddress;
  @override
  final AdminEventRequestDetailResponseDtoStatusEnum status;
  @override
  final JsonObject? adminComment;
  @override
  final DateTime submittedAt;
  @override
  final BuiltList<AnnexViewDto> annexes;

  factory _$AdminEventRequestDetailResponseDto(
          [void Function(AdminEventRequestDetailResponseDtoBuilder)?
              updates]) =>
      (AdminEventRequestDetailResponseDtoBuilder()..update(updates))._build();

  _$AdminEventRequestDetailResponseDto._(
      {required this.id,
      required this.clubId,
      required this.submittedBy,
      required this.title,
      required this.description,
      required this.eventType,
      required this.startTime,
      required this.endTime,
      required this.expectedStudents,
      this.roomId,
      this.externalAddress,
      required this.status,
      this.adminComment,
      required this.submittedAt,
      required this.annexes})
      : super._();
  @override
  AdminEventRequestDetailResponseDto rebuild(
          void Function(AdminEventRequestDetailResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AdminEventRequestDetailResponseDtoBuilder toBuilder() =>
      AdminEventRequestDetailResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AdminEventRequestDetailResponseDto &&
        id == other.id &&
        clubId == other.clubId &&
        submittedBy == other.submittedBy &&
        title == other.title &&
        description == other.description &&
        eventType == other.eventType &&
        startTime == other.startTime &&
        endTime == other.endTime &&
        expectedStudents == other.expectedStudents &&
        roomId == other.roomId &&
        externalAddress == other.externalAddress &&
        status == other.status &&
        adminComment == other.adminComment &&
        submittedAt == other.submittedAt &&
        annexes == other.annexes;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, clubId.hashCode);
    _$hash = $jc(_$hash, submittedBy.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, eventType.hashCode);
    _$hash = $jc(_$hash, startTime.hashCode);
    _$hash = $jc(_$hash, endTime.hashCode);
    _$hash = $jc(_$hash, expectedStudents.hashCode);
    _$hash = $jc(_$hash, roomId.hashCode);
    _$hash = $jc(_$hash, externalAddress.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, adminComment.hashCode);
    _$hash = $jc(_$hash, submittedAt.hashCode);
    _$hash = $jc(_$hash, annexes.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AdminEventRequestDetailResponseDto')
          ..add('id', id)
          ..add('clubId', clubId)
          ..add('submittedBy', submittedBy)
          ..add('title', title)
          ..add('description', description)
          ..add('eventType', eventType)
          ..add('startTime', startTime)
          ..add('endTime', endTime)
          ..add('expectedStudents', expectedStudents)
          ..add('roomId', roomId)
          ..add('externalAddress', externalAddress)
          ..add('status', status)
          ..add('adminComment', adminComment)
          ..add('submittedAt', submittedAt)
          ..add('annexes', annexes))
        .toString();
  }
}

class AdminEventRequestDetailResponseDtoBuilder
    implements
        Builder<AdminEventRequestDetailResponseDto,
            AdminEventRequestDetailResponseDtoBuilder> {
  _$AdminEventRequestDetailResponseDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _clubId;
  String? get clubId => _$this._clubId;
  set clubId(String? clubId) => _$this._clubId = clubId;

  JsonObject? _submittedBy;
  JsonObject? get submittedBy => _$this._submittedBy;
  set submittedBy(JsonObject? submittedBy) => _$this._submittedBy = submittedBy;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  AdminEventRequestDetailResponseDtoEventTypeEnum? _eventType;
  AdminEventRequestDetailResponseDtoEventTypeEnum? get eventType =>
      _$this._eventType;
  set eventType(AdminEventRequestDetailResponseDtoEventTypeEnum? eventType) =>
      _$this._eventType = eventType;

  DateTime? _startTime;
  DateTime? get startTime => _$this._startTime;
  set startTime(DateTime? startTime) => _$this._startTime = startTime;

  DateTime? _endTime;
  DateTime? get endTime => _$this._endTime;
  set endTime(DateTime? endTime) => _$this._endTime = endTime;

  num? _expectedStudents;
  num? get expectedStudents => _$this._expectedStudents;
  set expectedStudents(num? expectedStudents) =>
      _$this._expectedStudents = expectedStudents;

  JsonObject? _roomId;
  JsonObject? get roomId => _$this._roomId;
  set roomId(JsonObject? roomId) => _$this._roomId = roomId;

  JsonObject? _externalAddress;
  JsonObject? get externalAddress => _$this._externalAddress;
  set externalAddress(JsonObject? externalAddress) =>
      _$this._externalAddress = externalAddress;

  AdminEventRequestDetailResponseDtoStatusEnum? _status;
  AdminEventRequestDetailResponseDtoStatusEnum? get status => _$this._status;
  set status(AdminEventRequestDetailResponseDtoStatusEnum? status) =>
      _$this._status = status;

  JsonObject? _adminComment;
  JsonObject? get adminComment => _$this._adminComment;
  set adminComment(JsonObject? adminComment) =>
      _$this._adminComment = adminComment;

  DateTime? _submittedAt;
  DateTime? get submittedAt => _$this._submittedAt;
  set submittedAt(DateTime? submittedAt) => _$this._submittedAt = submittedAt;

  ListBuilder<AnnexViewDto>? _annexes;
  ListBuilder<AnnexViewDto> get annexes =>
      _$this._annexes ??= ListBuilder<AnnexViewDto>();
  set annexes(ListBuilder<AnnexViewDto>? annexes) => _$this._annexes = annexes;

  AdminEventRequestDetailResponseDtoBuilder() {
    AdminEventRequestDetailResponseDto._defaults(this);
  }

  AdminEventRequestDetailResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _clubId = $v.clubId;
      _submittedBy = $v.submittedBy;
      _title = $v.title;
      _description = $v.description;
      _eventType = $v.eventType;
      _startTime = $v.startTime;
      _endTime = $v.endTime;
      _expectedStudents = $v.expectedStudents;
      _roomId = $v.roomId;
      _externalAddress = $v.externalAddress;
      _status = $v.status;
      _adminComment = $v.adminComment;
      _submittedAt = $v.submittedAt;
      _annexes = $v.annexes.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AdminEventRequestDetailResponseDto other) {
    _$v = other as _$AdminEventRequestDetailResponseDto;
  }

  @override
  void update(
      void Function(AdminEventRequestDetailResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AdminEventRequestDetailResponseDto build() => _build();

  _$AdminEventRequestDetailResponseDto _build() {
    _$AdminEventRequestDetailResponseDto _$result;
    try {
      _$result = _$v ??
          _$AdminEventRequestDetailResponseDto._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'AdminEventRequestDetailResponseDto', 'id'),
            clubId: BuiltValueNullFieldError.checkNotNull(
                clubId, r'AdminEventRequestDetailResponseDto', 'clubId'),
            submittedBy: BuiltValueNullFieldError.checkNotNull(submittedBy,
                r'AdminEventRequestDetailResponseDto', 'submittedBy'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'AdminEventRequestDetailResponseDto', 'title'),
            description: BuiltValueNullFieldError.checkNotNull(description,
                r'AdminEventRequestDetailResponseDto', 'description'),
            eventType: BuiltValueNullFieldError.checkNotNull(
                eventType, r'AdminEventRequestDetailResponseDto', 'eventType'),
            startTime: BuiltValueNullFieldError.checkNotNull(
                startTime, r'AdminEventRequestDetailResponseDto', 'startTime'),
            endTime: BuiltValueNullFieldError.checkNotNull(
                endTime, r'AdminEventRequestDetailResponseDto', 'endTime'),
            expectedStudents: BuiltValueNullFieldError.checkNotNull(
                expectedStudents,
                r'AdminEventRequestDetailResponseDto',
                'expectedStudents'),
            roomId: roomId,
            externalAddress: externalAddress,
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'AdminEventRequestDetailResponseDto', 'status'),
            adminComment: adminComment,
            submittedAt: BuiltValueNullFieldError.checkNotNull(submittedAt,
                r'AdminEventRequestDetailResponseDto', 'submittedAt'),
            annexes: annexes.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'annexes';
        annexes.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AdminEventRequestDetailResponseDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
