// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clubs_generate_annual_report200_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ClubsGenerateAnnualReport200Response
    extends ClubsGenerateAnnualReport200Response {
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

  factory _$ClubsGenerateAnnualReport200Response(
          [void Function(ClubsGenerateAnnualReport200ResponseBuilder)?
              updates]) =>
      (ClubsGenerateAnnualReport200ResponseBuilder()..update(updates))._build();

  _$ClubsGenerateAnnualReport200Response._(
      {required this.code,
      required this.message,
      this.data,
      this.error,
      required this.requestId,
      required this.timestamp})
      : super._();
  @override
  ClubsGenerateAnnualReport200Response rebuild(
          void Function(ClubsGenerateAnnualReport200ResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClubsGenerateAnnualReport200ResponseBuilder toBuilder() =>
      ClubsGenerateAnnualReport200ResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClubsGenerateAnnualReport200Response &&
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
    return (newBuiltValueToStringHelper(r'ClubsGenerateAnnualReport200Response')
          ..add('code', code)
          ..add('message', message)
          ..add('data', data)
          ..add('error', error)
          ..add('requestId', requestId)
          ..add('timestamp', timestamp))
        .toString();
  }
}

class ClubsGenerateAnnualReport200ResponseBuilder
    implements
        Builder<ClubsGenerateAnnualReport200Response,
            ClubsGenerateAnnualReport200ResponseBuilder>,
        ApiResponseDtoBuilder {
  _$ClubsGenerateAnnualReport200Response? _$v;

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

  ClubsGenerateAnnualReport200ResponseBuilder() {
    ClubsGenerateAnnualReport200Response._defaults(this);
  }

  ClubsGenerateAnnualReport200ResponseBuilder get _$this {
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
  void replace(covariant ClubsGenerateAnnualReport200Response other) {
    _$v = other as _$ClubsGenerateAnnualReport200Response;
  }

  @override
  void update(
      void Function(ClubsGenerateAnnualReport200ResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClubsGenerateAnnualReport200Response build() => _build();

  _$ClubsGenerateAnnualReport200Response _build() {
    _$ClubsGenerateAnnualReport200Response _$result;
    try {
      _$result = _$v ??
          _$ClubsGenerateAnnualReport200Response._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'ClubsGenerateAnnualReport200Response', 'code'),
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'ClubsGenerateAnnualReport200Response', 'message'),
            data: data,
            error: _error?.build(),
            requestId: BuiltValueNullFieldError.checkNotNull(requestId,
                r'ClubsGenerateAnnualReport200Response', 'requestId'),
            timestamp: BuiltValueNullFieldError.checkNotNull(timestamp,
                r'ClubsGenerateAnnualReport200Response', 'timestamp'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'error';
        _error?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ClubsGenerateAnnualReport200Response',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
