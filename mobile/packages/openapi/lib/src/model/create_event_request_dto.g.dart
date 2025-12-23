// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_event_request_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const CreateEventRequestDtoEventTypeEnum
    _$createEventRequestDtoEventTypeEnum_scientific =
    const CreateEventRequestDtoEventTypeEnum._('scientific');
const CreateEventRequestDtoEventTypeEnum
    _$createEventRequestDtoEventTypeEnum_social =
    const CreateEventRequestDtoEventTypeEnum._('social');
const CreateEventRequestDtoEventTypeEnum
    _$createEventRequestDtoEventTypeEnum_entertainment =
    const CreateEventRequestDtoEventTypeEnum._('entertainment');
const CreateEventRequestDtoEventTypeEnum
    _$createEventRequestDtoEventTypeEnum_national =
    const CreateEventRequestDtoEventTypeEnum._('national');
const CreateEventRequestDtoEventTypeEnum
    _$createEventRequestDtoEventTypeEnum_sports =
    const CreateEventRequestDtoEventTypeEnum._('sports');
const CreateEventRequestDtoEventTypeEnum
    _$createEventRequestDtoEventTypeEnum_artistic =
    const CreateEventRequestDtoEventTypeEnum._('artistic');
const CreateEventRequestDtoEventTypeEnum
    _$createEventRequestDtoEventTypeEnum_other =
    const CreateEventRequestDtoEventTypeEnum._('other');

