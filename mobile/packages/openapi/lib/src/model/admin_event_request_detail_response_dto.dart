//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/annex_view_dto.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'admin_event_request_detail_response_dto.g.dart';

/// AdminEventRequestDetailResponseDto
///
/// Properties:
/// * [id] - Event request identifier.
/// * [clubId] - Club that submitted this request.
/// * [submittedBy] - Information about the club leader who submitted the request.
/// * [title] - Title of the requested event.
/// * [description] - Description / context of the event.
/// * [eventType] - Type of the event.
/// * [startTime] - Planned start date/time for the event.
/// * [endTime] - Planned end date/time for the event.
/// * [expectedStudents] - Expected number of attendees/students.
/// * [roomId] - Internal room where the event will take place. Mutually exclusive with externalAddress.
/// * [externalAddress] - External address (for off-campus events). Mutually exclusive with roomId.
/// * [status] - Current status of the event request.
/// * [adminComment] - Admin comment associated with the approval/rejection of this request.
/// * [submittedAt] - Date/time when the club submitted this request.
/// * [annexes] - List of annexes attached to this event request.
@BuiltValue()
abstract class AdminEventRequestDetailResponseDto implements Built<AdminEventRequestDetailResponseDto, AdminEventRequestDetailResponseDtoBuilder> {
  /// Event request identifier.
  @BuiltValueField(wireName: r'id')
  String get id;

  /// Club that submitted this request.
  @BuiltValueField(wireName: r'clubId')
  String get clubId;

  /// Information about the club leader who submitted the request.
  @BuiltValueField(wireName: r'submittedBy')
  JsonObject get submittedBy;

  /// Title of the requested event.
  @BuiltValueField(wireName: r'title')
  String get title;

  /// Description / context of the event.
  @BuiltValueField(wireName: r'description')
  String get description;

  /// Type of the event.
  @BuiltValueField(wireName: r'eventType')
  AdminEventRequestDetailResponseDtoEventTypeEnum get eventType;
  // enum eventTypeEnum {  Scientific,  Social,  Entertainment,  National,  Sports,  Artistic,  Other,  };

  /// Planned start date/time for the event.
  @BuiltValueField(wireName: r'startTime')
  DateTime get startTime;

  /// Planned end date/time for the event.
  @BuiltValueField(wireName: r'endTime')
  DateTime get endTime;

  /// Expected number of attendees/students.
  @BuiltValueField(wireName: r'expectedStudents')
  num get expectedStudents;

  /// Internal room where the event will take place. Mutually exclusive with externalAddress.
  @BuiltValueField(wireName: r'roomId')
  JsonObject? get roomId;

  /// External address (for off-campus events). Mutually exclusive with roomId.
  @BuiltValueField(wireName: r'externalAddress')
  JsonObject? get externalAddress;

  /// Current status of the event request.
  @BuiltValueField(wireName: r'status')
  AdminEventRequestDetailResponseDtoStatusEnum get status;
  // enum statusEnum {  Pending,  Approved,  Rejected,  };

  /// Admin comment associated with the approval/rejection of this request.
  @BuiltValueField(wireName: r'adminComment')
  JsonObject? get adminComment;

  /// Date/time when the club submitted this request.
  @BuiltValueField(wireName: r'submittedAt')
  DateTime get submittedAt;

  /// List of annexes attached to this event request.
  @BuiltValueField(wireName: r'annexes')
  BuiltList<AnnexViewDto> get annexes;

  AdminEventRequestDetailResponseDto._();

  factory AdminEventRequestDetailResponseDto([void updates(AdminEventRequestDetailResponseDtoBuilder b)]) = _$AdminEventRequestDetailResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AdminEventRequestDetailResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AdminEventRequestDetailResponseDto> get serializer => _$AdminEventRequestDetailResponseDtoSerializer();
}

class _$AdminEventRequestDetailResponseDtoSerializer implements PrimitiveSerializer<AdminEventRequestDetailResponseDto> {
  @override
  final Iterable<Type> types = const [AdminEventRequestDetailResponseDto, _$AdminEventRequestDetailResponseDto];

