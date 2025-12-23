//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'admin_event_request_list_item_response_dto.g.dart';

/// AdminEventRequestListItemResponseDto
///
/// Properties:
/// * [id] - Event request identifier.
/// * [title] - Title of the requested event.
/// * [eventType] - Type/category of the event.
/// * [clubName] - Name of the club that submitted the request.
/// * [status] - Current workflow status of the request.
/// * [startTime] - Event start time (from the request).
/// * [endTime] - Event end time (from the request).
/// * [submittedAt] - When this request was submitted by the club.
/// * [submittedByRole] - Role of the club leader who submitted the request. Exposed here to let admin see accountability level without PII.
@BuiltValue()
abstract class AdminEventRequestListItemResponseDto implements Built<AdminEventRequestListItemResponseDto, AdminEventRequestListItemResponseDtoBuilder> {
  /// Event request identifier.
  @BuiltValueField(wireName: r'id')
  String get id;

  /// Title of the requested event.
  @BuiltValueField(wireName: r'title')
  String get title;

  /// Type/category of the event.
  @BuiltValueField(wireName: r'eventType')
  AdminEventRequestListItemResponseDtoEventTypeEnum get eventType;
  // enum eventTypeEnum {  Scientific,  Social,  Entertainment,  National,  Sports,  Artistic,  Other,  };

  /// Name of the club that submitted the request.
  @BuiltValueField(wireName: r'clubName')
  String get clubName;

  /// Current workflow status of the request.
  @BuiltValueField(wireName: r'status')
  AdminEventRequestListItemResponseDtoStatusEnum get status;
  // enum statusEnum {  Pending,  Approved,  Rejected,  };

  /// Event start time (from the request).
  @BuiltValueField(wireName: r'startTime')
  DateTime get startTime;

  /// Event end time (from the request).
  @BuiltValueField(wireName: r'endTime')
  DateTime get endTime;

  /// When this request was submitted by the club.
  @BuiltValueField(wireName: r'submittedAt')
  DateTime get submittedAt;

  /// Role of the club leader who submitted the request. Exposed here to let admin see accountability level without PII.
  @BuiltValueField(wireName: r'submittedByRole')
  AdminEventRequestListItemResponseDtoSubmittedByRoleEnum get submittedByRole;
  // enum submittedByRoleEnum {  President,  VicePresident,  };

  AdminEventRequestListItemResponseDto._();

  factory AdminEventRequestListItemResponseDto([void updates(AdminEventRequestListItemResponseDtoBuilder b)]) = _$AdminEventRequestListItemResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AdminEventRequestListItemResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AdminEventRequestListItemResponseDto> get serializer => _$AdminEventRequestListItemResponseDtoSerializer();
}

class _$AdminEventRequestListItemResponseDtoSerializer implements PrimitiveSerializer<AdminEventRequestListItemResponseDto> {
  @override
  final Iterable<Type> types = const [AdminEventRequestListItemResponseDto, _$AdminEventRequestListItemResponseDto];

  @override
  final String wireName = r'AdminEventRequestListItemResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AdminEventRequestListItemResponseDto object, {
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
    yield r'eventType';
    yield serializers.serialize(
      object.eventType,
      specifiedType: const FullType(AdminEventRequestListItemResponseDtoEventTypeEnum),
    );
    yield r'clubName';
    yield serializers.serialize(
      object.clubName,
      specifiedType: const FullType(String),
    );
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(AdminEventRequestListItemResponseDtoStatusEnum),
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
    yield r'submittedAt';
    yield serializers.serialize(
      object.submittedAt,
      specifiedType: const FullType(DateTime),
    );
    yield r'submittedByRole';
    yield serializers.serialize(
      object.submittedByRole,
      specifiedType: const FullType(AdminEventRequestListItemResponseDtoSubmittedByRoleEnum),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AdminEventRequestListItemResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AdminEventRequestListItemResponseDtoBuilder result,
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
        case r'eventType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AdminEventRequestListItemResponseDtoEventTypeEnum),
          ) as AdminEventRequestListItemResponseDtoEventTypeEnum;
          result.eventType = valueDes;
          break;
        case r'clubName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.clubName = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AdminEventRequestListItemResponseDtoStatusEnum),
          ) as AdminEventRequestListItemResponseDtoStatusEnum;
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
        case r'submittedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.submittedAt = valueDes;
          break;
        case r'submittedByRole':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AdminEventRequestListItemResponseDtoSubmittedByRoleEnum),
          ) as AdminEventRequestListItemResponseDtoSubmittedByRoleEnum;
          result.submittedByRole = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AdminEventRequestListItemResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AdminEventRequestListItemResponseDtoBuilder();
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

class AdminEventRequestListItemResponseDtoEventTypeEnum extends EnumClass {

