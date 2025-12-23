//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'club_card_response_dto.g.dart';

/// ClubCardResponseDto
///
/// Properties:
/// * [id] - Unique identifier of the club.
/// * [name] - Official public name of the club.
/// * [logoUrl] - Publicly accessible URL of the club’s logo.
@BuiltValue()
abstract class ClubCardResponseDto implements Built<ClubCardResponseDto, ClubCardResponseDtoBuilder> {
  /// Unique identifier of the club.
  @BuiltValueField(wireName: r'id')
  String get id;

  /// Official public name of the club.
  @BuiltValueField(wireName: r'name')
  String get name;

  /// Publicly accessible URL of the club’s logo.
  @BuiltValueField(wireName: r'logoUrl')
  String get logoUrl;

  ClubCardResponseDto._();

  factory ClubCardResponseDto([void updates(ClubCardResponseDtoBuilder b)]) = _$ClubCardResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ClubCardResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ClubCardResponseDto> get serializer => _$ClubCardResponseDtoSerializer();
}

class _$ClubCardResponseDtoSerializer implements PrimitiveSerializer<ClubCardResponseDto> {
  @override
  final Iterable<Type> types = const [ClubCardResponseDto, _$ClubCardResponseDto];

  @override
  final String wireName = r'ClubCardResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ClubCardResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    yield r'logoUrl';
    yield serializers.serialize(
      object.logoUrl,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ClubCardResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ClubCardResponseDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
          break;
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'logoUrl':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.logoUrl = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ClubCardResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ClubCardResponseDtoBuilder();
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

