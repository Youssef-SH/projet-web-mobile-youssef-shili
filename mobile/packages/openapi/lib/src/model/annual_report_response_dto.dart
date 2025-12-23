//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'annual_report_response_dto.g.dart';

/// AnnualReportResponseDto
///
/// Properties:
/// * [clubId] - Unique identifier of the club this report belongs to. Null for institution-wide reports.
/// * [year] - Academic year covered by this report.
/// * [generatedAt] - ISO 8601 UTC timestamp when the report was generated.
/// * [reportUrl] - Signed URL to access the generated report PDF.
@BuiltValue()
abstract class AnnualReportResponseDto implements Built<AnnualReportResponseDto, AnnualReportResponseDtoBuilder> {
  /// Unique identifier of the club this report belongs to. Null for institution-wide reports.
  @BuiltValueField(wireName: r'clubId')
  JsonObject? get clubId;

  /// Academic year covered by this report.
  @BuiltValueField(wireName: r'year')
  num get year;

  /// ISO 8601 UTC timestamp when the report was generated.
  @BuiltValueField(wireName: r'generatedAt')
  DateTime get generatedAt;

  /// Signed URL to access the generated report PDF.
  @BuiltValueField(wireName: r'reportUrl')
  String get reportUrl;

  AnnualReportResponseDto._();

  factory AnnualReportResponseDto([void updates(AnnualReportResponseDtoBuilder b)]) = _$AnnualReportResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AnnualReportResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AnnualReportResponseDto> get serializer => _$AnnualReportResponseDtoSerializer();
}

class _$AnnualReportResponseDtoSerializer implements PrimitiveSerializer<AnnualReportResponseDto> {
  @override
  final Iterable<Type> types = const [AnnualReportResponseDto, _$AnnualReportResponseDto];

  @override
  final String wireName = r'AnnualReportResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AnnualReportResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'clubId';
    yield object.clubId == null ? null : serializers.serialize(
      object.clubId,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'year';
    yield serializers.serialize(
      object.year,
      specifiedType: const FullType(num),
    );
    yield r'generatedAt';
    yield serializers.serialize(
      object.generatedAt,
      specifiedType: const FullType(DateTime),
    );
    yield r'reportUrl';
    yield serializers.serialize(
      object.reportUrl,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AnnualReportResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AnnualReportResponseDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'clubId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.clubId = valueDes;
          break;
        case r'year':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.year = valueDes;
          break;
        case r'generatedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.generatedAt = valueDes;
          break;
        case r'reportUrl':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.reportUrl = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AnnualReportResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AnnualReportResponseDtoBuilder();
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

