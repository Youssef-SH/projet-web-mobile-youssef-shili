// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_event_list_item_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PublicEventListItemResponseDto extends PublicEventListItemResponseDto {
  @override
  final String id;
  @override
  final String title;
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
  @override
  final String description;

  factory _$PublicEventListItemResponseDto(
          [void Function(PublicEventListItemResponseDtoBuilder)? updates]) =>
      (PublicEventListItemResponseDtoBuilder()..update(updates))._build();

  _$PublicEventListItemResponseDto._(
      {required this.id,
      required this.title,
      required this.clubName,
      required this.startTime,
      required this.endTime,
      required this.location,
      required this.isCancelled,
      required this.description})
      : super._();
  @override
  PublicEventListItemResponseDto rebuild(
          void Function(PublicEventListItemResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PublicEventListItemResponseDtoBuilder toBuilder() =>
      PublicEventListItemResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PublicEventListItemResponseDto &&
        id == other.id &&
        title == other.title &&
        clubName == other.clubName &&
        startTime == other.startTime &&
        endTime == other.endTime &&
        location == other.location &&
        isCancelled == other.isCancelled &&
        description == other.description;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, clubName.hashCode);
    _$hash = $jc(_$hash, startTime.hashCode);
    _$hash = $jc(_$hash, endTime.hashCode);
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jc(_$hash, isCancelled.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PublicEventListItemResponseDto')
          ..add('id', id)
          ..add('title', title)
          ..add('clubName', clubName)
          ..add('startTime', startTime)
          ..add('endTime', endTime)
          ..add('location', location)
          ..add('isCancelled', isCancelled)
          ..add('description', description))
        .toString();
  }
}

class PublicEventListItemResponseDtoBuilder
    implements
        Builder<PublicEventListItemResponseDto,
            PublicEventListItemResponseDtoBuilder> {
  _$PublicEventListItemResponseDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

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

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  PublicEventListItemResponseDtoBuilder() {
    PublicEventListItemResponseDto._defaults(this);
  }

  PublicEventListItemResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _clubName = $v.clubName;
      _startTime = $v.startTime;
      _endTime = $v.endTime;
      _location = $v.location;
      _isCancelled = $v.isCancelled;
      _description = $v.description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PublicEventListItemResponseDto other) {
    _$v = other as _$PublicEventListItemResponseDto;
  }

  @override
  void update(void Function(PublicEventListItemResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PublicEventListItemResponseDto build() => _build();

  _$PublicEventListItemResponseDto _build() {
    final _$result = _$v ??
        _$PublicEventListItemResponseDto._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'PublicEventListItemResponseDto', 'id'),
          title: BuiltValueNullFieldError.checkNotNull(
              title, r'PublicEventListItemResponseDto', 'title'),
          clubName: BuiltValueNullFieldError.checkNotNull(
              clubName, r'PublicEventListItemResponseDto', 'clubName'),
          startTime: BuiltValueNullFieldError.checkNotNull(
              startTime, r'PublicEventListItemResponseDto', 'startTime'),
          endTime: BuiltValueNullFieldError.checkNotNull(
              endTime, r'PublicEventListItemResponseDto', 'endTime'),
          location: BuiltValueNullFieldError.checkNotNull(
              location, r'PublicEventListItemResponseDto', 'location'),
          isCancelled: BuiltValueNullFieldError.checkNotNull(
              isCancelled, r'PublicEventListItemResponseDto', 'isCancelled'),
          description: BuiltValueNullFieldError.checkNotNull(
              description, r'PublicEventListItemResponseDto', 'description'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
