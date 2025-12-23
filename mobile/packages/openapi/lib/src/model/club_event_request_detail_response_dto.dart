//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'club_event_request_detail_response_dto.g.dart';

/// ClubEventRequestDetailResponseDto
///
/// Properties:
/// * [id] - Event request identifier.
/// * [title] - Title of the requested event.
/// * [description] - Description / context of the event.
/// * [eventType] - Type of the event.
/// * [startTime] - Planned start date/time for the event.
/// * [endTime] - Planned end date/time for the event.
/// * [roomId] - If the event is internal, this is the chosen room.
/// * [externalAddress] - If the event is external, this is the chosen location. Mutually exclusive with roomId.
/// * [status] - Current status of the request from the club perspective.
/// * [adminComment] - Admin comment if the request was approved/rejected, shown to the club.
/// * [submittedBy] - Club role of the leader who sent the request. We only show the role to the club.
/// * [submittedAt] - Date/time when the club submitted this request.
@BuiltValue()
abstract class ClubEventRequestDetailResponseDto implements Built<ClubEventRequestDetailResponseDto, ClubEventRequestDetailResponseDtoBuilder> {
  /// Event request identifier.
  @BuiltValueField(wireName: r'id')
  String get id;

  /// Title of the requested event.
  @BuiltValueField(wireName: r'title')
  String get title;

  /// Description / context of the event.
  @BuiltValueField(wireName: r'description')
  String get description;

  /// Type of the event.
  @BuiltValueField(wireName: r'eventType')
  ClubEventRequestDetailResponseDtoEventTypeEnum get eventType;
  // enum eventTypeEnum {  Scientific,  Social,  Entertainment,  National,  Sports,  Artistic,  Other,  };

  /// Planned start date/time for the event.
  @BuiltValueField(wireName: r'startTime')
  DateTime get startTime;

  /// Planned end date/time for the event.
  @BuiltValueField(wireName: r'endTime')
  DateTime get endTime;

  /// If the event is internal, this is the chosen room.
  @BuiltValueField(wireName: r'roomId')
  JsonObject? get roomId;

  /// If the event is external, this is the chosen location. Mutually exclusive with roomId.
  @BuiltValueField(wireName: r'externalAddress')
  JsonObject? get externalAddress;

  /// Current status of the request from the club perspective.
  @BuiltValueField(wireName: r'status')
  ClubEventRequestDetailResponseDtoStatusEnum get status;
  // enum statusEnum {  Pending,  Approved,  Rejected,  };

  /// Admin comment if the request was approved/rejected, shown to the club.
  @BuiltValueField(wireName: r'adminComment')
  JsonObject? get adminComment;

  /// Club role of the leader who sent the request. We only show the role to the club.
  @BuiltValueField(wireName: r'submittedBy')
  JsonObject get submittedBy;

  /// Date/time when the club submitted this request.
  @BuiltValueField(wireName: r'submittedAt')
  DateTime get submittedAt;

  ClubEventRequestDetailResponseDto._();

  factory ClubEventRequestDetailResponseDto([void updates(ClubEventRequestDetailResponseDtoBuilder b)]) = _$ClubEventRequestDetailResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ClubEventRequestDetailResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ClubEventRequestDetailResponseDto> get serializer => _$ClubEventRequestDetailResponseDtoSerializer();
}

class _$ClubEventRequestDetailResponseDtoSerializer implements PrimitiveSerializer<ClubEventRequestDetailResponseDto> {
  @override
  final Iterable<Type> types = const [ClubEventRequestDetailResponseDto, _$ClubEventRequestDetailResponseDto];

  @override
  final String wireName = r'ClubEventRequestDetailResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ClubEventRequestDetailResponseDto object, {
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
    yield r'description';
    yield serializers.serialize(
      object.description,
      specifiedType: const FullType(String),
    );
    yield r'eventType';
    yield serializers.serialize(
      object.eventType,
      specifiedType: const FullType(ClubEventRequestDetailResponseDtoEventTypeEnum),
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
    yield r'roomId';
    yield object.roomId == null ? null : serializers.serialize(
      object.roomId,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'externalAddress';
    yield object.externalAddress == null ? null : serializers.serialize(
      object.externalAddress,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(ClubEventRequestDetailResponseDtoStatusEnum),
    );
    yield r'adminComment';
    yield object.adminComment == null ? null : serializers.serialize(
      object.adminComment,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'submittedBy';
    yield serializers.serialize(
      object.submittedBy,
      specifiedType: const FullType(JsonObject),
    );
    yield r'submittedAt';
    yield serializers.serialize(
      object.submittedAt,
      specifiedType: const FullType(DateTime),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ClubEventRequestDetailResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ClubEventRequestDetailResponseDtoBuilder result,
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
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.description = valueDes;
          break;
        case r'eventType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ClubEventRequestDetailResponseDtoEventTypeEnum),
          ) as ClubEventRequestDetailResponseDtoEventTypeEnum;
          result.eventType = valueDes;
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
        case r'roomId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.roomId = valueDes;
          break;
        case r'externalAddress':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.externalAddress = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ClubEventRequestDetailResponseDtoStatusEnum),
          ) as ClubEventRequestDetailResponseDtoStatusEnum;
          result.status = valueDes;
          break;
        case r'adminComment':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.adminComment = valueDes;
          break;
        case r'submittedBy':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(JsonObject),
          ) as JsonObject;
          result.submittedBy = valueDes;
          break;
        case r'submittedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.submittedAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ClubEventRequestDetailResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ClubEventRequestDetailResponseDtoBuilder();
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

class ClubEventRequestDetailResponseDtoEventTypeEnum extends EnumClass {

