// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_login400_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AuthLogin400Response extends AuthLogin400Response {
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

  factory _$AuthLogin400Response(
          [void Function(AuthLogin400ResponseBuilder)? updates]) =>
      (AuthLogin400ResponseBuilder()..update(updates))._build();

  _$AuthLogin400Response._(
      {required this.code,
      required this.message,
      this.data,
      this.error,
      required this.requestId,
      required this.timestamp})
      : super._();
  @override
  AuthLogin400Response rebuild(
          void Function(AuthLogin400ResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthLogin400ResponseBuilder toBuilder() =>
      AuthLogin400ResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthLogin400Response &&
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
    return (newBuiltValueToStringHelper(r'AuthLogin400Response')
          ..add('code', code)
          ..add('message', message)
          ..add('data', data)
          ..add('error', error)
          ..add('requestId', requestId)
          ..add('timestamp', timestamp))
        .toString();
  }
}

class AuthLogin400ResponseBuilder
    implements
        Builder<AuthLogin400Response, AuthLogin400ResponseBuilder>,
        ApiResponseDtoBuilder {
  _$AuthLogin400Response? _$v;

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

  AuthLogin400ResponseBuilder() {
    AuthLogin400Response._defaults(this);
  }

  AuthLogin400ResponseBuilder get _$this {
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
  void replace(covariant AuthLogin400Response other) {
    _$v = other as _$AuthLogin400Response;
  }

  @override
  void update(void Function(AuthLogin400ResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AuthLogin400Response build() => _build();

  _$AuthLogin400Response _build() {
    _$AuthLogin400Response _$result;
    try {
      _$result = _$v ??
          _$AuthLogin400Response._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'AuthLogin400Response', 'code'),
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'AuthLogin400Response', 'message'),
            data: data,
            error: _error?.build(),
            requestId: BuiltValueNullFieldError.checkNotNull(
                requestId, r'AuthLogin400Response', 'requestId'),
            timestamp: BuiltValueNullFieldError.checkNotNull(
                timestamp, r'AuthLogin400Response', 'timestamp'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'error';
        _error?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AuthLogin400Response', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
