//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/public_event_detail_response_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'event_request_approve_response_dto.g.dart';

/// EventRequestApproveResponseDto
///
/// Properties:
/// * [requestId] - Identifier of the original event request.
/// * [requestStatus] - Final status of the request after approval.
/// * [event] - Public event created as a result of approving the request.
@BuiltValue()
abstract class EventRequestApproveResponseDto implements Built<EventRequestApproveResponseDto, EventRequestApproveResponseDtoBuilder> {
  /// Identifier of the original event request.
  @BuiltValueField(wireName: r'requestId')
  String get requestId;

  /// Final status of the request after approval.
  @BuiltValueField(wireName: r'requestStatus')
  EventRequestApproveResponseDtoRequestStatusEnum get requestStatus;
  // enum requestStatusEnum {  Pending,  Approved,  Rejected,  };

  /// Public event created as a result of approving the request.
  @BuiltValueField(wireName: r'event')
  PublicEventDetailResponseDto get event;

  EventRequestApproveResponseDto._();

  factory EventRequestApproveResponseDto([void updates(EventRequestApproveResponseDtoBuilder b)]) = _$EventRequestApproveResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(EventRequestApproveResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<EventRequestApproveResponseDto> get serializer => _$EventRequestApproveResponseDtoSerializer();
}

class _$EventRequestApproveResponseDtoSerializer implements PrimitiveSerializer<EventRequestApproveResponseDto> {
  @override
  final Iterable<Type> types = const [EventRequestApproveResponseDto, _$EventRequestApproveResponseDto];

  @override
  final String wireName = r'EventRequestApproveResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    EventRequestApproveResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'requestId';
    yield serializers.serialize(
      object.requestId,
      specifiedType: const FullType(String),
    );
    yield r'requestStatus';
    yield serializers.serialize(
      object.requestStatus,
      specifiedType: const FullType(EventRequestApproveResponseDtoRequestStatusEnum),
    );
    yield r'event';
    yield serializers.serialize(
      object.event,
      specifiedType: const FullType(PublicEventDetailResponseDto),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    EventRequestApproveResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required EventRequestApproveResponseDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'requestId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.requestId = valueDes;
          break;
        case r'requestStatus':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(EventRequestApproveResponseDtoRequestStatusEnum),
          ) as EventRequestApproveResponseDtoRequestStatusEnum;
          result.requestStatus = valueDes;
          break;
        case r'event':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(PublicEventDetailResponseDto),
          ) as PublicEventDetailResponseDto;
          result.event.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  EventRequestApproveResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = EventRequestApproveResponseDtoBuilder();
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

class EventRequestApproveResponseDtoRequestStatusEnum extends EnumClass {

  /// Final status of the request after approval.
  @BuiltValueEnumConst(wireName: r'Pending')
  static const EventRequestApproveResponseDtoRequestStatusEnum pending = _$eventRequestApproveResponseDtoRequestStatusEnum_pending;
  /// Final status of the request after approval.
  @BuiltValueEnumConst(wireName: r'Approved')
  static const EventRequestApproveResponseDtoRequestStatusEnum approved = _$eventRequestApproveResponseDtoRequestStatusEnum_approved;
  /// Final status of the request after approval.
  @BuiltValueEnumConst(wireName: r'Rejected')
  static const EventRequestApproveResponseDtoRequestStatusEnum rejected = _$eventRequestApproveResponseDtoRequestStatusEnum_rejected;

  static Serializer<EventRequestApproveResponseDtoRequestStatusEnum> get serializer => _$eventRequestApproveResponseDtoRequestStatusEnumSerializer;

  const EventRequestApproveResponseDtoRequestStatusEnum._(String name): super(name);

  static BuiltSet<EventRequestApproveResponseDtoRequestStatusEnum> get values => _$eventRequestApproveResponseDtoRequestStatusEnumValues;
  static EventRequestApproveResponseDtoRequestStatusEnum valueOf(String name) => _$eventRequestApproveResponseDtoRequestStatusEnumValueOf(name);
}

