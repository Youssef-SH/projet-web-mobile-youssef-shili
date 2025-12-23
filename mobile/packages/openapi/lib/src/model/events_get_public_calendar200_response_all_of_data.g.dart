// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events_get_public_calendar200_response_all_of_data.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$EventsGetPublicCalendar200ResponseAllOfData
    extends EventsGetPublicCalendar200ResponseAllOfData {
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

  factory _$EventsGetPublicCalendar200ResponseAllOfData(
          [void Function(EventsGetPublicCalendar200ResponseAllOfDataBuilder)?
              updates]) =>
      (EventsGetPublicCalendar200ResponseAllOfDataBuilder()..update(updates))
          ._build();

  _$EventsGetPublicCalendar200ResponseAllOfData._(
      {required this.total,
      required this.page,
      required this.limit,
      required this.totalPages,
      required this.data})
      : super._();
  @override
  EventsGetPublicCalendar200ResponseAllOfData rebuild(
          void Function(EventsGetPublicCalendar200ResponseAllOfDataBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EventsGetPublicCalendar200ResponseAllOfDataBuilder toBuilder() =>
      EventsGetPublicCalendar200ResponseAllOfDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EventsGetPublicCalendar200ResponseAllOfData &&
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
            r'EventsGetPublicCalendar200ResponseAllOfData')
          ..add('total', total)
          ..add('page', page)
          ..add('limit', limit)
          ..add('totalPages', totalPages)
          ..add('data', data))
        .toString();
  }
}

class EventsGetPublicCalendar200ResponseAllOfDataBuilder
    implements
        Builder<EventsGetPublicCalendar200ResponseAllOfData,
            EventsGetPublicCalendar200ResponseAllOfDataBuilder>,
        PaginatedResponseDtoBuilder {
  _$EventsGetPublicCalendar200ResponseAllOfData? _$v;

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

  EventsGetPublicCalendar200ResponseAllOfDataBuilder() {
    EventsGetPublicCalendar200ResponseAllOfData._defaults(this);
  }

  EventsGetPublicCalendar200ResponseAllOfDataBuilder get _$this {
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
  void replace(covariant EventsGetPublicCalendar200ResponseAllOfData other) {
    _$v = other as _$EventsGetPublicCalendar200ResponseAllOfData;
  }

  @override
  void update(
      void Function(EventsGetPublicCalendar200ResponseAllOfDataBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  EventsGetPublicCalendar200ResponseAllOfData build() => _build();

  _$EventsGetPublicCalendar200ResponseAllOfData _build() {
    _$EventsGetPublicCalendar200ResponseAllOfData _$result;
    try {
      _$result = _$v ??
          _$EventsGetPublicCalendar200ResponseAllOfData._(
            total: BuiltValueNullFieldError.checkNotNull(
                total, r'EventsGetPublicCalendar200ResponseAllOfData', 'total'),
            page: BuiltValueNullFieldError.checkNotNull(
                page, r'EventsGetPublicCalendar200ResponseAllOfData', 'page'),
            limit: BuiltValueNullFieldError.checkNotNull(
                limit, r'EventsGetPublicCalendar200ResponseAllOfData', 'limit'),
            totalPages: BuiltValueNullFieldError.checkNotNull(totalPages,
                r'EventsGetPublicCalendar200ResponseAllOfData', 'totalPages'),
            data: data.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'EventsGetPublicCalendar200ResponseAllOfData',
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
