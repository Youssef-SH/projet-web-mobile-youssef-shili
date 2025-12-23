// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_cancel_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$EventCancelResponseDto extends EventCancelResponseDto {
  @override
  final String id;
  @override
  final bool isCancelled;

  factory _$EventCancelResponseDto(
          [void Function(EventCancelResponseDtoBuilder)? updates]) =>
      (EventCancelResponseDtoBuilder()..update(updates))._build();

  _$EventCancelResponseDto._({required this.id, required this.isCancelled})
      : super._();
  @override
  EventCancelResponseDto rebuild(
          void Function(EventCancelResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EventCancelResponseDtoBuilder toBuilder() =>
      EventCancelResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EventCancelResponseDto &&
        id == other.id &&
        isCancelled == other.isCancelled;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, isCancelled.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EventCancelResponseDto')
          ..add('id', id)
          ..add('isCancelled', isCancelled))
        .toString();
  }
}

class EventCancelResponseDtoBuilder
    implements Builder<EventCancelResponseDto, EventCancelResponseDtoBuilder> {
  _$EventCancelResponseDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  bool? _isCancelled;
  bool? get isCancelled => _$this._isCancelled;
  set isCancelled(bool? isCancelled) => _$this._isCancelled = isCancelled;

  EventCancelResponseDtoBuilder() {
    EventCancelResponseDto._defaults(this);
  }

  EventCancelResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _isCancelled = $v.isCancelled;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EventCancelResponseDto other) {
    _$v = other as _$EventCancelResponseDto;
  }

  @override
  void update(void Function(EventCancelResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EventCancelResponseDto build() => _build();

  _$EventCancelResponseDto _build() {
    final _$result = _$v ??
        _$EventCancelResponseDto._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'EventCancelResponseDto', 'id'),
          isCancelled: BuiltValueNullFieldError.checkNotNull(
              isCancelled, r'EventCancelResponseDto', 'isCancelled'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
