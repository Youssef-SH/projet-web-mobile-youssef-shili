// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_reschedule_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$EventRescheduleResponseDto extends EventRescheduleResponseDto {
  @override
  final String id;
  @override
  final DateTime startTime;
  @override
  final DateTime endTime;

  factory _$EventRescheduleResponseDto(
          [void Function(EventRescheduleResponseDtoBuilder)? updates]) =>
      (EventRescheduleResponseDtoBuilder()..update(updates))._build();

  _$EventRescheduleResponseDto._(
      {required this.id, required this.startTime, required this.endTime})
      : super._();
  @override
  EventRescheduleResponseDto rebuild(
          void Function(EventRescheduleResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EventRescheduleResponseDtoBuilder toBuilder() =>
      EventRescheduleResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EventRescheduleResponseDto &&
        id == other.id &&
        startTime == other.startTime &&
        endTime == other.endTime;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, startTime.hashCode);
    _$hash = $jc(_$hash, endTime.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EventRescheduleResponseDto')
          ..add('id', id)
          ..add('startTime', startTime)
          ..add('endTime', endTime))
        .toString();
  }
}

class EventRescheduleResponseDtoBuilder
    implements
        Builder<EventRescheduleResponseDto, EventRescheduleResponseDtoBuilder> {
  _$EventRescheduleResponseDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  DateTime? _startTime;
  DateTime? get startTime => _$this._startTime;
  set startTime(DateTime? startTime) => _$this._startTime = startTime;

  DateTime? _endTime;
  DateTime? get endTime => _$this._endTime;
  set endTime(DateTime? endTime) => _$this._endTime = endTime;

  EventRescheduleResponseDtoBuilder() {
    EventRescheduleResponseDto._defaults(this);
  }

  EventRescheduleResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _startTime = $v.startTime;
      _endTime = $v.endTime;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EventRescheduleResponseDto other) {
    _$v = other as _$EventRescheduleResponseDto;
  }

  @override
  void update(void Function(EventRescheduleResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EventRescheduleResponseDto build() => _build();

  _$EventRescheduleResponseDto _build() {
    final _$result = _$v ??
        _$EventRescheduleResponseDto._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'EventRescheduleResponseDto', 'id'),
          startTime: BuiltValueNullFieldError.checkNotNull(
              startTime, r'EventRescheduleResponseDto', 'startTime'),
          endTime: BuiltValueNullFieldError.checkNotNull(
              endTime, r'EventRescheduleResponseDto', 'endTime'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
