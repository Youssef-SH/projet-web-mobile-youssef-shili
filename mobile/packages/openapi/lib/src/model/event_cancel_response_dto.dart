//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'event_cancel_response_dto.g.dart';

/// EventCancelResponseDto
///
/// Properties:
/// * [id] - Identifier of the event that was cancelled.
/// * [isCancelled] - Whether the event is now in a cancelled state. Always true after this call.
@BuiltValue()
abstract class EventCancelResponseDto implements Built<EventCancelResponseDto, EventCancelResponseDtoBuilder> {
  /// Identifier of the event that was cancelled.
  @BuiltValueField(wireName: r'id')
  String get id;

  /// Whether the event is now in a cancelled state. Always true after this call.
  @BuiltValueField(wireName: r'isCancelled')
  bool get isCancelled;

  EventCancelResponseDto._();

  factory EventCancelResponseDto([void updates(EventCancelResponseDtoBuilder b)]) = _$EventCancelResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(EventCancelResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<EventCancelResponseDto> get serializer => _$EventCancelResponseDtoSerializer();
}

class _$EventCancelResponseDtoSerializer implements PrimitiveSerializer<EventCancelResponseDto> {
  @override
  final Iterable<Type> types = const [EventCancelResponseDto, _$EventCancelResponseDto];

  @override
  final String wireName = r'EventCancelResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    EventCancelResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'isCancelled';
    yield serializers.serialize(
      object.isCancelled,
      specifiedType: const FullType(bool),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    EventCancelResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required EventCancelResponseDtoBuilder result,
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
        case r'isCancelled':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isCancelled = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  EventCancelResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = EventCancelResponseDtoBuilder();
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

