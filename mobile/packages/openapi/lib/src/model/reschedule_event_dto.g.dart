// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reschedule_event_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RescheduleEventDto extends RescheduleEventDto {
  @override
  final DateTime startTime;
  @override
  final DateTime endTime;

  factory _$RescheduleEventDto(
          [void Function(RescheduleEventDtoBuilder)? updates]) =>
      (RescheduleEventDtoBuilder()..update(updates))._build();

  _$RescheduleEventDto._({required this.startTime, required this.endTime})
      : super._();
  @override
  RescheduleEventDto rebuild(
          void Function(RescheduleEventDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RescheduleEventDtoBuilder toBuilder() =>
      RescheduleEventDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RescheduleEventDto &&
        startTime == other.startTime &&
        endTime == other.endTime;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, startTime.hashCode);
    _$hash = $jc(_$hash, endTime.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RescheduleEventDto')
          ..add('startTime', startTime)
          ..add('endTime', endTime))
        .toString();
  }
}

class RescheduleEventDtoBuilder
    implements Builder<RescheduleEventDto, RescheduleEventDtoBuilder> {
  _$RescheduleEventDto? _$v;

  DateTime? _startTime;
  DateTime? get startTime => _$this._startTime;
  set startTime(DateTime? startTime) => _$this._startTime = startTime;

  DateTime? _endTime;
  DateTime? get endTime => _$this._endTime;
  set endTime(DateTime? endTime) => _$this._endTime = endTime;

  RescheduleEventDtoBuilder() {
    RescheduleEventDto._defaults(this);
  }

  RescheduleEventDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _startTime = $v.startTime;
      _endTime = $v.endTime;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RescheduleEventDto other) {
    _$v = other as _$RescheduleEventDto;
  }

  @override
  void update(void Function(RescheduleEventDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RescheduleEventDto build() => _build();

  _$RescheduleEventDto _build() {
    final _$result = _$v ??
        _$RescheduleEventDto._(
          startTime: BuiltValueNullFieldError.checkNotNull(
              startTime, r'RescheduleEventDto', 'startTime'),
          endTime: BuiltValueNullFieldError.checkNotNull(
              endTime, r'RescheduleEventDto', 'endTime'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
