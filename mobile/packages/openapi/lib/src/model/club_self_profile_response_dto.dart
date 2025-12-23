//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/club_leader_dto.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'club_self_profile_response_dto.g.dart';

/// ClubSelfProfileResponseDto
///
/// Properties:
/// * [id] - Authenticated club id.
/// * [name] 
/// * [description] 
/// * [logoUrl] 
/// * [leaders] - Current leaders for this club. Here we DO include ids.
@BuiltValue()
abstract class ClubSelfProfileResponseDto implements Built<ClubSelfProfileResponseDto, ClubSelfProfileResponseDtoBuilder> {
  /// Authenticated club id.
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'description')
  String get description;

  @BuiltValueField(wireName: r'logoUrl')
  String get logoUrl;

  /// Current leaders for this club. Here we DO include ids.
  @BuiltValueField(wireName: r'leaders')
  BuiltList<ClubLeaderDto> get leaders;

  ClubSelfProfileResponseDto._();

  factory ClubSelfProfileResponseDto([void updates(ClubSelfProfileResponseDtoBuilder b)]) = _$ClubSelfProfileResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ClubSelfProfileResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ClubSelfProfileResponseDto> get serializer => _$ClubSelfProfileResponseDtoSerializer();
}

class _$ClubSelfProfileResponseDtoSerializer implements PrimitiveSerializer<ClubSelfProfileResponseDto> {
  @override
  final Iterable<Type> types = const [ClubSelfProfileResponseDto, _$ClubSelfProfileResponseDto];

  @override
  final String wireName = r'ClubSelfProfileResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ClubSelfProfileResponseDto object, {
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
    yield r'description';
    yield serializers.serialize(
      object.description,
      specifiedType: const FullType(String),
    );
    yield r'logoUrl';
    yield serializers.serialize(
      object.logoUrl,
      specifiedType: const FullType(String),
    );
    yield r'leaders';
    yield serializers.serialize(
      object.leaders,
      specifiedType: const FullType(BuiltList, [FullType(ClubLeaderDto)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ClubSelfProfileResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ClubSelfProfileResponseDtoBuilder result,
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
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.description = valueDes;
          break;
        case r'logoUrl':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.logoUrl = valueDes;
          break;
        case r'leaders':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ClubLeaderDto)]),
          ) as BuiltList<ClubLeaderDto>;
          result.leaders.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ClubSelfProfileResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ClubSelfProfileResponseDtoBuilder();
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

