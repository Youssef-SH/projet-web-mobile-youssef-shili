// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events_get_request200_response_one_of1.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$EventsGetRequest200ResponseOneOf1
    extends EventsGetRequest200ResponseOneOf1 {
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

  factory _$EventsGetRequest200ResponseOneOf1(
          [void Function(EventsGetRequest200ResponseOneOf1Builder)? updates]) =>
      (EventsGetRequest200ResponseOneOf1Builder()..update(updates))._build();

  _$EventsGetRequest200ResponseOneOf1._(
      {required this.code,
      required this.message,
      this.data,
      this.error,
      required this.requestId,
      required this.timestamp})
      : super._();
  @override
  EventsGetRequest200ResponseOneOf1 rebuild(
          void Function(EventsGetRequest200ResponseOneOf1Builder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EventsGetRequest200ResponseOneOf1Builder toBuilder() =>
      EventsGetRequest200ResponseOneOf1Builder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EventsGetRequest200ResponseOneOf1 &&
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
    return (newBuiltValueToStringHelper(r'EventsGetRequest200ResponseOneOf1')
          ..add('code', code)
          ..add('message', message)
          ..add('data', data)
          ..add('error', error)
          ..add('requestId', requestId)
          ..add('timestamp', timestamp))
        .toString();
  }
}

class EventsGetRequest200ResponseOneOf1Builder
    implements
        Builder<EventsGetRequest200ResponseOneOf1,
            EventsGetRequest200ResponseOneOf1Builder>,
        ApiResponseDtoBuilder {
  _$EventsGetRequest200ResponseOneOf1? _$v;

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

  EventsGetRequest200ResponseOneOf1Builder() {
    EventsGetRequest200ResponseOneOf1._defaults(this);
  }

  EventsGetRequest200ResponseOneOf1Builder get _$this {
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
  void replace(covariant EventsGetRequest200ResponseOneOf1 other) {
    _$v = other as _$EventsGetRequest200ResponseOneOf1;
  }

  @override
  void update(
      void Function(EventsGetRequest200ResponseOneOf1Builder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EventsGetRequest200ResponseOneOf1 build() => _build();

  _$EventsGetRequest200ResponseOneOf1 _build() {
    _$EventsGetRequest200ResponseOneOf1 _$result;
    try {
      _$result = _$v ??
          _$EventsGetRequest200ResponseOneOf1._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'EventsGetRequest200ResponseOneOf1', 'code'),
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'EventsGetRequest200ResponseOneOf1', 'message'),
            data: data,
            error: _error?.build(),
            requestId: BuiltValueNullFieldError.checkNotNull(
                requestId, r'EventsGetRequest200ResponseOneOf1', 'requestId'),
            timestamp: BuiltValueNullFieldError.checkNotNull(
                timestamp, r'EventsGetRequest200ResponseOneOf1', 'timestamp'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'error';
        _error?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'EventsGetRequest200ResponseOneOf1', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
