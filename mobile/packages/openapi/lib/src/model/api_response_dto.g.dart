// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

abstract class ApiResponseDtoBuilder {
  void replace(ApiResponseDto other);
  void update(void Function(ApiResponseDtoBuilder) updates);
  String? get code;
  set code(String? code);

  String? get message;
  set message(String? message);

  JsonObject? get data;
  set data(JsonObject? data);

  ResponseErrorDetailsBuilder get error;
  set error(ResponseErrorDetailsBuilder? error);

  String? get requestId;
  set requestId(String? requestId);

  String? get timestamp;
  set timestamp(String? timestamp);
}

class _$$ApiResponseDto extends $ApiResponseDto {
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

  factory _$$ApiResponseDto([void Function($ApiResponseDtoBuilder)? updates]) =>
      ($ApiResponseDtoBuilder()..update(updates))._build();

  _$$ApiResponseDto._(
      {required this.code,
      required this.message,
      this.data,
      this.error,
      required this.requestId,
      required this.timestamp})
      : super._();
  @override
  $ApiResponseDto rebuild(void Function($ApiResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  $ApiResponseDtoBuilder toBuilder() => $ApiResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is $ApiResponseDto &&
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
    return (newBuiltValueToStringHelper(r'$ApiResponseDto')
          ..add('code', code)
          ..add('message', message)
          ..add('data', data)
          ..add('error', error)
          ..add('requestId', requestId)
          ..add('timestamp', timestamp))
        .toString();
  }
}

class $ApiResponseDtoBuilder
    implements
        Builder<$ApiResponseDto, $ApiResponseDtoBuilder>,
        ApiResponseDtoBuilder {
  _$$ApiResponseDto? _$v;

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

  $ApiResponseDtoBuilder() {
    $ApiResponseDto._defaults(this);
  }

  $ApiResponseDtoBuilder get _$this {
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
  void replace(covariant $ApiResponseDto other) {
    _$v = other as _$$ApiResponseDto;
  }

  @override
  void update(void Function($ApiResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  $ApiResponseDto build() => _build();

  _$$ApiResponseDto _build() {
    _$$ApiResponseDto _$result;
    try {
      _$result = _$v ??
          _$$ApiResponseDto._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'$ApiResponseDto', 'code'),
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'$ApiResponseDto', 'message'),
            data: data,
            error: _error?.build(),
            requestId: BuiltValueNullFieldError.checkNotNull(
                requestId, r'$ApiResponseDto', 'requestId'),
            timestamp: BuiltValueNullFieldError.checkNotNull(
                timestamp, r'$ApiResponseDto', 'timestamp'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'error';
        _error?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'$ApiResponseDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
