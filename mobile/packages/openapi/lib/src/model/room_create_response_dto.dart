//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'room_create_response_dto.g.dart';

/// RoomCreateResponseDto
///
/// Properties:
/// * [id] - Identifier of the newly created room.
/// * [name] - Name of the newly created room.
@BuiltValue()
abstract class RoomCreateResponseDto implements Built<RoomCreateResponseDto, RoomCreateResponseDtoBuilder> {
  /// Identifier of the newly created room.
  @BuiltValueField(wireName: r'id')
  String get id;

  /// Name of the newly created room.
  @BuiltValueField(wireName: r'name')
  String get name;

  RoomCreateResponseDto._();

  factory RoomCreateResponseDto([void updates(RoomCreateResponseDtoBuilder b)]) = _$RoomCreateResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RoomCreateResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RoomCreateResponseDto> get serializer => _$RoomCreateResponseDtoSerializer();
}

class _$RoomCreateResponseDtoSerializer implements PrimitiveSerializer<RoomCreateResponseDto> {
  @override
  final Iterable<Type> types = const [RoomCreateResponseDto, _$RoomCreateResponseDto];

  @override
  final String wireName = r'RoomCreateResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RoomCreateResponseDto object, {
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
    RoomCreateResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required RoomCreateResponseDtoBuilder result,
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
  RoomCreateResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RoomCreateResponseDtoBuilder();
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

