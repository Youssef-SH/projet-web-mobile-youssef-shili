//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_event_request_dto.g.dart';

/// CreateEventRequestDto
///
/// Properties:
/// * [title] - Publicly visible title of the event.
/// * [description] - Detailed description of the event.
/// * [eventType] - Type / category of this event.
/// * [startTime] - Start date/time (ISO 8601, UTC recommended).
/// * [endTime] - End date/time (must be > startTime, checked in service).
/// * [expectedStudents] - Estimated attendance.
/// * [roomId] - Internal room ID (on-campus). Mutually exclusive with externalAddress.
/// * [externalAddress] - External, off-campus location. Mutually exclusive with roomId.
/// * [submittedBy] - Club leader (President / VicePresident) responsible for this request. Must belong to the authenticated club.
@BuiltValue()
abstract class CreateEventRequestDto implements Built<CreateEventRequestDto, CreateEventRequestDtoBuilder> {
  /// Publicly visible title of the event.
  @BuiltValueField(wireName: r'title')
  String get title;

  /// Detailed description of the event.
  @BuiltValueField(wireName: r'description')
  String get description;

  /// Type / category of this event.
  @BuiltValueField(wireName: r'eventType')
  CreateEventRequestDtoEventTypeEnum get eventType;
  // enum eventTypeEnum {  Scientific,  Social,  Entertainment,  National,  Sports,  Artistic,  Other,  };

  /// Start date/time (ISO 8601, UTC recommended).
  @BuiltValueField(wireName: r'startTime')
  DateTime get startTime;

  /// End date/time (must be > startTime, checked in service).
  @BuiltValueField(wireName: r'endTime')
  DateTime get endTime;

  /// Estimated attendance.
  @BuiltValueField(wireName: r'expectedStudents')
  num get expectedStudents;

  /// Internal room ID (on-campus). Mutually exclusive with externalAddress.
  @BuiltValueField(wireName: r'roomId')
  String? get roomId;

  /// External, off-campus location. Mutually exclusive with roomId.
  @BuiltValueField(wireName: r'externalAddress')
  String? get externalAddress;

  /// Club leader (President / VicePresident) responsible for this request. Must belong to the authenticated club.
  @BuiltValueField(wireName: r'submittedBy')
  String get submittedBy;

  CreateEventRequestDto._();

  factory CreateEventRequestDto([void updates(CreateEventRequestDtoBuilder b)]) = _$CreateEventRequestDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateEventRequestDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateEventRequestDto> get serializer => _$CreateEventRequestDtoSerializer();
}

class _$CreateEventRequestDtoSerializer implements PrimitiveSerializer<CreateEventRequestDto> {
  @override
  final Iterable<Type> types = const [CreateEventRequestDto, _$CreateEventRequestDto];

  @override
  final String wireName = r'CreateEventRequestDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateEventRequestDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
      specifiedType: const FullType(CreateEventRequestDtoEventTypeEnum),
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
    if (object.roomId != null) {
      yield r'roomId';
      yield serializers.serialize(
        object.roomId,
        specifiedType: const FullType(String),
      );
    }
    if (object.externalAddress != null) {
      yield r'externalAddress';
      yield serializers.serialize(
        object.externalAddress,
        specifiedType: const FullType(String),
      );
    }
    yield r'submittedBy';
    yield serializers.serialize(
      object.submittedBy,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateEventRequestDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateEventRequestDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
            specifiedType: const FullType(CreateEventRequestDtoEventTypeEnum),
          ) as CreateEventRequestDtoEventTypeEnum;
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
            specifiedType: const FullType(String),
          ) as String;
          result.roomId = valueDes;
          break;
        case r'externalAddress':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.externalAddress = valueDes;
          break;
        case r'submittedBy':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.submittedBy = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateEventRequestDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateEventRequestDtoBuilder();
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

class CreateEventRequestDtoEventTypeEnum extends EnumClass {

  /// Type / category of this event.
  @BuiltValueEnumConst(wireName: r'Scientific')
  static const CreateEventRequestDtoEventTypeEnum scientific = _$createEventRequestDtoEventTypeEnum_scientific;
  /// Type / category of this event.
  @BuiltValueEnumConst(wireName: r'Social')
  static const CreateEventRequestDtoEventTypeEnum social = _$createEventRequestDtoEventTypeEnum_social;
  /// Type / category of this event.
  @BuiltValueEnumConst(wireName: r'Entertainment')
  static const CreateEventRequestDtoEventTypeEnum entertainment = _$createEventRequestDtoEventTypeEnum_entertainment;
  /// Type / category of this event.
  @BuiltValueEnumConst(wireName: r'National')
  static const CreateEventRequestDtoEventTypeEnum national = _$createEventRequestDtoEventTypeEnum_national;
  /// Type / category of this event.
  @BuiltValueEnumConst(wireName: r'Sports')
  static const CreateEventRequestDtoEventTypeEnum sports = _$createEventRequestDtoEventTypeEnum_sports;
  /// Type / category of this event.
  @BuiltValueEnumConst(wireName: r'Artistic')
  static const CreateEventRequestDtoEventTypeEnum artistic = _$createEventRequestDtoEventTypeEnum_artistic;
  /// Type / category of this event.
  @BuiltValueEnumConst(wireName: r'Other')
  static const CreateEventRequestDtoEventTypeEnum other = _$createEventRequestDtoEventTypeEnum_other;

  static Serializer<CreateEventRequestDtoEventTypeEnum> get serializer => _$createEventRequestDtoEventTypeEnumSerializer;

  const CreateEventRequestDtoEventTypeEnum._(String name): super(name);

  static BuiltSet<CreateEventRequestDtoEventTypeEnum> get values => _$createEventRequestDtoEventTypeEnumValues;
  static CreateEventRequestDtoEventTypeEnum valueOf(String name) => _$createEventRequestDtoEventTypeEnumValueOf(name);
}

