//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/paginated_response_dto.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'events_get_public_calendar200_response_all_of_data.g.dart';

/// EventsGetPublicCalendar200ResponseAllOfData
///
/// Properties:
/// * [total] - Total number of items available
/// * [page] - Current page number
/// * [limit] - Number of items per page
/// * [totalPages] - Total number of pages
/// * [data] 
@BuiltValue()
abstract class EventsGetPublicCalendar200ResponseAllOfData implements PaginatedResponseDto, Built<EventsGetPublicCalendar200ResponseAllOfData, EventsGetPublicCalendar200ResponseAllOfDataBuilder> {
  EventsGetPublicCalendar200ResponseAllOfData._();

  factory EventsGetPublicCalendar200ResponseAllOfData([void updates(EventsGetPublicCalendar200ResponseAllOfDataBuilder b)]) = _$EventsGetPublicCalendar200ResponseAllOfData;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(EventsGetPublicCalendar200ResponseAllOfDataBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<EventsGetPublicCalendar200ResponseAllOfData> get serializer => _$EventsGetPublicCalendar200ResponseAllOfDataSerializer();
}

class _$EventsGetPublicCalendar200ResponseAllOfDataSerializer implements PrimitiveSerializer<EventsGetPublicCalendar200ResponseAllOfData> {
  @override
  final Iterable<Type> types = const [EventsGetPublicCalendar200ResponseAllOfData, _$EventsGetPublicCalendar200ResponseAllOfData];

  @override
  final String wireName = r'EventsGetPublicCalendar200ResponseAllOfData';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    EventsGetPublicCalendar200ResponseAllOfData object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'limit';
    yield serializers.serialize(
      object.limit,
      specifiedType: const FullType(num),
    );
    yield r'totalPages';
    yield serializers.serialize(
      object.totalPages,
      specifiedType: const FullType(num),
    );
    yield r'total';
    yield serializers.serialize(
      object.total,
      specifiedType: const FullType(num),
    );
    yield r'page';
    yield serializers.serialize(
      object.page,
      specifiedType: const FullType(num),
    );
    yield r'data';
    yield serializers.serialize(
      object.data,
      specifiedType: const FullType(BuiltList, [FullType(BuiltList, [FullType(String)])]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    EventsGetPublicCalendar200ResponseAllOfData object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required EventsGetPublicCalendar200ResponseAllOfDataBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'limit':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.limit = valueDes;
          break;
        case r'totalPages':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.totalPages = valueDes;
          break;
        case r'total':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.total = valueDes;
          break;
        case r'page':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.page = valueDes;
          break;
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(BuiltList, [FullType(String)])]),
          ) as BuiltList<BuiltList<String>>;
          result.data.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  EventsGetPublicCalendar200ResponseAllOfData deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = EventsGetPublicCalendar200ResponseAllOfDataBuilder();
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

