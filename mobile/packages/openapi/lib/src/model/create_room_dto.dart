//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_room_dto.g.dart';

/// CreateRoomDto
///
/// Properties:
/// * [name] - Room name as it will appear to clubs when creating an event request.
@BuiltValue()
abstract class CreateRoomDto implements Built<CreateRoomDto, CreateRoomDtoBuilder> {
  /// Room name as it will appear to clubs when creating an event request.
  @BuiltValueField(wireName: r'name')
  String get name;

  CreateRoomDto._();

  factory CreateRoomDto([void updates(CreateRoomDtoBuilder b)]) = _$CreateRoomDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateRoomDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateRoomDto> get serializer => _$CreateRoomDtoSerializer();
}

class _$CreateRoomDtoSerializer implements PrimitiveSerializer<CreateRoomDto> {
  @override
  final Iterable<Type> types = const [CreateRoomDto, _$CreateRoomDto];

  @override
  final String wireName = r'CreateRoomDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateRoomDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateRoomDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateRoomDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
  CreateRoomDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateRoomDtoBuilder();
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

