//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'annex_view_dto.g.dart';

/// AnnexViewDto
///
/// Properties:
/// * [annexTemplateId] - Annex template ID this file is linked to.
/// * [annexUrl] - URL to access the uploaded annex file.
/// * [validated] - Indicates if the annex has been validated by an admin.
@BuiltValue()
abstract class AnnexViewDto implements Built<AnnexViewDto, AnnexViewDtoBuilder> {
  /// Annex template ID this file is linked to.
  @BuiltValueField(wireName: r'annexTemplateId')
  String get annexTemplateId;

  /// URL to access the uploaded annex file.
  @BuiltValueField(wireName: r'annexUrl')
  String get annexUrl;

  /// Indicates if the annex has been validated by an admin.
  @BuiltValueField(wireName: r'validated')
  bool get validated;

  AnnexViewDto._();

  factory AnnexViewDto([void updates(AnnexViewDtoBuilder b)]) = _$AnnexViewDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AnnexViewDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AnnexViewDto> get serializer => _$AnnexViewDtoSerializer();
}

class _$AnnexViewDtoSerializer implements PrimitiveSerializer<AnnexViewDto> {
  @override
  final Iterable<Type> types = const [AnnexViewDto, _$AnnexViewDto];

  @override
  final String wireName = r'AnnexViewDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AnnexViewDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'annexTemplateId';
    yield serializers.serialize(
      object.annexTemplateId,
      specifiedType: const FullType(String),
    );
    yield r'annexUrl';
    yield serializers.serialize(
      object.annexUrl,
      specifiedType: const FullType(String),
    );
    yield r'validated';
    yield serializers.serialize(
      object.validated,
      specifiedType: const FullType(bool),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AnnexViewDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AnnexViewDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'annexTemplateId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.annexTemplateId = valueDes;
          break;
        case r'annexUrl':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.annexUrl = valueDes;
          break;
        case r'validated':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.validated = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AnnexViewDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AnnexViewDtoBuilder();
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

