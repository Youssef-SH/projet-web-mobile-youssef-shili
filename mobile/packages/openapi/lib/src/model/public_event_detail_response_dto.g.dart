// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_event_detail_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const PublicEventDetailResponseDtoEventTypeEnum
    _$publicEventDetailResponseDtoEventTypeEnum_scientific =
    const PublicEventDetailResponseDtoEventTypeEnum._('scientific');
const PublicEventDetailResponseDtoEventTypeEnum
    _$publicEventDetailResponseDtoEventTypeEnum_social =
    const PublicEventDetailResponseDtoEventTypeEnum._('social');
const PublicEventDetailResponseDtoEventTypeEnum
    _$publicEventDetailResponseDtoEventTypeEnum_entertainment =
    const PublicEventDetailResponseDtoEventTypeEnum._('entertainment');
const PublicEventDetailResponseDtoEventTypeEnum
    _$publicEventDetailResponseDtoEventTypeEnum_national =
    const PublicEventDetailResponseDtoEventTypeEnum._('national');
const PublicEventDetailResponseDtoEventTypeEnum
    _$publicEventDetailResponseDtoEventTypeEnum_sports =
    const PublicEventDetailResponseDtoEventTypeEnum._('sports');
const PublicEventDetailResponseDtoEventTypeEnum
    _$publicEventDetailResponseDtoEventTypeEnum_artistic =
    const PublicEventDetailResponseDtoEventTypeEnum._('artistic');
const PublicEventDetailResponseDtoEventTypeEnum
    _$publicEventDetailResponseDtoEventTypeEnum_other =
    const PublicEventDetailResponseDtoEventTypeEnum._('other');