  /// Type/category of the event.
  @BuiltValueEnumConst(wireName: r'Scientific')
  static const AdminEventRequestListItemResponseDtoEventTypeEnum scientific = _$adminEventRequestListItemResponseDtoEventTypeEnum_scientific;
  /// Type/category of the event.
  @BuiltValueEnumConst(wireName: r'Social')
  static const AdminEventRequestListItemResponseDtoEventTypeEnum social = _$adminEventRequestListItemResponseDtoEventTypeEnum_social;
  /// Type/category of the event.
  @BuiltValueEnumConst(wireName: r'Entertainment')
  static const AdminEventRequestListItemResponseDtoEventTypeEnum entertainment = _$adminEventRequestListItemResponseDtoEventTypeEnum_entertainment;
  /// Type/category of the event.
  @BuiltValueEnumConst(wireName: r'National')
  static const AdminEventRequestListItemResponseDtoEventTypeEnum national = _$adminEventRequestListItemResponseDtoEventTypeEnum_national;
  /// Type/category of the event.
  @BuiltValueEnumConst(wireName: r'Sports')
  static const AdminEventRequestListItemResponseDtoEventTypeEnum sports = _$adminEventRequestListItemResponseDtoEventTypeEnum_sports;
  /// Type/category of the event.
  @BuiltValueEnumConst(wireName: r'Artistic')
  static const AdminEventRequestListItemResponseDtoEventTypeEnum artistic = _$adminEventRequestListItemResponseDtoEventTypeEnum_artistic;
  /// Type/category of the event.
  @BuiltValueEnumConst(wireName: r'Other')
  static const AdminEventRequestListItemResponseDtoEventTypeEnum other = _$adminEventRequestListItemResponseDtoEventTypeEnum_other;

  static Serializer<AdminEventRequestListItemResponseDtoEventTypeEnum> get serializer => _$adminEventRequestListItemResponseDtoEventTypeEnumSerializer;

  const AdminEventRequestListItemResponseDtoEventTypeEnum._(String name): super(name);

  static BuiltSet<AdminEventRequestListItemResponseDtoEventTypeEnum> get values => _$adminEventRequestListItemResponseDtoEventTypeEnumValues;
  static AdminEventRequestListItemResponseDtoEventTypeEnum valueOf(String name) => _$adminEventRequestListItemResponseDtoEventTypeEnumValueOf(name);
}

class AdminEventRequestListItemResponseDtoStatusEnum extends EnumClass {

  /// Current workflow status of the request.
  @BuiltValueEnumConst(wireName: r'Pending')
  static const AdminEventRequestListItemResponseDtoStatusEnum pending = _$adminEventRequestListItemResponseDtoStatusEnum_pending;
  /// Current workflow status of the request.
  @BuiltValueEnumConst(wireName: r'Approved')
  static const AdminEventRequestListItemResponseDtoStatusEnum approved = _$adminEventRequestListItemResponseDtoStatusEnum_approved;
  /// Current workflow status of the request.
  @BuiltValueEnumConst(wireName: r'Rejected')
  static const AdminEventRequestListItemResponseDtoStatusEnum rejected = _$adminEventRequestListItemResponseDtoStatusEnum_rejected;

  static Serializer<AdminEventRequestListItemResponseDtoStatusEnum> get serializer => _$adminEventRequestListItemResponseDtoStatusEnumSerializer;

  const AdminEventRequestListItemResponseDtoStatusEnum._(String name): super(name);

  static BuiltSet<AdminEventRequestListItemResponseDtoStatusEnum> get values => _$adminEventRequestListItemResponseDtoStatusEnumValues;
  static AdminEventRequestListItemResponseDtoStatusEnum valueOf(String name) => _$adminEventRequestListItemResponseDtoStatusEnumValueOf(name);
}

class AdminEventRequestListItemResponseDtoSubmittedByRoleEnum extends EnumClass {

  /// Role of the club leader who submitted the request. Exposed here to let admin see accountability level without PII.
  @BuiltValueEnumConst(wireName: r'President')
  static const AdminEventRequestListItemResponseDtoSubmittedByRoleEnum president = _$adminEventRequestListItemResponseDtoSubmittedByRoleEnum_president;
  /// Role of the club leader who submitted the request. Exposed here to let admin see accountability level without PII.
  @BuiltValueEnumConst(wireName: r'VicePresident')
  static const AdminEventRequestListItemResponseDtoSubmittedByRoleEnum vicePresident = _$adminEventRequestListItemResponseDtoSubmittedByRoleEnum_vicePresident;

  static Serializer<AdminEventRequestListItemResponseDtoSubmittedByRoleEnum> get serializer => _$adminEventRequestListItemResponseDtoSubmittedByRoleEnumSerializer;

  const AdminEventRequestListItemResponseDtoSubmittedByRoleEnum._(String name): super(name);

  static BuiltSet<AdminEventRequestListItemResponseDtoSubmittedByRoleEnum> get values => _$adminEventRequestListItemResponseDtoSubmittedByRoleEnumValues;
  static AdminEventRequestListItemResponseDtoSubmittedByRoleEnum valueOf(String name) => _$adminEventRequestListItemResponseDtoSubmittedByRoleEnumValueOf(name);
}

