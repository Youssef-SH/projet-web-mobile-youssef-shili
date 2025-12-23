//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'generate_annual_report_dto.g.dart';

/// GenerateAnnualReportDto
///
/// Properties:
/// * [year] - Academic year for which the report should be generated. Must be between 2000 and 2100. Defaults to the current year if omitted.
@BuiltValue()
abstract class GenerateAnnualReportDto implements Built<GenerateAnnualReportDto, GenerateAnnualReportDtoBuilder> {
  /// Academic year for which the report should be generated. Must be between 2000 and 2100. Defaults to the current year if omitted.
  @BuiltValueField(wireName: r'year')
  num? get year;

  GenerateAnnualReportDto._();

  factory GenerateAnnualReportDto([void updates(GenerateAnnualReportDtoBuilder b)]) = _$GenerateAnnualReportDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GenerateAnnualReportDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GenerateAnnualReportDto> get serializer => _$GenerateAnnualReportDtoSerializer();
}

class _$GenerateAnnualReportDtoSerializer implements PrimitiveSerializer<GenerateAnnualReportDto> {
  @override
  final Iterable<Type> types = const [GenerateAnnualReportDto, _$GenerateAnnualReportDto];

  @override
  final String wireName = r'GenerateAnnualReportDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GenerateAnnualReportDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.year != null) {
      yield r'year';
      yield serializers.serialize(
        object.year,
        specifiedType: const FullType(num),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    GenerateAnnualReportDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required GenerateAnnualReportDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'year':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.year = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GenerateAnnualReportDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GenerateAnnualReportDtoBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}

