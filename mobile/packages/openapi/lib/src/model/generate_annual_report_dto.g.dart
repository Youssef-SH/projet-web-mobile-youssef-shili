// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_annual_report_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GenerateAnnualReportDto extends GenerateAnnualReportDto {
  @override
  final num? year;

  factory _$GenerateAnnualReportDto(
          [void Function(GenerateAnnualReportDtoBuilder)? updates]) =>
      (GenerateAnnualReportDtoBuilder()..update(updates))._build();

  _$GenerateAnnualReportDto._({this.year}) : super._();
  @override
  GenerateAnnualReportDto rebuild(
          void Function(GenerateAnnualReportDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenerateAnnualReportDtoBuilder toBuilder() =>
      GenerateAnnualReportDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GenerateAnnualReportDto && year == other.year;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, year.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GenerateAnnualReportDto')
          ..add('year', year))
        .toString();
  }
}

class GenerateAnnualReportDtoBuilder
    implements
        Builder<GenerateAnnualReportDto, GenerateAnnualReportDtoBuilder> {
  _$GenerateAnnualReportDto? _$v;

  num? _year;
  num? get year => _$this._year;
  set year(num? year) => _$this._year = year;

  GenerateAnnualReportDtoBuilder() {
    GenerateAnnualReportDto._defaults(this);
  }

  GenerateAnnualReportDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _year = $v.year;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GenerateAnnualReportDto other) {
    _$v = other as _$GenerateAnnualReportDto;
  }

  @override
  void update(void Function(GenerateAnnualReportDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GenerateAnnualReportDto build() => _build();

  _$GenerateAnnualReportDto _build() {
    final _$result = _$v ??
        _$GenerateAnnualReportDto._(
          year: year,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