  @override
  final String wireName = r'AdminEventRequestDetailResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AdminEventRequestDetailResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'clubId';
    yield serializers.serialize(
      object.clubId,
      specifiedType: const FullType(String),
    );
    yield r'submittedBy';
    yield serializers.serialize(
      object.submittedBy,
      specifiedType: const FullType(JsonObject),
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
      specifiedType: const FullType(AdminEventRequestDetailResponseDtoEventTypeEnum),
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
    yield r'expectedStudents';
    yield serializers.serialize(
      object.expectedStudents,
      specifiedType: const FullType(num),
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
      specifiedType: const FullType(AdminEventRequestDetailResponseDtoStatusEnum),
    );
    yield r'adminComment';
    yield object.adminComment == null ? null : serializers.serialize(
      object.adminComment,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'submittedAt';
    yield serializers.serialize(
      object.submittedAt,
      specifiedType: const FullType(DateTime),
    );
    yield r'annexes';
    yield serializers.serialize(
      object.annexes,
      specifiedType: const FullType(BuiltList, [FullType(AnnexViewDto)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AdminEventRequestDetailResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AdminEventRequestDetailResponseDtoBuilder result,
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
        case r'clubId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.clubId = valueDes;
          break;
        case r'submittedBy':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(JsonObject),
          ) as JsonObject;
          result.submittedBy = valueDes;
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
            specifiedType: const FullType(AdminEventRequestDetailResponseDtoEventTypeEnum),
          ) as AdminEventRequestDetailResponseDtoEventTypeEnum;
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
        case r'expectedStudents':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.expectedStudents = valueDes;
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
            specifiedType: const FullType(AdminEventRequestDetailResponseDtoStatusEnum),
          ) as AdminEventRequestDetailResponseDtoStatusEnum;
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
        case r'submittedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.submittedAt = valueDes;
          break;
        case r'annexes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(AnnexViewDto)]),
          ) as BuiltList<AnnexViewDto>;
          result.annexes.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AdminEventRequestDetailResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AdminEventRequestDetailResponseDtoBuilder();
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

class AdminEventRequestDetailResponseDtoEventTypeEnum extends EnumClass {

  /// Type of the event.
  @BuiltValueEnumConst(wireName: r'Scientific')
  static const AdminEventRequestDetailResponseDtoEventTypeEnum scientific = _$adminEventRequestDetailResponseDtoEventTypeEnum_scientific;
  /// Type of the event.
  @BuiltValueEnumConst(wireName: r'Social')
  static const AdminEventRequestDetailResponseDtoEventTypeEnum social = _$adminEventRequestDetailResponseDtoEventTypeEnum_social;
  /// Type of the event.
  @BuiltValueEnumConst(wireName: r'Entertainment')
  static const AdminEventRequestDetailResponseDtoEventTypeEnum entertainment = _$adminEventRequestDetailResponseDtoEventTypeEnum_entertainment;
  /// Type of the event.
  @BuiltValueEnumConst(wireName: r'National')
  static const AdminEventRequestDetailResponseDtoEventTypeEnum national = _$adminEventRequestDetailResponseDtoEventTypeEnum_national;
  /// Type of the event.
  @BuiltValueEnumConst(wireName: r'Sports')
  static const AdminEventRequestDetailResponseDtoEventTypeEnum sports = _$adminEventRequestDetailResponseDtoEventTypeEnum_sports;
  /// Type of the event.
  @BuiltValueEnumConst(wireName: r'Artistic')
  static const AdminEventRequestDetailResponseDtoEventTypeEnum artistic = _$adminEventRequestDetailResponseDtoEventTypeEnum_artistic;
  /// Type of the event.
  @BuiltValueEnumConst(wireName: r'Other')
  static const AdminEventRequestDetailResponseDtoEventTypeEnum other = _$adminEventRequestDetailResponseDtoEventTypeEnum_other;

  static Serializer<AdminEventRequestDetailResponseDtoEventTypeEnum> get serializer => _$adminEventRequestDetailResponseDtoEventTypeEnumSerializer;

  const AdminEventRequestDetailResponseDtoEventTypeEnum._(String name): super(name);

  static BuiltSet<AdminEventRequestDetailResponseDtoEventTypeEnum> get values => _$adminEventRequestDetailResponseDtoEventTypeEnumValues;
  static AdminEventRequestDetailResponseDtoEventTypeEnum valueOf(String name) => _$adminEventRequestDetailResponseDtoEventTypeEnumValueOf(name);
}

class AdminEventRequestDetailResponseDtoStatusEnum extends EnumClass {

  /// Current status of the event request.
  @BuiltValueEnumConst(wireName: r'Pending')
  static const AdminEventRequestDetailResponseDtoStatusEnum pending = _$adminEventRequestDetailResponseDtoStatusEnum_pending;
  /// Current status of the event request.
  @BuiltValueEnumConst(wireName: r'Approved')
  static const AdminEventRequestDetailResponseDtoStatusEnum approved = _$adminEventRequestDetailResponseDtoStatusEnum_approved;
  /// Current status of the event request.
  @BuiltValueEnumConst(wireName: r'Rejected')
  static const AdminEventRequestDetailResponseDtoStatusEnum rejected = _$adminEventRequestDetailResponseDtoStatusEnum_rejected;

  static Serializer<AdminEventRequestDetailResponseDtoStatusEnum> get serializer => _$adminEventRequestDetailResponseDtoStatusEnumSerializer;

  const AdminEventRequestDetailResponseDtoStatusEnum._(String name): super(name);

  static BuiltSet<AdminEventRequestDetailResponseDtoStatusEnum> get values => _$adminEventRequestDetailResponseDtoStatusEnumValues;
  static AdminEventRequestDetailResponseDtoStatusEnum valueOf(String name) => _$adminEventRequestDetailResponseDtoStatusEnumValueOf(name);
}

