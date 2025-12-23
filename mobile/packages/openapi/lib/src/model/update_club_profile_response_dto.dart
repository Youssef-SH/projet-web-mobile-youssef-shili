//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_club_profile_response_dto.g.dart';

/// UpdateClubProfileResponseDto
///
/// Properties:
/// * [description] - Current public description of the club (may be null if never set).
/// * [logoUrl] - Public URL of the club’s logo (null if no logo exists yet).
@BuiltValue()
abstract class UpdateClubProfileResponseDto implements Built<UpdateClubProfileResponseDto, UpdateClubProfileResponseDtoBuilder> {
  /// Current public description of the club (may be null if never set).
  @BuiltValueField(wireName: r'description')
  JsonObject? get description;

  /// Public URL of the club’s logo (null if no logo exists yet).
  @BuiltValueField(wireName: r'logoUrl')
  JsonObject? get logoUrl;

  UpdateClubProfileResponseDto._();

  factory UpdateClubProfileResponseDto([void updates(UpdateClubProfileResponseDtoBuilder b)]) = _$UpdateClubProfileResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateClubProfileResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateClubProfileResponseDto> get serializer => _$UpdateClubProfileResponseDtoSerializer();
}

class _$UpdateClubProfileResponseDtoSerializer implements PrimitiveSerializer<UpdateClubProfileResponseDto> {
  @override
  final Iterable<Type> types = const [UpdateClubProfileResponseDto, _$UpdateClubProfileResponseDto];

  @override
  final String wireName = r'UpdateClubProfileResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateClubProfileResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'description';
    yield object.description == null ? null : serializers.serialize(
      object.description,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'logoUrl';
    yield object.logoUrl == null ? null : serializers.serialize(
      object.logoUrl,
      specifiedType: const FullType.nullable(JsonObject),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdateClubProfileResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpdateClubProfileResponseDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.description = valueDes;
          break;
        case r'logoUrl':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
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
  UpdateClubProfileResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateClubProfileResponseDtoBuilder();
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

