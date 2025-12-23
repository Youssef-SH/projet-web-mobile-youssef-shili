//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'public_event_list_item_response_dto.g.dart';

/// PublicEventListItemResponseDto
///
/// Properties:
/// * [id] - Public event identifier.
/// * [title] - Title of the event.
/// * [clubName] - Name of the organizing club.
/// * [startTime] - Start time of the event.
/// * [endTime] - End time of the event.
/// * [location] - Location to be displayed to users. Either an internal room name or an external address.
/// * [isCancelled] - Whether this event was cancelled. Cancelled events are still returned.
/// * [description] - Short description to show under the title in calendar/list.
@BuiltValue()
abstract class PublicEventListItemResponseDto implements Built<PublicEventListItemResponseDto, PublicEventListItemResponseDtoBuilder> {
  /// Public event identifier.
  @BuiltValueField(wireName: r'id')
  String get id;

  /// Title of the event.
  @BuiltValueField(wireName: r'title')
  String get title;

  /// Name of the organizing club.
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

  /// Whether this event was cancelled. Cancelled events are still returned.
  @BuiltValueField(wireName: r'isCancelled')
  bool get isCancelled;

  /// Short description to show under the title in calendar/list.
  @BuiltValueField(wireName: r'description')
  String get description;

  PublicEventListItemResponseDto._();

  factory PublicEventListItemResponseDto([void updates(PublicEventListItemResponseDtoBuilder b)]) = _$PublicEventListItemResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PublicEventListItemResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PublicEventListItemResponseDto> get serializer => _$PublicEventListItemResponseDtoSerializer();
}

class _$PublicEventListItemResponseDtoSerializer implements PrimitiveSerializer<PublicEventListItemResponseDto> {
  @override
  final Iterable<Type> types = const [PublicEventListItemResponseDto, _$PublicEventListItemResponseDto];

  @override
  final String wireName = r'PublicEventListItemResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PublicEventListItemResponseDto object, {
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
    yield r'description';
    yield serializers.serialize(
      object.description,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PublicEventListItemResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PublicEventListItemResponseDtoBuilder result,
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
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.description = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PublicEventListItemResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PublicEventListItemResponseDtoBuilder();
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

