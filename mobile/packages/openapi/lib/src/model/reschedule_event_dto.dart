//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'reschedule_event_dto.g.dart';

/// RescheduleEventDto
///
/// Properties:
/// * [startTime] - New event start datetime (ISO 8601).
/// * [endTime] - New event end datetime (ISO 8601). Must be > startTime (service will check).
@BuiltValue()
abstract class RescheduleEventDto implements Built<RescheduleEventDto, RescheduleEventDtoBuilder> {
  /// New event start datetime (ISO 8601).
  @BuiltValueField(wireName: r'startTime')
  DateTime get startTime;

  /// New event end datetime (ISO 8601). Must be > startTime (service will check).
  @BuiltValueField(wireName: r'endTime')
  DateTime get endTime;

  RescheduleEventDto._();

  factory RescheduleEventDto([void updates(RescheduleEventDtoBuilder b)]) = _$RescheduleEventDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RescheduleEventDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RescheduleEventDto> get serializer => _$RescheduleEventDtoSerializer();
}

class _$RescheduleEventDtoSerializer implements PrimitiveSerializer<RescheduleEventDto> {
  @override
  final Iterable<Type> types = const [RescheduleEventDto, _$RescheduleEventDto];

  @override
  final String wireName = r'RescheduleEventDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RescheduleEventDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
    RescheduleEventDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required RescheduleEventDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
  RescheduleEventDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RescheduleEventDtoBuilder();
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

