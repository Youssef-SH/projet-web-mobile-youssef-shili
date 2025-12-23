// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'club_event_request_detail_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ClubEventRequestDetailResponseDtoEventTypeEnum
    _$clubEventRequestDetailResponseDtoEventTypeEnum_scientific =
    const ClubEventRequestDetailResponseDtoEventTypeEnum._('scientific');
const ClubEventRequestDetailResponseDtoEventTypeEnum
    _$clubEventRequestDetailResponseDtoEventTypeEnum_social =
    const ClubEventRequestDetailResponseDtoEventTypeEnum._('social');
const ClubEventRequestDetailResponseDtoEventTypeEnum
    _$clubEventRequestDetailResponseDtoEventTypeEnum_entertainment =
    const ClubEventRequestDetailResponseDtoEventTypeEnum._('entertainment');
const ClubEventRequestDetailResponseDtoEventTypeEnum
    _$clubEventRequestDetailResponseDtoEventTypeEnum_national =
    const ClubEventRequestDetailResponseDtoEventTypeEnum._('national');
const ClubEventRequestDetailResponseDtoEventTypeEnum
    _$clubEventRequestDetailResponseDtoEventTypeEnum_sports =
    const ClubEventRequestDetailResponseDtoEventTypeEnum._('sports');
const ClubEventRequestDetailResponseDtoEventTypeEnum
    _$clubEventRequestDetailResponseDtoEventTypeEnum_artistic =
    const ClubEventRequestDetailResponseDtoEventTypeEnum._('artistic');
const ClubEventRequestDetailResponseDtoEventTypeEnum
    _$clubEventRequestDetailResponseDtoEventTypeEnum_other =
    const ClubEventRequestDetailResponseDtoEventTypeEnum._('other');

