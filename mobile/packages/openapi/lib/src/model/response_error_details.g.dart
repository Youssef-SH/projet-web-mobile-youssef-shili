// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_error_details.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ResponseErrorDetails extends ResponseErrorDetails {
  @override
  final JsonObject? details;

  factory _$ResponseErrorDetails(
          [void Function(ResponseErrorDetailsBuilder)? updates]) =>
      (ResponseErrorDetailsBuilder()..update(updates))._build();

  _$ResponseErrorDetails._({this.details}) : super._();
  @override
  ResponseErrorDetails rebuild(
          void Function(ResponseErrorDetailsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ResponseErrorDetailsBuilder toBuilder() =>
      ResponseErrorDetailsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ResponseErrorDetails && details == other.details;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, details.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ResponseErrorDetails')
          ..add('details', details))
        .toString();
  }
}

class ResponseErrorDetailsBuilder
    implements Builder<ResponseErrorDetails, ResponseErrorDetailsBuilder> {
  _$ResponseErrorDetails? _$v;

  JsonObject? _details;
  JsonObject? get details => _$this._details;
  set details(JsonObject? details) => _$this._details = details;

  ResponseErrorDetailsBuilder() {
    ResponseErrorDetails._defaults(this);
  }

  ResponseErrorDetailsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _details = $v.details;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ResponseErrorDetails other) {
    _$v = other as _$ResponseErrorDetails;
  }

  @override
  void update(void Function(ResponseErrorDetailsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ResponseErrorDetails build() => _build();

  _$ResponseErrorDetails _build() {
    final _$result = _$v ??
        _$ResponseErrorDetails._(
          details: details,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
