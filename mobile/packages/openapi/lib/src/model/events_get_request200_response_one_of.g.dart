// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events_get_request200_response_one_of.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$EventsGetRequest200ResponseOneOf
    extends EventsGetRequest200ResponseOneOf {
  @override
  final String code;
  @override
  final String message;
  @override
  final JsonObject? data;
  @override
  final ResponseErrorDetails? error;
  @override
  final String requestId;
  @override
  final String timestamp;

  factory _$EventsGetRequest200ResponseOneOf(
          [void Function(EventsGetRequest200ResponseOneOfBuilder)? updates]) =>
      (EventsGetRequest200ResponseOneOfBuilder()..update(updates))._build();

  _$EventsGetRequest200ResponseOneOf._(
      {required this.code,
      required this.message,
      this.data,
      this.error,
      required this.requestId,
      required this.timestamp})
      : super._();
  @override
  EventsGetRequest200ResponseOneOf rebuild(
          void Function(EventsGetRequest200ResponseOneOfBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EventsGetRequest200ResponseOneOfBuilder toBuilder() =>
      EventsGetRequest200ResponseOneOfBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EventsGetRequest200ResponseOneOf &&
        code == other.code &&
        message == other.message &&
        data == other.data &&
        error == other.error &&
        requestId == other.requestId &&
        timestamp == other.timestamp;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jc(_$hash, requestId.hashCode);
    _$hash = $jc(_$hash, timestamp.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EventsGetRequest200ResponseOneOf')
          ..add('code', code)
          ..add('message', message)
          ..add('data', data)
          ..add('error', error)
          ..add('requestId', requestId)
          ..add('timestamp', timestamp))
        .toString();
  }
}

class EventsGetRequest200ResponseOneOfBuilder
    implements
        Builder<EventsGetRequest200ResponseOneOf,
            EventsGetRequest200ResponseOneOfBuilder>,
        ApiResponseDtoBuilder {
  _$EventsGetRequest200ResponseOneOf? _$v;

  String? _code;
  String? get code => _$this._code;
  set code(covariant String? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(covariant String? message) => _$this._message = message;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(covariant JsonObject? data) => _$this._data = data;

  ResponseErrorDetailsBuilder? _error;
  ResponseErrorDetailsBuilder get error =>
      _$this._error ??= ResponseErrorDetailsBuilder();
  set error(covariant ResponseErrorDetailsBuilder? error) =>
      _$this._error = error;

  String? _requestId;
  String? get requestId => _$this._requestId;
  set requestId(covariant String? requestId) => _$this._requestId = requestId;

  String? _timestamp;
  String? get timestamp => _$this._timestamp;
  set timestamp(covariant String? timestamp) => _$this._timestamp = timestamp;

  EventsGetRequest200ResponseOneOfBuilder() {
    EventsGetRequest200ResponseOneOf._defaults(this);
  }

  EventsGetRequest200ResponseOneOfBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _message = $v.message;
      _data = $v.data;
      _error = $v.error?.toBuilder();
      _requestId = $v.requestId;
      _timestamp = $v.timestamp;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant EventsGetRequest200ResponseOneOf other) {
    _$v = other as _$EventsGetRequest200ResponseOneOf;
  }

  @override
  void update(void Function(EventsGetRequest200ResponseOneOfBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EventsGetRequest200ResponseOneOf build() => _build();

  _$EventsGetRequest200ResponseOneOf _build() {
    _$EventsGetRequest200ResponseOneOf _$result;
    try {
      _$result = _$v ??
          _$EventsGetRequest200ResponseOneOf._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'EventsGetRequest200ResponseOneOf', 'code'),
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'EventsGetRequest200ResponseOneOf', 'message'),
            data: data,
            error: _error?.build(),
            requestId: BuiltValueNullFieldError.checkNotNull(
                requestId, r'EventsGetRequest200ResponseOneOf', 'requestId'),
            timestamp: BuiltValueNullFieldError.checkNotNull(
                timestamp, r'EventsGetRequest200ResponseOneOf', 'timestamp'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'error';
        _error?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'EventsGetRequest200ResponseOneOf', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
