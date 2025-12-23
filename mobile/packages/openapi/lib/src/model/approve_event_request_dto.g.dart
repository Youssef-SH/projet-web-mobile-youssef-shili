// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'approve_event_request_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ApproveEventRequestDto extends ApproveEventRequestDto {
  @override
  final String? comment;

  factory _$ApproveEventRequestDto(
          [void Function(ApproveEventRequestDtoBuilder)? updates]) =>
      (ApproveEventRequestDtoBuilder()..update(updates))._build();

  _$ApproveEventRequestDto._({this.comment}) : super._();
  @override
  ApproveEventRequestDto rebuild(
          void Function(ApproveEventRequestDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApproveEventRequestDtoBuilder toBuilder() =>
      ApproveEventRequestDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApproveEventRequestDto && comment == other.comment;
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
    return (newBuiltValueToStringHelper(r'ApproveEventRequestDto')
          ..add('comment', comment))
        .toString();
  }
}

class ApproveEventRequestDtoBuilder
    implements Builder<ApproveEventRequestDto, ApproveEventRequestDtoBuilder> {
  _$ApproveEventRequestDto? _$v;

  String? _comment;
  String? get comment => _$this._comment;
  set comment(String? comment) => _$this._comment = comment;

  ApproveEventRequestDtoBuilder() {
    ApproveEventRequestDto._defaults(this);
  }

  ApproveEventRequestDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _comment = $v.comment;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ApproveEventRequestDto other) {
    _$v = other as _$ApproveEventRequestDto;
  }

  @override
  void update(void Function(ApproveEventRequestDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApproveEventRequestDto build() => _build();

  _$ApproveEventRequestDto _build() {
    final _$result = _$v ??
        _$ApproveEventRequestDto._(
          comment: comment,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
