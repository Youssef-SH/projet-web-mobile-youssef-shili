// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

abstract class PaginatedResponseDtoBuilder {
  void replace(PaginatedResponseDto other);
  void update(void Function(PaginatedResponseDtoBuilder) updates);
  num? get total;
  set total(num? total);

  num? get page;
  set page(num? page);

  num? get limit;
  set limit(num? limit);

  num? get totalPages;
  set totalPages(num? totalPages);

  ListBuilder<BuiltList<String>> get data;
  set data(ListBuilder<BuiltList<String>>? data);
}

class _$$PaginatedResponseDto extends $PaginatedResponseDto {
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

  factory _$$PaginatedResponseDto(
          [void Function($PaginatedResponseDtoBuilder)? updates]) =>
      ($PaginatedResponseDtoBuilder()..update(updates))._build();

  _$$PaginatedResponseDto._(
      {required this.total,
      required this.page,
      required this.limit,
      required this.totalPages,
      required this.data})
      : super._();
  @override
  $PaginatedResponseDto rebuild(
          void Function($PaginatedResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  $PaginatedResponseDtoBuilder toBuilder() =>
      $PaginatedResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is $PaginatedResponseDto &&
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
    return (newBuiltValueToStringHelper(r'$PaginatedResponseDto')
          ..add('total', total)
          ..add('page', page)
          ..add('limit', limit)
          ..add('totalPages', totalPages)
          ..add('data', data))
        .toString();
  }
}

class $PaginatedResponseDtoBuilder
    implements
        Builder<$PaginatedResponseDto, $PaginatedResponseDtoBuilder>,
        PaginatedResponseDtoBuilder {
  _$$PaginatedResponseDto? _$v;

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

  $PaginatedResponseDtoBuilder() {
    $PaginatedResponseDto._defaults(this);
  }

  $PaginatedResponseDtoBuilder get _$this {
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
  void replace(covariant $PaginatedResponseDto other) {
    _$v = other as _$$PaginatedResponseDto;
  }

  @override
  void update(void Function($PaginatedResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  $PaginatedResponseDto build() => _build();

  _$$PaginatedResponseDto _build() {
    _$$PaginatedResponseDto _$result;
    try {
      _$result = _$v ??
          _$$PaginatedResponseDto._(
            total: BuiltValueNullFieldError.checkNotNull(
                total, r'$PaginatedResponseDto', 'total'),
            page: BuiltValueNullFieldError.checkNotNull(
                page, r'$PaginatedResponseDto', 'page'),
            limit: BuiltValueNullFieldError.checkNotNull(
                limit, r'$PaginatedResponseDto', 'limit'),
            totalPages: BuiltValueNullFieldError.checkNotNull(
                totalPages, r'$PaginatedResponseDto', 'totalPages'),
            data: data.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'$PaginatedResponseDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
