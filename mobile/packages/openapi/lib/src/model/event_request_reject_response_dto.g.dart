// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_request_reject_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const EventRequestRejectResponseDtoStatusEnum
    _$eventRequestRejectResponseDtoStatusEnum_pending =
    const EventRequestRejectResponseDtoStatusEnum._('pending');
const EventRequestRejectResponseDtoStatusEnum
    _$eventRequestRejectResponseDtoStatusEnum_approved =
    const EventRequestRejectResponseDtoStatusEnum._('approved');
const EventRequestRejectResponseDtoStatusEnum
    _$eventRequestRejectResponseDtoStatusEnum_rejected =
    const EventRequestRejectResponseDtoStatusEnum._('rejected');

EventRequestRejectResponseDtoStatusEnum
    _$eventRequestRejectResponseDtoStatusEnumValueOf(String name) {
  switch (name) {
    case 'pending':
      return _$eventRequestRejectResponseDtoStatusEnum_pending;
    case 'approved':
      return _$eventRequestRejectResponseDtoStatusEnum_approved;
    case 'rejected':
      return _$eventRequestRejectResponseDtoStatusEnum_rejected;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<EventRequestRejectResponseDtoStatusEnum>
    _$eventRequestRejectResponseDtoStatusEnumValues = BuiltSet<
        EventRequestRejectResponseDtoStatusEnum>(const <EventRequestRejectResponseDtoStatusEnum>[
  _$eventRequestRejectResponseDtoStatusEnum_pending,
  _$eventRequestRejectResponseDtoStatusEnum_approved,
  _$eventRequestRejectResponseDtoStatusEnum_rejected,
]);

Serializer<EventRequestRejectResponseDtoStatusEnum>
    _$eventRequestRejectResponseDtoStatusEnumSerializer =
    _$EventRequestRejectResponseDtoStatusEnumSerializer();

class _$EventRequestRejectResponseDtoStatusEnumSerializer
    implements PrimitiveSerializer<EventRequestRejectResponseDtoStatusEnum> {
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
    EventRequestRejectResponseDtoStatusEnum
  ];
  @override
  final String wireName = 'EventRequestRejectResponseDtoStatusEnum';

  @override
  Object serialize(Serializers serializers,
          EventRequestRejectResponseDtoStatusEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  EventRequestRejectResponseDtoStatusEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      EventRequestRejectResponseDtoStatusEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$EventRequestRejectResponseDto extends EventRequestRejectResponseDto {
  @override
  final String id;
  @override
  final EventRequestRejectResponseDtoStatusEnum status;
  @override
  final String adminComment;

  factory _$EventRequestRejectResponseDto(
          [void Function(EventRequestRejectResponseDtoBuilder)? updates]) =>
      (EventRequestRejectResponseDtoBuilder()..update(updates))._build();

  _$EventRequestRejectResponseDto._(
      {required this.id, required this.status, required this.adminComment})
      : super._();
  @override
  EventRequestRejectResponseDto rebuild(
          void Function(EventRequestRejectResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EventRequestRejectResponseDtoBuilder toBuilder() =>
      EventRequestRejectResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EventRequestRejectResponseDto &&
        id == other.id &&
        status == other.status &&
        adminComment == other.adminComment;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, adminComment.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EventRequestRejectResponseDto')
          ..add('id', id)
          ..add('status', status)
          ..add('adminComment', adminComment))
        .toString();
  }
}

class EventRequestRejectResponseDtoBuilder
    implements
        Builder<EventRequestRejectResponseDto,
            EventRequestRejectResponseDtoBuilder> {
  _$EventRequestRejectResponseDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  EventRequestRejectResponseDtoStatusEnum? _status;
  EventRequestRejectResponseDtoStatusEnum? get status => _$this._status;
  set status(EventRequestRejectResponseDtoStatusEnum? status) =>
      _$this._status = status;

  String? _adminComment;
  String? get adminComment => _$this._adminComment;
  set adminComment(String? adminComment) => _$this._adminComment = adminComment;

  EventRequestRejectResponseDtoBuilder() {
    EventRequestRejectResponseDto._defaults(this);
  }

  EventRequestRejectResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _status = $v.status;
      _adminComment = $v.adminComment;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EventRequestRejectResponseDto other) {
    _$v = other as _$EventRequestRejectResponseDto;
  }

  @override
  void update(void Function(EventRequestRejectResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EventRequestRejectResponseDto build() => _build();

  _$EventRequestRejectResponseDto _build() {
    final _$result = _$v ??
        _$EventRequestRejectResponseDto._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'EventRequestRejectResponseDto', 'id'),
          status: BuiltValueNullFieldError.checkNotNull(
              status, r'EventRequestRejectResponseDto', 'status'),
          adminComment: BuiltValueNullFieldError.checkNotNull(
              adminComment, r'EventRequestRejectResponseDto', 'adminComment'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
