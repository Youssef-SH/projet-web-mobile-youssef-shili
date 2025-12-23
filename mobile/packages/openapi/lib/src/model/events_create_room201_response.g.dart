// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events_create_room201_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$EventsCreateRoom201Response extends EventsCreateRoom201Response {
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

  factory _$EventsCreateRoom201Response(
          [void Function(EventsCreateRoom201ResponseBuilder)? updates]) =>
      (EventsCreateRoom201ResponseBuilder()..update(updates))._build();

  _$EventsCreateRoom201Response._(
      {required this.code,
      required this.message,
      this.data,
      this.error,
      required this.requestId,
      required this.timestamp})
      : super._();
  @override
  EventsCreateRoom201Response rebuild(
          void Function(EventsCreateRoom201ResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EventsCreateRoom201ResponseBuilder toBuilder() =>
      EventsCreateRoom201ResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EventsCreateRoom201Response &&
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
    return (newBuiltValueToStringHelper(r'EventsCreateRoom201Response')
          ..add('code', code)
          ..add('message', message)
          ..add('data', data)
          ..add('error', error)
          ..add('requestId', requestId)
          ..add('timestamp', timestamp))
        .toString();
  }
}

class EventsCreateRoom201ResponseBuilder
    implements
        Builder<EventsCreateRoom201Response,
            EventsCreateRoom201ResponseBuilder>,
        ApiResponseDtoBuilder {
  _$EventsCreateRoom201Response? _$v;

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

  EventsCreateRoom201ResponseBuilder() {
    EventsCreateRoom201Response._defaults(this);
  }

  EventsCreateRoom201ResponseBuilder get _$this {
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
  void replace(covariant EventsCreateRoom201Response other) {
    _$v = other as _$EventsCreateRoom201Response;
  }

  @override
  void update(void Function(EventsCreateRoom201ResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EventsCreateRoom201Response build() => _build();

  _$EventsCreateRoom201Response _build() {
    _$EventsCreateRoom201Response _$result;
    try {
      _$result = _$v ??
          _$EventsCreateRoom201Response._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'EventsCreateRoom201Response', 'code'),
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'EventsCreateRoom201Response', 'message'),
            data: data,
            error: _error?.build(),
            requestId: BuiltValueNullFieldError.checkNotNull(
                requestId, r'EventsCreateRoom201Response', 'requestId'),
            timestamp: BuiltValueNullFieldError.checkNotNull(
                timestamp, r'EventsCreateRoom201Response', 'timestamp'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'error';
        _error?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'EventsCreateRoom201Response', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