CreateEventRequestDtoEventTypeEnum _$createEventRequestDtoEventTypeEnumValueOf(
    String name) {
  switch (name) {
    case 'scientific':
      return _$createEventRequestDtoEventTypeEnum_scientific;
    case 'social':
      return _$createEventRequestDtoEventTypeEnum_social;
    case 'entertainment':
      return _$createEventRequestDtoEventTypeEnum_entertainment;
    case 'national':
      return _$createEventRequestDtoEventTypeEnum_national;
    case 'sports':
      return _$createEventRequestDtoEventTypeEnum_sports;
    case 'artistic':
      return _$createEventRequestDtoEventTypeEnum_artistic;
    case 'other':
      return _$createEventRequestDtoEventTypeEnum_other;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<CreateEventRequestDtoEventTypeEnum>
    _$createEventRequestDtoEventTypeEnumValues = BuiltSet<
        CreateEventRequestDtoEventTypeEnum>(const <CreateEventRequestDtoEventTypeEnum>[
  _$createEventRequestDtoEventTypeEnum_scientific,
  _$createEventRequestDtoEventTypeEnum_social,
  _$createEventRequestDtoEventTypeEnum_entertainment,
  _$createEventRequestDtoEventTypeEnum_national,
  _$createEventRequestDtoEventTypeEnum_sports,
  _$createEventRequestDtoEventTypeEnum_artistic,
  _$createEventRequestDtoEventTypeEnum_other,
]);

Serializer<CreateEventRequestDtoEventTypeEnum>
    _$createEventRequestDtoEventTypeEnumSerializer =
    _$CreateEventRequestDtoEventTypeEnumSerializer();

class _$CreateEventRequestDtoEventTypeEnumSerializer
    implements PrimitiveSerializer<CreateEventRequestDtoEventTypeEnum> {
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
  final Iterable<Type> types = const <Type>[CreateEventRequestDtoEventTypeEnum];
  @override
  final String wireName = 'CreateEventRequestDtoEventTypeEnum';

  @override
  Object serialize(
          Serializers serializers, CreateEventRequestDtoEventTypeEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  CreateEventRequestDtoEventTypeEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      CreateEventRequestDtoEventTypeEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$CreateEventRequestDto extends CreateEventRequestDto {
  @override
  final String title;
  @override
  final String description;
  @override
  final CreateEventRequestDtoEventTypeEnum eventType;
  @override
  final DateTime startTime;
  @override
  final DateTime endTime;
  @override
  final num expectedStudents;
  @override
  final String? roomId;
  @override
  final String? externalAddress;
  @override
  final String submittedBy;

  factory _$CreateEventRequestDto(
          [void Function(CreateEventRequestDtoBuilder)? updates]) =>
      (CreateEventRequestDtoBuilder()..update(updates))._build();

  _$CreateEventRequestDto._(
      {required this.title,
      required this.description,
      required this.eventType,
      required this.startTime,
      required this.endTime,
      required this.expectedStudents,
      this.roomId,
      this.externalAddress,
      required this.submittedBy})
      : super._();
  @override
  CreateEventRequestDto rebuild(
          void Function(CreateEventRequestDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateEventRequestDtoBuilder toBuilder() =>
      CreateEventRequestDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateEventRequestDto &&
        title == other.title &&
        description == other.description &&
        eventType == other.eventType &&
        startTime == other.startTime &&
        endTime == other.endTime &&
        expectedStudents == other.expectedStudents &&
        roomId == other.roomId &&
        externalAddress == other.externalAddress &&
        submittedBy == other.submittedBy;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, eventType.hashCode);
    _$hash = $jc(_$hash, startTime.hashCode);
    _$hash = $jc(_$hash, endTime.hashCode);
    _$hash = $jc(_$hash, expectedStudents.hashCode);
    _$hash = $jc(_$hash, roomId.hashCode);
    _$hash = $jc(_$hash, externalAddress.hashCode);
    _$hash = $jc(_$hash, submittedBy.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateEventRequestDto')
          ..add('title', title)
          ..add('description', description)
          ..add('eventType', eventType)
          ..add('startTime', startTime)
          ..add('endTime', endTime)
          ..add('expectedStudents', expectedStudents)
          ..add('roomId', roomId)
          ..add('externalAddress', externalAddress)
          ..add('submittedBy', submittedBy))
        .toString();
  }
}

class CreateEventRequestDtoBuilder
    implements Builder<CreateEventRequestDto, CreateEventRequestDtoBuilder> {
  _$CreateEventRequestDto? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  CreateEventRequestDtoEventTypeEnum? _eventType;
  CreateEventRequestDtoEventTypeEnum? get eventType => _$this._eventType;
  set eventType(CreateEventRequestDtoEventTypeEnum? eventType) =>
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

  String? _roomId;
  String? get roomId => _$this._roomId;
  set roomId(String? roomId) => _$this._roomId = roomId;

  String? _externalAddress;
  String? get externalAddress => _$this._externalAddress;
  set externalAddress(String? externalAddress) =>
      _$this._externalAddress = externalAddress;

  String? _submittedBy;
  String? get submittedBy => _$this._submittedBy;
  set submittedBy(String? submittedBy) => _$this._submittedBy = submittedBy;

  CreateEventRequestDtoBuilder() {
    CreateEventRequestDto._defaults(this);
  }

  CreateEventRequestDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _description = $v.description;
      _eventType = $v.eventType;
      _startTime = $v.startTime;
      _endTime = $v.endTime;
      _expectedStudents = $v.expectedStudents;
      _roomId = $v.roomId;
      _externalAddress = $v.externalAddress;
      _submittedBy = $v.submittedBy;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateEventRequestDto other) {
    _$v = other as _$CreateEventRequestDto;
  }

  @override
  void update(void Function(CreateEventRequestDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateEventRequestDto build() => _build();

  _$CreateEventRequestDto _build() {
    final _$result = _$v ??
        _$CreateEventRequestDto._(
          title: BuiltValueNullFieldError.checkNotNull(
              title, r'CreateEventRequestDto', 'title'),
          description: BuiltValueNullFieldError.checkNotNull(
              description, r'CreateEventRequestDto', 'description'),
          eventType: BuiltValueNullFieldError.checkNotNull(
              eventType, r'CreateEventRequestDto', 'eventType'),
          startTime: BuiltValueNullFieldError.checkNotNull(
              startTime, r'CreateEventRequestDto', 'startTime'),
          endTime: BuiltValueNullFieldError.checkNotNull(
              endTime, r'CreateEventRequestDto', 'endTime'),
          expectedStudents: BuiltValueNullFieldError.checkNotNull(
              expectedStudents, r'CreateEventRequestDto', 'expectedStudents'),
          roomId: roomId,
          externalAddress: externalAddress,
          submittedBy: BuiltValueNullFieldError.checkNotNull(
              submittedBy, r'CreateEventRequestDto', 'submittedBy'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
