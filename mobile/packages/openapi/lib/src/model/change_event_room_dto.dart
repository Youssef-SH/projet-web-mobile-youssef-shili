//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'change_event_room_dto.g.dart';

/// ChangeEventRoomDto
///
/// Properties:
/// * [roomId] - Target internal room to move this event to.
@BuiltValue()
abstract class ChangeEventRoomDto implements Built<ChangeEventRoomDto, ChangeEventRoomDtoBuilder> {
  /// Target internal room to move this event to.
  @BuiltValueField(wireName: r'roomId')
  String get roomId;

  ChangeEventRoomDto._();

  factory ChangeEventRoomDto([void updates(ChangeEventRoomDtoBuilder b)]) = _$ChangeEventRoomDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ChangeEventRoomDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ChangeEventRoomDto> get serializer => _$ChangeEventRoomDtoSerializer();
}

class _$ChangeEventRoomDtoSerializer implements PrimitiveSerializer<ChangeEventRoomDto> {
  @override
  final Iterable<Type> types = const [ChangeEventRoomDto, _$ChangeEventRoomDto];

  @override
  final String wireName = r'ChangeEventRoomDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ChangeEventRoomDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'roomId';
    yield serializers.serialize(
      object.roomId,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ChangeEventRoomDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ChangeEventRoomDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'roomId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.roomId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ChangeEventRoomDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ChangeEventRoomDtoBuilder();
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

