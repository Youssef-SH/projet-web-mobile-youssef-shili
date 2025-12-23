// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'club_event_requests_query_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ClubEventRequestsQueryDto extends ClubEventRequestsQueryDto {
  @override
  final JsonObject? page;
  @override
  final JsonObject? limit;

  factory _$ClubEventRequestsQueryDto(
          [void Function(ClubEventRequestsQueryDtoBuilder)? updates]) =>
      (ClubEventRequestsQueryDtoBuilder()..update(updates))._build();

  _$ClubEventRequestsQueryDto._({this.page, this.limit}) : super._();
  @override
  ClubEventRequestsQueryDto rebuild(
          void Function(ClubEventRequestsQueryDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClubEventRequestsQueryDtoBuilder toBuilder() =>
      ClubEventRequestsQueryDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClubEventRequestsQueryDto &&
        page == other.page &&
        limit == other.limit;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, page.hashCode);
    _$hash = $jc(_$hash, limit.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ClubEventRequestsQueryDto')
          ..add('page', page)
          ..add('limit', limit))
        .toString();
  }
}

class ClubEventRequestsQueryDtoBuilder
    implements
        Builder<ClubEventRequestsQueryDto, ClubEventRequestsQueryDtoBuilder> {
  _$ClubEventRequestsQueryDto? _$v;

  JsonObject? _page;
  JsonObject? get page => _$this._page;
  set page(JsonObject? page) => _$this._page = page;

  JsonObject? _limit;
  JsonObject? get limit => _$this._limit;
  set limit(JsonObject? limit) => _$this._limit = limit;

  ClubEventRequestsQueryDtoBuilder() {
    ClubEventRequestsQueryDto._defaults(this);
  }

  ClubEventRequestsQueryDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _page = $v.page;
      _limit = $v.limit;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ClubEventRequestsQueryDto other) {
    _$v = other as _$ClubEventRequestsQueryDto;
  }

  @override
  void update(void Function(ClubEventRequestsQueryDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClubEventRequestsQueryDto build() => _build();

  _$ClubEventRequestsQueryDto _build() {
    final _$result = _$v ??
        _$ClubEventRequestsQueryDto._(
          page: page,
          limit: limit,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