  /// Type of the event.
  @BuiltValueEnumConst(wireName: r'Scientific')
  static const ClubEventRequestDetailResponseDtoEventTypeEnum scientific = _$clubEventRequestDetailResponseDtoEventTypeEnum_scientific;
  /// Type of the event.
  @BuiltValueEnumConst(wireName: r'Social')
  static const ClubEventRequestDetailResponseDtoEventTypeEnum social = _$clubEventRequestDetailResponseDtoEventTypeEnum_social;
  /// Type of the event.
  @BuiltValueEnumConst(wireName: r'Entertainment')
  static const ClubEventRequestDetailResponseDtoEventTypeEnum entertainment = _$clubEventRequestDetailResponseDtoEventTypeEnum_entertainment;
  /// Type of the event.
  @BuiltValueEnumConst(wireName: r'National')
  static const ClubEventRequestDetailResponseDtoEventTypeEnum national = _$clubEventRequestDetailResponseDtoEventTypeEnum_national;
  /// Type of the event.
  @BuiltValueEnumConst(wireName: r'Sports')
  static const ClubEventRequestDetailResponseDtoEventTypeEnum sports = _$clubEventRequestDetailResponseDtoEventTypeEnum_sports;
  /// Type of the event.
  @BuiltValueEnumConst(wireName: r'Artistic')
  static const ClubEventRequestDetailResponseDtoEventTypeEnum artistic = _$clubEventRequestDetailResponseDtoEventTypeEnum_artistic;
  /// Type of the event.
  @BuiltValueEnumConst(wireName: r'Other')
  static const ClubEventRequestDetailResponseDtoEventTypeEnum other = _$clubEventRequestDetailResponseDtoEventTypeEnum_other;

  static Serializer<ClubEventRequestDetailResponseDtoEventTypeEnum> get serializer => _$clubEventRequestDetailResponseDtoEventTypeEnumSerializer;

  const ClubEventRequestDetailResponseDtoEventTypeEnum._(String name): super(name);

  static BuiltSet<ClubEventRequestDetailResponseDtoEventTypeEnum> get values => _$clubEventRequestDetailResponseDtoEventTypeEnumValues;
  static ClubEventRequestDetailResponseDtoEventTypeEnum valueOf(String name) => _$clubEventRequestDetailResponseDtoEventTypeEnumValueOf(name);
}

class ClubEventRequestDetailResponseDtoStatusEnum extends EnumClass {

  /// Current status of the request from the club perspective.
  @BuiltValueEnumConst(wireName: r'Pending')
  static const ClubEventRequestDetailResponseDtoStatusEnum pending = _$clubEventRequestDetailResponseDtoStatusEnum_pending;
  /// Current status of the request from the club perspective.
  @BuiltValueEnumConst(wireName: r'Approved')
  static const ClubEventRequestDetailResponseDtoStatusEnum approved = _$clubEventRequestDetailResponseDtoStatusEnum_approved;
  /// Current status of the request from the club perspective.
  @BuiltValueEnumConst(wireName: r'Rejected')
  static const ClubEventRequestDetailResponseDtoStatusEnum rejected = _$clubEventRequestDetailResponseDtoStatusEnum_rejected;

  static Serializer<ClubEventRequestDetailResponseDtoStatusEnum> get serializer => _$clubEventRequestDetailResponseDtoStatusEnumSerializer;

  const ClubEventRequestDetailResponseDtoStatusEnum._(String name): super(name);

  static BuiltSet<ClubEventRequestDetailResponseDtoStatusEnum> get values => _$clubEventRequestDetailResponseDtoStatusEnumValues;
  static ClubEventRequestDetailResponseDtoStatusEnum valueOf(String name) => _$clubEventRequestDetailResponseDtoStatusEnumValueOf(name);
}

