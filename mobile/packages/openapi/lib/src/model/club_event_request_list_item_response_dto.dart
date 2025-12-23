//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'club_event_request_list_item_response_dto.g.dart';

/// ClubEventRequestListItemResponseDto
///
/// Properties:
/// * [id] - Event request identifier.
/// * [title] - Title of the requested event.
/// * [status] - Current status of this request for the club.
/// * [startTime] - Requested start time of the event.
/// * [endTime] - Requested end time of the event.
/// * [location] - Renderable location (room name if internal, external address if off-campus).
@BuiltValue()
abstract class ClubEventRequestListItemResponseDto implements Built<ClubEventRequestListItemResponseDto, ClubEventRequestListItemResponseDtoBuilder> {
  /// Event request identifier.
  @BuiltValueField(wireName: r'id')
  String get id;

  /// Title of the requested event.
  @BuiltValueField(wireName: r'title')
  String get title;

  /// Current status of this request for the club.
  @BuiltValueField(wireName: r'status')
  ClubEventRequestListItemResponseDtoStatusEnum get status;
  // enum statusEnum {  Pending,  Approved,  Rejected,  };

  /// Requested start time of the event.
  @BuiltValueField(wireName: r'startTime')
  DateTime get startTime;

  /// Requested end time of the event.
  @BuiltValueField(wireName: r'endTime')
  DateTime get endTime;

  /// Renderable location (room name if internal, external address if off-campus).
  @BuiltValueField(wireName: r'location')
  String get location;

  ClubEventRequestListItemResponseDto._();

  factory ClubEventRequestListItemResponseDto([void updates(ClubEventRequestListItemResponseDtoBuilder b)]) = _$ClubEventRequestListItemResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ClubEventRequestListItemResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ClubEventRequestListItemResponseDto> get serializer => _$ClubEventRequestListItemResponseDtoSerializer();
}

class _$ClubEventRequestListItemResponseDtoSerializer implements PrimitiveSerializer<ClubEventRequestListItemResponseDto> {
  @override
  final Iterable<Type> types = const [ClubEventRequestListItemResponseDto, _$ClubEventRequestListItemResponseDto];

  @override
  final String wireName = r'ClubEventRequestListItemResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ClubEventRequestListItemResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'title';
    yield serializers.serialize(
      object.title,
      specifiedType: const FullType(String),
    );
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(ClubEventRequestListItemResponseDtoStatusEnum),
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
    yield r'location';
    yield serializers.serialize(
      object.location,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ClubEventRequestListItemResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ClubEventRequestListItemResponseDtoBuilder result,
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
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.title = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ClubEventRequestListItemResponseDtoStatusEnum),
          ) as ClubEventRequestListItemResponseDtoStatusEnum;
          result.status = valueDes;
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
        case r'location':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.location = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ClubEventRequestListItemResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ClubEventRequestListItemResponseDtoBuilder();
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

class ClubEventRequestListItemResponseDtoStatusEnum extends EnumClass {

  /// Current status of this request for the club.
  @BuiltValueEnumConst(wireName: r'Pending')
  static const ClubEventRequestListItemResponseDtoStatusEnum pending = _$clubEventRequestListItemResponseDtoStatusEnum_pending;
  /// Current status of this request for the club.
  @BuiltValueEnumConst(wireName: r'Approved')
  static const ClubEventRequestListItemResponseDtoStatusEnum approved = _$clubEventRequestListItemResponseDtoStatusEnum_approved;
  /// Current status of this request for the club.
  @BuiltValueEnumConst(wireName: r'Rejected')
  static const ClubEventRequestListItemResponseDtoStatusEnum rejected = _$clubEventRequestListItemResponseDtoStatusEnum_rejected;

  static Serializer<ClubEventRequestListItemResponseDtoStatusEnum> get serializer => _$clubEventRequestListItemResponseDtoStatusEnumSerializer;

  const ClubEventRequestListItemResponseDtoStatusEnum._(String name): super(name);

  static BuiltSet<ClubEventRequestListItemResponseDtoStatusEnum> get values => _$clubEventRequestListItemResponseDtoStatusEnumValues;
  static ClubEventRequestListItemResponseDtoStatusEnum valueOf(String name) => _$clubEventRequestListItemResponseDtoStatusEnumValueOf(name);
}

