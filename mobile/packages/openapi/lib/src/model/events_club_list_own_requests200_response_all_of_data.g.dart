// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events_club_list_own_requests200_response_all_of_data.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$EventsClubListOwnRequests200ResponseAllOfData
    extends EventsClubListOwnRequests200ResponseAllOfData {
  @override
  final num total;
  @override
  final num page;
  @override
  final num limit;
  @override
  final num totalPages;
  @override
  final BuiltList<BuiltList<String>> data;

  factory _$EventsClubListOwnRequests200ResponseAllOfData(
          [void Function(EventsClubListOwnRequests200ResponseAllOfDataBuilder)?
              updates]) =>
      (EventsClubListOwnRequests200ResponseAllOfDataBuilder()..update(updates))
          ._build();

  _$EventsClubListOwnRequests200ResponseAllOfData._(
      {required this.total,
      required this.page,
      required this.limit,
      required this.totalPages,
      required this.data})
      : super._();
  @override
  EventsClubListOwnRequests200ResponseAllOfData rebuild(
          void Function(EventsClubListOwnRequests200ResponseAllOfDataBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EventsClubListOwnRequests200ResponseAllOfDataBuilder toBuilder() =>
      EventsClubListOwnRequests200ResponseAllOfDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EventsClubListOwnRequests200ResponseAllOfData &&
        total == other.total &&
        page == other.page &&
        limit == other.limit &&
        totalPages == other.totalPages &&
        data == other.data;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, total.hashCode);
    _$hash = $jc(_$hash, page.hashCode);
    _$hash = $jc(_$hash, limit.hashCode);
    _$hash = $jc(_$hash, totalPages.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'EventsClubListOwnRequests200ResponseAllOfData')
          ..add('total', total)
          ..add('page', page)
          ..add('limit', limit)
          ..add('totalPages', totalPages)
          ..add('data', data))
        .toString();
  }
}

class EventsClubListOwnRequests200ResponseAllOfDataBuilder
    implements
        Builder<EventsClubListOwnRequests200ResponseAllOfData,
            EventsClubListOwnRequests200ResponseAllOfDataBuilder>,
        PaginatedResponseDtoBuilder {
  _$EventsClubListOwnRequests200ResponseAllOfData? _$v;

  num? _total;
  num? get total => _$this._total;
  set total(covariant num? total) => _$this._total = total;

  num? _page;
  num? get page => _$this._page;
  set page(covariant num? page) => _$this._page = page;

  num? _limit;
  num? get limit => _$this._limit;
  set limit(covariant num? limit) => _$this._limit = limit;

  num? _totalPages;
  num? get totalPages => _$this._totalPages;
  set totalPages(covariant num? totalPages) => _$this._totalPages = totalPages;

  ListBuilder<BuiltList<String>>? _data;
  ListBuilder<BuiltList<String>> get data =>
      _$this._data ??= ListBuilder<BuiltList<String>>();
  set data(covariant ListBuilder<BuiltList<String>>? data) =>
      _$this._data = data;

  EventsClubListOwnRequests200ResponseAllOfDataBuilder() {
    EventsClubListOwnRequests200ResponseAllOfData._defaults(this);
  }

  EventsClubListOwnRequests200ResponseAllOfDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _total = $v.total;
      _page = $v.page;
      _limit = $v.limit;
      _totalPages = $v.totalPages;
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant EventsClubListOwnRequests200ResponseAllOfData other) {
    _$v = other as _$EventsClubListOwnRequests200ResponseAllOfData;
  }

  @override
  void update(
      void Function(EventsClubListOwnRequests200ResponseAllOfDataBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  EventsClubListOwnRequests200ResponseAllOfData build() => _build();

  _$EventsClubListOwnRequests200ResponseAllOfData _build() {
    _$EventsClubListOwnRequests200ResponseAllOfData _$result;
    try {
      _$result = _$v ??
          _$EventsClubListOwnRequests200ResponseAllOfData._(
            total: BuiltValueNullFieldError.checkNotNull(total,
                r'EventsClubListOwnRequests200ResponseAllOfData', 'total'),
            page: BuiltValueNullFieldError.checkNotNull(
                page, r'EventsClubListOwnRequests200ResponseAllOfData', 'page'),
            limit: BuiltValueNullFieldError.checkNotNull(limit,
                r'EventsClubListOwnRequests200ResponseAllOfData', 'limit'),
            totalPages: BuiltValueNullFieldError.checkNotNull(totalPages,
                r'EventsClubListOwnRequests200ResponseAllOfData', 'totalPages'),
            data: data.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'EventsClubListOwnRequests200ResponseAllOfData',
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
