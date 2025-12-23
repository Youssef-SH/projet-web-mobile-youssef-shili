// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'club_event_request_list_item_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ClubEventRequestListItemResponseDtoStatusEnum
    _$clubEventRequestListItemResponseDtoStatusEnum_pending =
    const ClubEventRequestListItemResponseDtoStatusEnum._('pending');
const ClubEventRequestListItemResponseDtoStatusEnum
    _$clubEventRequestListItemResponseDtoStatusEnum_approved =
    const ClubEventRequestListItemResponseDtoStatusEnum._('approved');
const ClubEventRequestListItemResponseDtoStatusEnum
    _$clubEventRequestListItemResponseDtoStatusEnum_rejected =
    const ClubEventRequestListItemResponseDtoStatusEnum._('rejected');

ClubEventRequestListItemResponseDtoStatusEnum
    _$clubEventRequestListItemResponseDtoStatusEnumValueOf(String name) {
  switch (name) {
    case 'pending':
      return _$clubEventRequestListItemResponseDtoStatusEnum_pending;
    case 'approved':
      return _$clubEventRequestListItemResponseDtoStatusEnum_approved;
    case 'rejected':
      return _$clubEventRequestListItemResponseDtoStatusEnum_rejected;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ClubEventRequestListItemResponseDtoStatusEnum>
    _$clubEventRequestListItemResponseDtoStatusEnumValues = BuiltSet<
        ClubEventRequestListItemResponseDtoStatusEnum>(const <ClubEventRequestListItemResponseDtoStatusEnum>[
  _$clubEventRequestListItemResponseDtoStatusEnum_pending,
  _$clubEventRequestListItemResponseDtoStatusEnum_approved,
  _$clubEventRequestListItemResponseDtoStatusEnum_rejected,
]);

Serializer<ClubEventRequestListItemResponseDtoStatusEnum>
    _$clubEventRequestListItemResponseDtoStatusEnumSerializer =
    _$ClubEventRequestListItemResponseDtoStatusEnumSerializer();

class _$ClubEventRequestListItemResponseDtoStatusEnumSerializer
    implements
        PrimitiveSerializer<ClubEventRequestListItemResponseDtoStatusEnum> {
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
    ClubEventRequestListItemResponseDtoStatusEnum
  ];
  @override
  final String wireName = 'ClubEventRequestListItemResponseDtoStatusEnum';

  @override
  Object serialize(Serializers serializers,
          ClubEventRequestListItemResponseDtoStatusEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ClubEventRequestListItemResponseDtoStatusEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ClubEventRequestListItemResponseDtoStatusEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$ClubEventRequestListItemResponseDto
    extends ClubEventRequestListItemResponseDto {
  @override
  final String id;
  @override
  final String title;
  @override
  final ClubEventRequestListItemResponseDtoStatusEnum status;
  @override
  final DateTime startTime;
  @override
  final DateTime endTime;
  @override
  final String location;

  factory _$ClubEventRequestListItemResponseDto(
          [void Function(ClubEventRequestListItemResponseDtoBuilder)?
              updates]) =>
      (ClubEventRequestListItemResponseDtoBuilder()..update(updates))._build();

  _$ClubEventRequestListItemResponseDto._(
      {required this.id,
      required this.title,
      required this.status,
      required this.startTime,
      required this.endTime,
      required this.location})
      : super._();
  @override
  ClubEventRequestListItemResponseDto rebuild(
          void Function(ClubEventRequestListItemResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClubEventRequestListItemResponseDtoBuilder toBuilder() =>
      ClubEventRequestListItemResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClubEventRequestListItemResponseDto &&
        id == other.id &&
        title == other.title &&
        status == other.status &&
        startTime == other.startTime &&
        endTime == other.endTime &&
        location == other.location;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, startTime.hashCode);
    _$hash = $jc(_$hash, endTime.hashCode);
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ClubEventRequestListItemResponseDto')
          ..add('id', id)
          ..add('title', title)
          ..add('status', status)
          ..add('startTime', startTime)
          ..add('endTime', endTime)
          ..add('location', location))
        .toString();
  }
}

class ClubEventRequestListItemResponseDtoBuilder
    implements
        Builder<ClubEventRequestListItemResponseDto,
            ClubEventRequestListItemResponseDtoBuilder> {
  _$ClubEventRequestListItemResponseDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  ClubEventRequestListItemResponseDtoStatusEnum? _status;
  ClubEventRequestListItemResponseDtoStatusEnum? get status => _$this._status;
  set status(ClubEventRequestListItemResponseDtoStatusEnum? status) =>
      _$this._status = status;

  DateTime? _startTime;
  DateTime? get startTime => _$this._startTime;
  set startTime(DateTime? startTime) => _$this._startTime = startTime;

  DateTime? _endTime;
  DateTime? get endTime => _$this._endTime;
  set endTime(DateTime? endTime) => _$this._endTime = endTime;

  String? _location;
  String? get location => _$this._location;
  set location(String? location) => _$this._location = location;

  ClubEventRequestListItemResponseDtoBuilder() {
    ClubEventRequestListItemResponseDto._defaults(this);
  }

  ClubEventRequestListItemResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _status = $v.status;
      _startTime = $v.startTime;
      _endTime = $v.endTime;
      _location = $v.location;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ClubEventRequestListItemResponseDto other) {
    _$v = other as _$ClubEventRequestListItemResponseDto;
  }

  @override
  void update(
      void Function(ClubEventRequestListItemResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClubEventRequestListItemResponseDto build() => _build();

  _$ClubEventRequestListItemResponseDto _build() {
    final _$result = _$v ??
        _$ClubEventRequestListItemResponseDto._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'ClubEventRequestListItemResponseDto', 'id'),
          title: BuiltValueNullFieldError.checkNotNull(
              title, r'ClubEventRequestListItemResponseDto', 'title'),
          status: BuiltValueNullFieldError.checkNotNull(
              status, r'ClubEventRequestListItemResponseDto', 'status'),
          startTime: BuiltValueNullFieldError.checkNotNull(
              startTime, r'ClubEventRequestListItemResponseDto', 'startTime'),
          endTime: BuiltValueNullFieldError.checkNotNull(
              endTime, r'ClubEventRequestListItemResponseDto', 'endTime'),
          location: BuiltValueNullFieldError.checkNotNull(
              location, r'ClubEventRequestListItemResponseDto', 'location'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
