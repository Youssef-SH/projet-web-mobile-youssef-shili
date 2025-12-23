//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/invite_preview_summary_dto.dart';
import 'package:openapi/src/model/invalid_row_dto.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'invites_preview_response_dto.g.dart';

/// InvitesPreviewResponseDto
///
/// Properties:
/// * [summary] - Summary of the CSV validation preview
/// * [invalidRows] - List of invalid rows with reasons
@BuiltValue()
abstract class InvitesPreviewResponseDto implements Built<InvitesPreviewResponseDto, InvitesPreviewResponseDtoBuilder> {
  /// Summary of the CSV validation preview
  @BuiltValueField(wireName: r'summary')
  InvitePreviewSummaryDto get summary;

  /// List of invalid rows with reasons
  @BuiltValueField(wireName: r'invalidRows')
  BuiltList<InvalidRowDto> get invalidRows;

  InvitesPreviewResponseDto._();

  factory InvitesPreviewResponseDto([void updates(InvitesPreviewResponseDtoBuilder b)]) = _$InvitesPreviewResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(InvitesPreviewResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<InvitesPreviewResponseDto> get serializer => _$InvitesPreviewResponseDtoSerializer();
}

class _$InvitesPreviewResponseDtoSerializer implements PrimitiveSerializer<InvitesPreviewResponseDto> {
  @override
  final Iterable<Type> types = const [InvitesPreviewResponseDto, _$InvitesPreviewResponseDto];

  @override
  final String wireName = r'InvitesPreviewResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    InvitesPreviewResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'summary';
    yield serializers.serialize(
      object.summary,
      specifiedType: const FullType(InvitePreviewSummaryDto),
    );
    yield r'invalidRows';
    yield serializers.serialize(
      object.invalidRows,
      specifiedType: const FullType(BuiltList, [FullType(InvalidRowDto)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    InvitesPreviewResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required InvitesPreviewResponseDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'summary':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(InvitePreviewSummaryDto),
          ) as InvitePreviewSummaryDto;
          result.summary.replace(valueDes);
          break;
        case r'invalidRows':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(InvalidRowDto)]),
          ) as BuiltList<InvalidRowDto>;
          result.invalidRows.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  InvitesPreviewResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = InvitesPreviewResponseDtoBuilder();
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