PublicEventDetailResponseDtoEventTypeEnum
    _$publicEventDetailResponseDtoEventTypeEnumValueOf(String name) {
  switch (name) {
    case 'scientific':
      return _$publicEventDetailResponseDtoEventTypeEnum_scientific;
    case 'social':
      return _$publicEventDetailResponseDtoEventTypeEnum_social;
    case 'entertainment':
      return _$publicEventDetailResponseDtoEventTypeEnum_entertainment;
    case 'national':
      return _$publicEventDetailResponseDtoEventTypeEnum_national;
    case 'sports':
      return _$publicEventDetailResponseDtoEventTypeEnum_sports;
    case 'artistic':
      return _$publicEventDetailResponseDtoEventTypeEnum_artistic;
    case 'other':
      return _$publicEventDetailResponseDtoEventTypeEnum_other;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<PublicEventDetailResponseDtoEventTypeEnum>
    _$publicEventDetailResponseDtoEventTypeEnumValues = BuiltSet<
        PublicEventDetailResponseDtoEventTypeEnum>(const <PublicEventDetailResponseDtoEventTypeEnum>[
  _$publicEventDetailResponseDtoEventTypeEnum_scientific,
  _$publicEventDetailResponseDtoEventTypeEnum_social,
  _$publicEventDetailResponseDtoEventTypeEnum_entertainment,
  _$publicEventDetailResponseDtoEventTypeEnum_national,
  _$publicEventDetailResponseDtoEventTypeEnum_sports,
  _$publicEventDetailResponseDtoEventTypeEnum_artistic,
  _$publicEventDetailResponseDtoEventTypeEnum_other,
]);

Serializer<PublicEventDetailResponseDtoEventTypeEnum>
    _$publicEventDetailResponseDtoEventTypeEnumSerializer =
    _$PublicEventDetailResponseDtoEventTypeEnumSerializer();

class _$PublicEventDetailResponseDtoEventTypeEnumSerializer
    implements PrimitiveSerializer<PublicEventDetailResponseDtoEventTypeEnum> {
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
    PublicEventDetailResponseDtoEventTypeEnum
  ];
  @override
  final String wireName = 'PublicEventDetailResponseDtoEventTypeEnum';

  @override
  Object serialize(Serializers serializers,
          PublicEventDetailResponseDtoEventTypeEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  PublicEventDetailResponseDtoEventTypeEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      PublicEventDetailResponseDtoEventTypeEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$PublicEventDetailResponseDto extends PublicEventDetailResponseDto {
  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final PublicEventDetailResponseDtoEventTypeEnum eventType;
  @override
  final String clubName;
  @override
  final DateTime startTime;
  @override
  final DateTime endTime;
  @override
  final String location;
  @override
  final bool isCancelled;

  factory _$PublicEventDetailResponseDto(
          [void Function(PublicEventDetailResponseDtoBuilder)? updates]) =>
      (PublicEventDetailResponseDtoBuilder()..update(updates))._build();

  _$PublicEventDetailResponseDto._(
      {required this.id,
      required this.title,
      required this.description,
      required this.eventType,
      required this.clubName,
      required this.startTime,
      required this.endTime,
      required this.location,
      required this.isCancelled})
      : super._();
  @override
  PublicEventDetailResponseDto rebuild(
          void Function(PublicEventDetailResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PublicEventDetailResponseDtoBuilder toBuilder() =>
      PublicEventDetailResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PublicEventDetailResponseDto &&
        id == other.id &&
        title == other.title &&
        description == other.description &&
        eventType == other.eventType &&
        clubName == other.clubName &&
        startTime == other.startTime &&
        endTime == other.endTime &&
        location == other.location &&
        isCancelled == other.isCancelled;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, eventType.hashCode);
    _$hash = $jc(_$hash, clubName.hashCode);
    _$hash = $jc(_$hash, startTime.hashCode);
    _$hash = $jc(_$hash, endTime.hashCode);
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jc(_$hash, isCancelled.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PublicEventDetailResponseDto')
          ..add('id', id)
          ..add('title', title)
          ..add('description', description)
          ..add('eventType', eventType)
          ..add('clubName', clubName)
          ..add('startTime', startTime)
          ..add('endTime', endTime)
          ..add('location', location)
          ..add('isCancelled', isCancelled))
        .toString();
  }
}

class PublicEventDetailResponseDtoBuilder
    implements
        Builder<PublicEventDetailResponseDto,
            PublicEventDetailResponseDtoBuilder> {
  _$PublicEventDetailResponseDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  PublicEventDetailResponseDtoEventTypeEnum? _eventType;
  PublicEventDetailResponseDtoEventTypeEnum? get eventType => _$this._eventType;
  set eventType(PublicEventDetailResponseDtoEventTypeEnum? eventType) =>
      _$this._eventType = eventType;

  String? _clubName;
  String? get clubName => _$this._clubName;
  set clubName(String? clubName) => _$this._clubName = clubName;

  DateTime? _startTime;
  DateTime? get startTime => _$this._startTime;
  set startTime(DateTime? startTime) => _$this._startTime = startTime;

  DateTime? _endTime;
  DateTime? get endTime => _$this._endTime;
  set endTime(DateTime? endTime) => _$this._endTime = endTime;

  String? _location;
  String? get location => _$this._location;
  set location(String? location) => _$this._location = location;

  bool? _isCancelled;
  bool? get isCancelled => _$this._isCancelled;
  set isCancelled(bool? isCancelled) => _$this._isCancelled = isCancelled;

  PublicEventDetailResponseDtoBuilder() {
    PublicEventDetailResponseDto._defaults(this);
  }

  PublicEventDetailResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _description = $v.description;
      _eventType = $v.eventType;
      _clubName = $v.clubName;
      _startTime = $v.startTime;
      _endTime = $v.endTime;
      _location = $v.location;
      _isCancelled = $v.isCancelled;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PublicEventDetailResponseDto other) {
    _$v = other as _$PublicEventDetailResponseDto;
  }

  @override
  void update(void Function(PublicEventDetailResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PublicEventDetailResponseDto build() => _build();

  _$PublicEventDetailResponseDto _build() {
    final _$result = _$v ??
        _$PublicEventDetailResponseDto._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'PublicEventDetailResponseDto', 'id'),
          title: BuiltValueNullFieldError.checkNotNull(
              title, r'PublicEventDetailResponseDto', 'title'),
          description: BuiltValueNullFieldError.checkNotNull(
              description, r'PublicEventDetailResponseDto', 'description'),
          eventType: BuiltValueNullFieldError.checkNotNull(
              eventType, r'PublicEventDetailResponseDto', 'eventType'),
          clubName: BuiltValueNullFieldError.checkNotNull(
              clubName, r'PublicEventDetailResponseDto', 'clubName'),
          startTime: BuiltValueNullFieldError.checkNotNull(
              startTime, r'PublicEventDetailResponseDto', 'startTime'),
          endTime: BuiltValueNullFieldError.checkNotNull(
              endTime, r'PublicEventDetailResponseDto', 'endTime'),
          location: BuiltValueNullFieldError.checkNotNull(
              location, r'PublicEventDetailResponseDto', 'location'),
          isCancelled: BuiltValueNullFieldError.checkNotNull(
              isCancelled, r'PublicEventDetailResponseDto', 'isCancelled'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
