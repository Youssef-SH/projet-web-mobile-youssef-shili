// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events_get_request200_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$EventsGetRequest200Response extends EventsGetRequest200Response {
  @override
  final OneOf oneOf;

  factory _$EventsGetRequest200Response(
          [void Function(EventsGetRequest200ResponseBuilder)? updates]) =>
      (EventsGetRequest200ResponseBuilder()..update(updates))._build();

  _$EventsGetRequest200Response._({required this.oneOf}) : super._();
  @override
  EventsGetRequest200Response rebuild(
          void Function(EventsGetRequest200ResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EventsGetRequest200ResponseBuilder toBuilder() =>
      EventsGetRequest200ResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EventsGetRequest200Response && oneOf == other.oneOf;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, oneOf.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EventsGetRequest200Response')
          ..add('oneOf', oneOf))
        .toString();
  }
}

class EventsGetRequest200ResponseBuilder
    implements
        Builder<EventsGetRequest200Response,
            EventsGetRequest200ResponseBuilder> {
  _$EventsGetRequest200Response? _$v;

  OneOf? _oneOf;
  OneOf? get oneOf => _$this._oneOf;
  set oneOf(OneOf? oneOf) => _$this._oneOf = oneOf;

  EventsGetRequest200ResponseBuilder() {
    EventsGetRequest200Response._defaults(this);
  }

  EventsGetRequest200ResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _oneOf = $v.oneOf;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EventsGetRequest200Response other) {
    _$v = other as _$EventsGetRequest200Response;
  }

  @override
  void update(void Function(EventsGetRequest200ResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EventsGetRequest200Response build() => _build();

  _$EventsGetRequest200Response _build() {
    final _$result = _$v ??
        _$EventsGetRequest200Response._(
          oneOf: BuiltValueNullFieldError.checkNotNull(
              oneOf, r'EventsGetRequest200Response', 'oneOf'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