ClubEventRequestDetailResponseDtoEventTypeEnum
    _$clubEventRequestDetailResponseDtoEventTypeEnumValueOf(String name) {
  switch (name) {
    case 'scientific':
      return _$clubEventRequestDetailResponseDtoEventTypeEnum_scientific;
    case 'social':
      return _$clubEventRequestDetailResponseDtoEventTypeEnum_social;
    case 'entertainment':
      return _$clubEventRequestDetailResponseDtoEventTypeEnum_entertainment;
    case 'national':
      return _$clubEventRequestDetailResponseDtoEventTypeEnum_national;
    case 'sports':
      return _$clubEventRequestDetailResponseDtoEventTypeEnum_sports;
    case 'artistic':
      return _$clubEventRequestDetailResponseDtoEventTypeEnum_artistic;
    case 'other':
      return _$clubEventRequestDetailResponseDtoEventTypeEnum_other;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ClubEventRequestDetailResponseDtoEventTypeEnum>
    _$clubEventRequestDetailResponseDtoEventTypeEnumValues = BuiltSet<
        ClubEventRequestDetailResponseDtoEventTypeEnum>(const <ClubEventRequestDetailResponseDtoEventTypeEnum>[
  _$clubEventRequestDetailResponseDtoEventTypeEnum_scientific,
  _$clubEventRequestDetailResponseDtoEventTypeEnum_social,
  _$clubEventRequestDetailResponseDtoEventTypeEnum_entertainment,
  _$clubEventRequestDetailResponseDtoEventTypeEnum_national,
  _$clubEventRequestDetailResponseDtoEventTypeEnum_sports,
  _$clubEventRequestDetailResponseDtoEventTypeEnum_artistic,
  _$clubEventRequestDetailResponseDtoEventTypeEnum_other,
]);

const ClubEventRequestDetailResponseDtoStatusEnum
    _$clubEventRequestDetailResponseDtoStatusEnum_pending =
    const ClubEventRequestDetailResponseDtoStatusEnum._('pending');
const ClubEventRequestDetailResponseDtoStatusEnum
    _$clubEventRequestDetailResponseDtoStatusEnum_approved =
    const ClubEventRequestDetailResponseDtoStatusEnum._('approved');
const ClubEventRequestDetailResponseDtoStatusEnum
    _$clubEventRequestDetailResponseDtoStatusEnum_rejected =
    const ClubEventRequestDetailResponseDtoStatusEnum._('rejected');

ClubEventRequestDetailResponseDtoStatusEnum
    _$clubEventRequestDetailResponseDtoStatusEnumValueOf(String name) {
  switch (name) {
    case 'pending':
      return _$clubEventRequestDetailResponseDtoStatusEnum_pending;
    case 'approved':
      return _$clubEventRequestDetailResponseDtoStatusEnum_approved;
    case 'rejected':
      return _$clubEventRequestDetailResponseDtoStatusEnum_rejected;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ClubEventRequestDetailResponseDtoStatusEnum>
    _$clubEventRequestDetailResponseDtoStatusEnumValues = BuiltSet<
        ClubEventRequestDetailResponseDtoStatusEnum>(const <ClubEventRequestDetailResponseDtoStatusEnum>[
  _$clubEventRequestDetailResponseDtoStatusEnum_pending,
  _$clubEventRequestDetailResponseDtoStatusEnum_approved,
  _$clubEventRequestDetailResponseDtoStatusEnum_rejected,
]);

Serializer<ClubEventRequestDetailResponseDtoEventTypeEnum>
    _$clubEventRequestDetailResponseDtoEventTypeEnumSerializer =
    _$ClubEventRequestDetailResponseDtoEventTypeEnumSerializer();
Serializer<ClubEventRequestDetailResponseDtoStatusEnum>
    _$clubEventRequestDetailResponseDtoStatusEnumSerializer =
    _$ClubEventRequestDetailResponseDtoStatusEnumSerializer();

class _$ClubEventRequestDetailResponseDtoEventTypeEnumSerializer
    implements
        PrimitiveSerializer<ClubEventRequestDetailResponseDtoEventTypeEnum> {
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
    ClubEventRequestDetailResponseDtoEventTypeEnum
  ];
  @override
  final String wireName = 'ClubEventRequestDetailResponseDtoEventTypeEnum';

  @override
  Object serialize(Serializers serializers,
          ClubEventRequestDetailResponseDtoEventTypeEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ClubEventRequestDetailResponseDtoEventTypeEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ClubEventRequestDetailResponseDtoEventTypeEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$ClubEventRequestDetailResponseDtoStatusEnumSerializer
    implements
        PrimitiveSerializer<ClubEventRequestDetailResponseDtoStatusEnum> {
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
    ClubEventRequestDetailResponseDtoStatusEnum
  ];
  @override
  final String wireName = 'ClubEventRequestDetailResponseDtoStatusEnum';

  @override
  Object serialize(Serializers serializers,
          ClubEventRequestDetailResponseDtoStatusEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ClubEventRequestDetailResponseDtoStatusEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ClubEventRequestDetailResponseDtoStatusEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$ClubEventRequestDetailResponseDto
    extends ClubEventRequestDetailResponseDto {
  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final ClubEventRequestDetailResponseDtoEventTypeEnum eventType;
  @override
  final DateTime startTime;
  @override
  final DateTime endTime;
  @override
  final JsonObject? roomId;
  @override
  final JsonObject? externalAddress;
  @override
  final ClubEventRequestDetailResponseDtoStatusEnum status;
  @override
  final JsonObject? adminComment;
  @override
  final JsonObject submittedBy;
  @override
  final DateTime submittedAt;

  factory _$ClubEventRequestDetailResponseDto(
          [void Function(ClubEventRequestDetailResponseDtoBuilder)? updates]) =>
      (ClubEventRequestDetailResponseDtoBuilder()..update(updates))._build();

  _$ClubEventRequestDetailResponseDto._(
      {required this.id,
      required this.title,
      required this.description,
      required this.eventType,
      required this.startTime,
      required this.endTime,
      this.roomId,
      this.externalAddress,
      required this.status,
      this.adminComment,
      required this.submittedBy,
      required this.submittedAt})
      : super._();
  @override
  ClubEventRequestDetailResponseDto rebuild(
          void Function(ClubEventRequestDetailResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClubEventRequestDetailResponseDtoBuilder toBuilder() =>
      ClubEventRequestDetailResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClubEventRequestDetailResponseDto &&
        id == other.id &&
        title == other.title &&
        description == other.description &&
        eventType == other.eventType &&
        startTime == other.startTime &&
        endTime == other.endTime &&
        roomId == other.roomId &&
        externalAddress == other.externalAddress &&
        status == other.status &&
        adminComment == other.adminComment &&
        submittedBy == other.submittedBy &&
        submittedAt == other.submittedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, eventType.hashCode);
    _$hash = $jc(_$hash, startTime.hashCode);
    _$hash = $jc(_$hash, endTime.hashCode);
    _$hash = $jc(_$hash, roomId.hashCode);
    _$hash = $jc(_$hash, externalAddress.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, adminComment.hashCode);
    _$hash = $jc(_$hash, submittedBy.hashCode);
    _$hash = $jc(_$hash, submittedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ClubEventRequestDetailResponseDto')
          ..add('id', id)
          ..add('title', title)
          ..add('description', description)
          ..add('eventType', eventType)
          ..add('startTime', startTime)
          ..add('endTime', endTime)
          ..add('roomId', roomId)
          ..add('externalAddress', externalAddress)
          ..add('status', status)
          ..add('adminComment', adminComment)
          ..add('submittedBy', submittedBy)
          ..add('submittedAt', submittedAt))
        .toString();
  }
}

class ClubEventRequestDetailResponseDtoBuilder
    implements
        Builder<ClubEventRequestDetailResponseDto,
            ClubEventRequestDetailResponseDtoBuilder> {
  _$ClubEventRequestDetailResponseDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  ClubEventRequestDetailResponseDtoEventTypeEnum? _eventType;
  ClubEventRequestDetailResponseDtoEventTypeEnum? get eventType =>
      _$this._eventType;
  set eventType(ClubEventRequestDetailResponseDtoEventTypeEnum? eventType) =>
      _$this._eventType = eventType;

  DateTime? _startTime;
  DateTime? get startTime => _$this._startTime;
  set startTime(DateTime? startTime) => _$this._startTime = startTime;

  DateTime? _endTime;
  DateTime? get endTime => _$this._endTime;
  set endTime(DateTime? endTime) => _$this._endTime = endTime;

  JsonObject? _roomId;
  JsonObject? get roomId => _$this._roomId;
  set roomId(JsonObject? roomId) => _$this._roomId = roomId;

  JsonObject? _externalAddress;
  JsonObject? get externalAddress => _$this._externalAddress;
  set externalAddress(JsonObject? externalAddress) =>
      _$this._externalAddress = externalAddress;

  ClubEventRequestDetailResponseDtoStatusEnum? _status;
  ClubEventRequestDetailResponseDtoStatusEnum? get status => _$this._status;
  set status(ClubEventRequestDetailResponseDtoStatusEnum? status) =>
      _$this._status = status;

  JsonObject? _adminComment;
  JsonObject? get adminComment => _$this._adminComment;
  set adminComment(JsonObject? adminComment) =>
      _$this._adminComment = adminComment;

  JsonObject? _submittedBy;
  JsonObject? get submittedBy => _$this._submittedBy;
  set submittedBy(JsonObject? submittedBy) => _$this._submittedBy = submittedBy;

  DateTime? _submittedAt;
  DateTime? get submittedAt => _$this._submittedAt;
  set submittedAt(DateTime? submittedAt) => _$this._submittedAt = submittedAt;

  ClubEventRequestDetailResponseDtoBuilder() {
    ClubEventRequestDetailResponseDto._defaults(this);
  }

  ClubEventRequestDetailResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _description = $v.description;
      _eventType = $v.eventType;
      _startTime = $v.startTime;
      _endTime = $v.endTime;
      _roomId = $v.roomId;
      _externalAddress = $v.externalAddress;
      _status = $v.status;
      _adminComment = $v.adminComment;
      _submittedBy = $v.submittedBy;
      _submittedAt = $v.submittedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ClubEventRequestDetailResponseDto other) {
    _$v = other as _$ClubEventRequestDetailResponseDto;
  }

  @override
  void update(
      void Function(ClubEventRequestDetailResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClubEventRequestDetailResponseDto build() => _build();

  _$ClubEventRequestDetailResponseDto _build() {
    final _$result = _$v ??
        _$ClubEventRequestDetailResponseDto._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'ClubEventRequestDetailResponseDto', 'id'),
          title: BuiltValueNullFieldError.checkNotNull(
              title, r'ClubEventRequestDetailResponseDto', 'title'),
          description: BuiltValueNullFieldError.checkNotNull(
              description, r'ClubEventRequestDetailResponseDto', 'description'),
          eventType: BuiltValueNullFieldError.checkNotNull(
              eventType, r'ClubEventRequestDetailResponseDto', 'eventType'),
          startTime: BuiltValueNullFieldError.checkNotNull(
              startTime, r'ClubEventRequestDetailResponseDto', 'startTime'),
          endTime: BuiltValueNullFieldError.checkNotNull(
              endTime, r'ClubEventRequestDetailResponseDto', 'endTime'),
          roomId: roomId,
          externalAddress: externalAddress,
          status: BuiltValueNullFieldError.checkNotNull(
              status, r'ClubEventRequestDetailResponseDto', 'status'),
          adminComment: adminComment,
          submittedBy: BuiltValueNullFieldError.checkNotNull(
              submittedBy, r'ClubEventRequestDetailResponseDto', 'submittedBy'),
          submittedAt: BuiltValueNullFieldError.checkNotNull(
              submittedAt, r'ClubEventRequestDetailResponseDto', 'submittedAt'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
