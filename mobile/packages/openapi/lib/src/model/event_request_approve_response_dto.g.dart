// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_request_approve_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const EventRequestApproveResponseDtoRequestStatusEnum
    _$eventRequestApproveResponseDtoRequestStatusEnum_pending =
    const EventRequestApproveResponseDtoRequestStatusEnum._('pending');
const EventRequestApproveResponseDtoRequestStatusEnum
    _$eventRequestApproveResponseDtoRequestStatusEnum_approved =
    const EventRequestApproveResponseDtoRequestStatusEnum._('approved');
const EventRequestApproveResponseDtoRequestStatusEnum
    _$eventRequestApproveResponseDtoRequestStatusEnum_rejected =
    const EventRequestApproveResponseDtoRequestStatusEnum._('rejected');

EventRequestApproveResponseDtoRequestStatusEnum
    _$eventRequestApproveResponseDtoRequestStatusEnumValueOf(String name) {
  switch (name) {
    case 'pending':
      return _$eventRequestApproveResponseDtoRequestStatusEnum_pending;
    case 'approved':
      return _$eventRequestApproveResponseDtoRequestStatusEnum_approved;
    case 'rejected':
      return _$eventRequestApproveResponseDtoRequestStatusEnum_rejected;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<EventRequestApproveResponseDtoRequestStatusEnum>
    _$eventRequestApproveResponseDtoRequestStatusEnumValues = BuiltSet<
        EventRequestApproveResponseDtoRequestStatusEnum>(const <EventRequestApproveResponseDtoRequestStatusEnum>[
  _$eventRequestApproveResponseDtoRequestStatusEnum_pending,
  _$eventRequestApproveResponseDtoRequestStatusEnum_approved,
  _$eventRequestApproveResponseDtoRequestStatusEnum_rejected,
]);

Serializer<EventRequestApproveResponseDtoRequestStatusEnum>
    _$eventRequestApproveResponseDtoRequestStatusEnumSerializer =
    _$EventRequestApproveResponseDtoRequestStatusEnumSerializer();

class _$EventRequestApproveResponseDtoRequestStatusEnumSerializer
    implements
        PrimitiveSerializer<EventRequestApproveResponseDtoRequestStatusEnum> {
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
    EventRequestApproveResponseDtoRequestStatusEnum
  ];
  @override
  final String wireName = 'EventRequestApproveResponseDtoRequestStatusEnum';

  @override
  Object serialize(Serializers serializers,
          EventRequestApproveResponseDtoRequestStatusEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  EventRequestApproveResponseDtoRequestStatusEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      EventRequestApproveResponseDtoRequestStatusEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$EventRequestApproveResponseDto extends EventRequestApproveResponseDto {
  @override
  final String requestId;
  @override
  final EventRequestApproveResponseDtoRequestStatusEnum requestStatus;
  @override
  final PublicEventDetailResponseDto event;

  factory _$EventRequestApproveResponseDto(
          [void Function(EventRequestApproveResponseDtoBuilder)? updates]) =>
      (EventRequestApproveResponseDtoBuilder()..update(updates))._build();

  _$EventRequestApproveResponseDto._(
      {required this.requestId,
      required this.requestStatus,
      required this.event})
      : super._();
  @override
  EventRequestApproveResponseDto rebuild(
          void Function(EventRequestApproveResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EventRequestApproveResponseDtoBuilder toBuilder() =>
      EventRequestApproveResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EventRequestApproveResponseDto &&
        requestId == other.requestId &&
        requestStatus == other.requestStatus &&
        event == other.event;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, requestId.hashCode);
    _$hash = $jc(_$hash, requestStatus.hashCode);
    _$hash = $jc(_$hash, event.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EventRequestApproveResponseDto')
          ..add('requestId', requestId)
          ..add('requestStatus', requestStatus)
          ..add('event', event))
        .toString();
  }
}

class EventRequestApproveResponseDtoBuilder
    implements
        Builder<EventRequestApproveResponseDto,
            EventRequestApproveResponseDtoBuilder> {
  _$EventRequestApproveResponseDto? _$v;

  String? _requestId;
  String? get requestId => _$this._requestId;
  set requestId(String? requestId) => _$this._requestId = requestId;

  EventRequestApproveResponseDtoRequestStatusEnum? _requestStatus;
  EventRequestApproveResponseDtoRequestStatusEnum? get requestStatus =>
      _$this._requestStatus;
  set requestStatus(
          EventRequestApproveResponseDtoRequestStatusEnum? requestStatus) =>
      _$this._requestStatus = requestStatus;

  PublicEventDetailResponseDtoBuilder? _event;
  PublicEventDetailResponseDtoBuilder get event =>
      _$this._event ??= PublicEventDetailResponseDtoBuilder();
  set event(PublicEventDetailResponseDtoBuilder? event) =>
      _$this._event = event;

  EventRequestApproveResponseDtoBuilder() {
    EventRequestApproveResponseDto._defaults(this);
  }

  EventRequestApproveResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _requestId = $v.requestId;
      _requestStatus = $v.requestStatus;
      _event = $v.event.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EventRequestApproveResponseDto other) {
    _$v = other as _$EventRequestApproveResponseDto;
  }

  @override
  void update(void Function(EventRequestApproveResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EventRequestApproveResponseDto build() => _build();

  _$EventRequestApproveResponseDto _build() {
    _$EventRequestApproveResponseDto _$result;
    try {
      _$result = _$v ??
          _$EventRequestApproveResponseDto._(
            requestId: BuiltValueNullFieldError.checkNotNull(
                requestId, r'EventRequestApproveResponseDto', 'requestId'),
            requestStatus: BuiltValueNullFieldError.checkNotNull(requestStatus,
                r'EventRequestApproveResponseDto', 'requestStatus'),
            event: event.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'event';
        event.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'EventRequestApproveResponseDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
