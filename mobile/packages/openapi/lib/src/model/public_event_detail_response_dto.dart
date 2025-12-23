//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'public_event_detail_response_dto.g.dart';

/// PublicEventDetailResponseDto
///
/// Properties:
/// * [id] - Public event identifier.
/// * [title] - Title of the event.
/// * [description] - Longer description / program / context.
/// * [eventType] - Event type/category.
/// * [clubName] - Name of the club organizing the event.
/// * [startTime] - Start time of the event.
/// * [endTime] - End time of the event.
/// * [location] - Location to be displayed to users. Either an internal room name or an external address.
/// * [isCancelled] - Whether the event was cancelled.
@BuiltValue()
abstract class PublicEventDetailResponseDto implements Built<PublicEventDetailResponseDto, PublicEventDetailResponseDtoBuilder> {
  /// Public event identifier.
  @BuiltValueField(wireName: r'id')
  String get id;

  /// Title of the event.
  @BuiltValueField(wireName: r'title')
  String get title;

  /// Longer description / program / context.
  @BuiltValueField(wireName: r'description')
  String get description;

  /// Event type/category.
  @BuiltValueField(wireName: r'eventType')
  PublicEventDetailResponseDtoEventTypeEnum get eventType;
  // enum eventTypeEnum {  Scientific,  Social,  Entertainment,  National,  Sports,  Artistic,  Other,  };

  /// Name of the club organizing the event.
  @BuiltValueField(wireName: r'clubName')
  String get clubName;

  /// Start time of the event.
  @BuiltValueField(wireName: r'startTime')
  DateTime get startTime;

  /// End time of the event.
  @BuiltValueField(wireName: r'endTime')
  DateTime get endTime;

  /// Location to be displayed to users. Either an internal room name or an external address.
  @BuiltValueField(wireName: r'location')
  String get location;

  /// Whether the event was cancelled.
  @BuiltValueField(wireName: r'isCancelled')
  bool get isCancelled;

  PublicEventDetailResponseDto._();

  factory PublicEventDetailResponseDto([void updates(PublicEventDetailResponseDtoBuilder b)]) = _$PublicEventDetailResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PublicEventDetailResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PublicEventDetailResponseDto> get serializer => _$PublicEventDetailResponseDtoSerializer();
}

class _$PublicEventDetailResponseDtoSerializer implements PrimitiveSerializer<PublicEventDetailResponseDto> {
  @override
  final Iterable<Type> types = const [PublicEventDetailResponseDto, _$PublicEventDetailResponseDto];

  @override
  final String wireName = r'PublicEventDetailResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PublicEventDetailResponseDto object, {
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
      specifiedType: const FullType(PublicEventDetailResponseDtoEventTypeEnum),
    );
    yield r'clubName';
    yield serializers.serialize(
      object.clubName,
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
    yield r'location';
    yield serializers.serialize(
      object.location,
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
    PublicEventDetailResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PublicEventDetailResponseDtoBuilder result,
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
            specifiedType: const FullType(PublicEventDetailResponseDtoEventTypeEnum),
          ) as PublicEventDetailResponseDtoEventTypeEnum;
          result.eventType = valueDes;
          break;
        case r'clubName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.clubName = valueDes;
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
  PublicEventDetailResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PublicEventDetailResponseDtoBuilder();
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

class PublicEventDetailResponseDtoEventTypeEnum extends EnumClass {

  /// Event type/category.
  @BuiltValueEnumConst(wireName: r'Scientific')
  static const PublicEventDetailResponseDtoEventTypeEnum scientific = _$publicEventDetailResponseDtoEventTypeEnum_scientific;
  /// Event type/category.
  @BuiltValueEnumConst(wireName: r'Social')
  static const PublicEventDetailResponseDtoEventTypeEnum social = _$publicEventDetailResponseDtoEventTypeEnum_social;
  /// Event type/category.
  @BuiltValueEnumConst(wireName: r'Entertainment')
  static const PublicEventDetailResponseDtoEventTypeEnum entertainment = _$publicEventDetailResponseDtoEventTypeEnum_entertainment;
  /// Event type/category.
  @BuiltValueEnumConst(wireName: r'National')
  static const PublicEventDetailResponseDtoEventTypeEnum national = _$publicEventDetailResponseDtoEventTypeEnum_national;
  /// Event type/category.
  @BuiltValueEnumConst(wireName: r'Sports')
  static const PublicEventDetailResponseDtoEventTypeEnum sports = _$publicEventDetailResponseDtoEventTypeEnum_sports;
  /// Event type/category.
  @BuiltValueEnumConst(wireName: r'Artistic')
  static const PublicEventDetailResponseDtoEventTypeEnum artistic = _$publicEventDetailResponseDtoEventTypeEnum_artistic;
  /// Event type/category.
  @BuiltValueEnumConst(wireName: r'Other')
  static const PublicEventDetailResponseDtoEventTypeEnum other = _$publicEventDetailResponseDtoEventTypeEnum_other;

  static Serializer<PublicEventDetailResponseDtoEventTypeEnum> get serializer => _$publicEventDetailResponseDtoEventTypeEnumSerializer;

  const PublicEventDetailResponseDtoEventTypeEnum._(String name): super(name);

  static BuiltSet<PublicEventDetailResponseDtoEventTypeEnum> get values => _$publicEventDetailResponseDtoEventTypeEnumValues;
  static PublicEventDetailResponseDtoEventTypeEnum valueOf(String name) => _$publicEventDetailResponseDtoEventTypeEnumValueOf(name);
}

