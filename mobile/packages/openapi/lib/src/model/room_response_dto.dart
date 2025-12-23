//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'room_response_dto.g.dart';

/// RoomResponseDto
///
/// Properties:
/// * [id] - Identifier of the room.
/// * [name] - Human-readable room name.
@BuiltValue()
abstract class RoomResponseDto implements Built<RoomResponseDto, RoomResponseDtoBuilder> {
  /// Identifier of the room.
  @BuiltValueField(wireName: r'id')
  String get id;

  /// Human-readable room name.
  @BuiltValueField(wireName: r'name')
  String get name;

  RoomResponseDto._();

  factory RoomResponseDto([void updates(RoomResponseDtoBuilder b)]) = _$RoomResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RoomResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RoomResponseDto> get serializer => _$RoomResponseDtoSerializer();
}

class _$RoomResponseDtoSerializer implements PrimitiveSerializer<RoomResponseDto> {
  @override
  final Iterable<Type> types = const [RoomResponseDto, _$RoomResponseDto];

  @override
  final String wireName = r'RoomResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RoomResponseDto object, {
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
  }

  @override
  Object serialize(
    Serializers serializers,
    RoomResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required RoomResponseDtoBuilder result,
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  RoomResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RoomResponseDtoBuilder();
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

