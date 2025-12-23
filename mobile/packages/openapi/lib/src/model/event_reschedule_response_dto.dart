//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'event_reschedule_response_dto.g.dart';

/// EventRescheduleResponseDto
///
/// Properties:
/// * [id] - Identifier of the rescheduled event.
/// * [startTime] - New start time for the event.
/// * [endTime] - New end time for the event.
@BuiltValue()
abstract class EventRescheduleResponseDto implements Built<EventRescheduleResponseDto, EventRescheduleResponseDtoBuilder> {
  /// Identifier of the rescheduled event.
  @BuiltValueField(wireName: r'id')
  String get id;

  /// New start time for the event.
  @BuiltValueField(wireName: r'startTime')
  DateTime get startTime;

  /// New end time for the event.
  @BuiltValueField(wireName: r'endTime')
  DateTime get endTime;

  EventRescheduleResponseDto._();

  factory EventRescheduleResponseDto([void updates(EventRescheduleResponseDtoBuilder b)]) = _$EventRescheduleResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(EventRescheduleResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<EventRescheduleResponseDto> get serializer => _$EventRescheduleResponseDtoSerializer();
}

class _$EventRescheduleResponseDtoSerializer implements PrimitiveSerializer<EventRescheduleResponseDto> {
  @override
  final Iterable<Type> types = const [EventRescheduleResponseDto, _$EventRescheduleResponseDto];

  @override
  final String wireName = r'EventRescheduleResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    EventRescheduleResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'startTime';
    yield serializers.serialize(
      object.startTime,
      specifiedType: const FullType(DateTime),
    );
    yield r'endTime';
    yield serializers.serialize(
      object.endTime,
      specifiedType: const FullType(DateTime),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    EventRescheduleResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required EventRescheduleResponseDtoBuilder result,
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
        case r'startTime':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.startTime = valueDes;
          break;
        case r'endTime':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.endTime = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  EventRescheduleResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = EventRescheduleResponseDtoBuilder();
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

