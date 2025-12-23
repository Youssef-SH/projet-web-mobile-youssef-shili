// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'annual_report_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AnnualReportResponseDto extends AnnualReportResponseDto {
  @override
  final JsonObject? clubId;
  @override
  final num year;
  @override
  final DateTime generatedAt;
  @override
  final String reportUrl;

  factory _$AnnualReportResponseDto(
          [void Function(AnnualReportResponseDtoBuilder)? updates]) =>
      (AnnualReportResponseDtoBuilder()..update(updates))._build();

  _$AnnualReportResponseDto._(
      {this.clubId,
      required this.year,
      required this.generatedAt,
      required this.reportUrl})
      : super._();
  @override
  AnnualReportResponseDto rebuild(
          void Function(AnnualReportResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AnnualReportResponseDtoBuilder toBuilder() =>
      AnnualReportResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AnnualReportResponseDto &&
        clubId == other.clubId &&
        year == other.year &&
        generatedAt == other.generatedAt &&
        reportUrl == other.reportUrl;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, clubId.hashCode);
    _$hash = $jc(_$hash, year.hashCode);
    _$hash = $jc(_$hash, generatedAt.hashCode);
    _$hash = $jc(_$hash, reportUrl.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AnnualReportResponseDto')
          ..add('clubId', clubId)
          ..add('year', year)
          ..add('generatedAt', generatedAt)
          ..add('reportUrl', reportUrl))
        .toString();
  }
}

class AnnualReportResponseDtoBuilder
    implements
        Builder<AnnualReportResponseDto, AnnualReportResponseDtoBuilder> {
  _$AnnualReportResponseDto? _$v;

  JsonObject? _clubId;
  JsonObject? get clubId => _$this._clubId;
  set clubId(JsonObject? clubId) => _$this._clubId = clubId;

  num? _year;
  num? get year => _$this._year;
  set year(num? year) => _$this._year = year;

  DateTime? _generatedAt;
  DateTime? get generatedAt => _$this._generatedAt;
  set generatedAt(DateTime? generatedAt) => _$this._generatedAt = generatedAt;

  String? _reportUrl;
  String? get reportUrl => _$this._reportUrl;
  set reportUrl(String? reportUrl) => _$this._reportUrl = reportUrl;

  AnnualReportResponseDtoBuilder() {
    AnnualReportResponseDto._defaults(this);
  }

  AnnualReportResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _clubId = $v.clubId;
      _year = $v.year;
      _generatedAt = $v.generatedAt;
      _reportUrl = $v.reportUrl;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AnnualReportResponseDto other) {
    _$v = other as _$AnnualReportResponseDto;
  }

  @override
  void update(void Function(AnnualReportResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AnnualReportResponseDto build() => _build();

  _$AnnualReportResponseDto _build() {
    final _$result = _$v ??
        _$AnnualReportResponseDto._(
          clubId: clubId,
          year: BuiltValueNullFieldError.checkNotNull(
              year, r'AnnualReportResponseDto', 'year'),
          generatedAt: BuiltValueNullFieldError.checkNotNull(
              generatedAt, r'AnnualReportResponseDto', 'generatedAt'),
          reportUrl: BuiltValueNullFieldError.checkNotNull(
              reportUrl, r'AnnualReportResponseDto', 'reportUrl'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
