// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reject_event_request_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RejectEventRequestDto extends RejectEventRequestDto {
  @override
  final String comment;

  factory _$RejectEventRequestDto(
          [void Function(RejectEventRequestDtoBuilder)? updates]) =>
      (RejectEventRequestDtoBuilder()..update(updates))._build();

  _$RejectEventRequestDto._({required this.comment}) : super._();
  @override
  RejectEventRequestDto rebuild(
          void Function(RejectEventRequestDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RejectEventRequestDtoBuilder toBuilder() =>
      RejectEventRequestDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RejectEventRequestDto && comment == other.comment;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, comment.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RejectEventRequestDto')
          ..add('comment', comment))
        .toString();
  }
}

class RejectEventRequestDtoBuilder
    implements Builder<RejectEventRequestDto, RejectEventRequestDtoBuilder> {
  _$RejectEventRequestDto? _$v;

  String? _comment;
  String? get comment => _$this._comment;
  set comment(String? comment) => _$this._comment = comment;

  RejectEventRequestDtoBuilder() {
    RejectEventRequestDto._defaults(this);
  }

  RejectEventRequestDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _comment = $v.comment;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RejectEventRequestDto other) {
    _$v = other as _$RejectEventRequestDto;
  }

  @override
  void update(void Function(RejectEventRequestDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RejectEventRequestDto build() => _build();

  _$RejectEventRequestDto _build() {
    final _$result = _$v ??
        _$RejectEventRequestDto._(
          comment: BuiltValueNullFieldError.checkNotNull(
              comment, r'RejectEventRequestDto', 'comment'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
