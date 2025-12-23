//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'event_request_reject_response_dto.g.dart';

/// EventRequestRejectResponseDto
///
/// Properties:
/// * [id] - Identifier of the rejected event request.
/// * [status] - Final status of the request after rejection.
/// * [adminComment] - Admin comment explaining the rejection. Visible to the club.
@BuiltValue()
abstract class EventRequestRejectResponseDto implements Built<EventRequestRejectResponseDto, EventRequestRejectResponseDtoBuilder> {
  /// Identifier of the rejected event request.
  @BuiltValueField(wireName: r'id')
  String get id;

  /// Final status of the request after rejection.
  @BuiltValueField(wireName: r'status')
  EventRequestRejectResponseDtoStatusEnum get status;
  // enum statusEnum {  Pending,  Approved,  Rejected,  };

  /// Admin comment explaining the rejection. Visible to the club.
  @BuiltValueField(wireName: r'adminComment')
  String get adminComment;

  EventRequestRejectResponseDto._();

  factory EventRequestRejectResponseDto([void updates(EventRequestRejectResponseDtoBuilder b)]) = _$EventRequestRejectResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(EventRequestRejectResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<EventRequestRejectResponseDto> get serializer => _$EventRequestRejectResponseDtoSerializer();
}

class _$EventRequestRejectResponseDtoSerializer implements PrimitiveSerializer<EventRequestRejectResponseDto> {
  @override
  final Iterable<Type> types = const [EventRequestRejectResponseDto, _$EventRequestRejectResponseDto];

  @override
  final String wireName = r'EventRequestRejectResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    EventRequestRejectResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(EventRequestRejectResponseDtoStatusEnum),
    );
    yield r'adminComment';
    yield serializers.serialize(
      object.adminComment,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    EventRequestRejectResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required EventRequestRejectResponseDtoBuilder result,
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
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(EventRequestRejectResponseDtoStatusEnum),
          ) as EventRequestRejectResponseDtoStatusEnum;
          result.status = valueDes;
          break;
        case r'adminComment':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.adminComment = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  EventRequestRejectResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = EventRequestRejectResponseDtoBuilder();
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

class EventRequestRejectResponseDtoStatusEnum extends EnumClass {

  /// Final status of the request after rejection.
  @BuiltValueEnumConst(wireName: r'Pending')
  static const EventRequestRejectResponseDtoStatusEnum pending = _$eventRequestRejectResponseDtoStatusEnum_pending;
  /// Final status of the request after rejection.
  @BuiltValueEnumConst(wireName: r'Approved')
  static const EventRequestRejectResponseDtoStatusEnum approved = _$eventRequestRejectResponseDtoStatusEnum_approved;
  /// Final status of the request after rejection.
  @BuiltValueEnumConst(wireName: r'Rejected')
  static const EventRequestRejectResponseDtoStatusEnum rejected = _$eventRequestRejectResponseDtoStatusEnum_rejected;

  static Serializer<EventRequestRejectResponseDtoStatusEnum> get serializer => _$eventRequestRejectResponseDtoStatusEnumSerializer;

  const EventRequestRejectResponseDtoStatusEnum._(String name): super(name);

  static BuiltSet<EventRequestRejectResponseDtoStatusEnum> get values => _$eventRequestRejectResponseDtoStatusEnumValues;
  static EventRequestRejectResponseDtoStatusEnum valueOf(String name) => _$eventRequestRejectResponseDtoStatusEnumValueOf(name);
}

