//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'club_event_requests_query_dto.g.dart';

/// ClubEventRequestsQueryDto
///
/// Properties:
/// * [page] - Page number (starting at 1)
/// * [limit] - Items per page
@BuiltValue()
abstract class ClubEventRequestsQueryDto implements Built<ClubEventRequestsQueryDto, ClubEventRequestsQueryDtoBuilder> {
  /// Page number (starting at 1)
  @BuiltValueField(wireName: r'page')
  JsonObject? get page;

  /// Items per page
  @BuiltValueField(wireName: r'limit')
  JsonObject? get limit;

  ClubEventRequestsQueryDto._();

  factory ClubEventRequestsQueryDto([void updates(ClubEventRequestsQueryDtoBuilder b)]) = _$ClubEventRequestsQueryDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ClubEventRequestsQueryDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ClubEventRequestsQueryDto> get serializer => _$ClubEventRequestsQueryDtoSerializer();
}

class _$ClubEventRequestsQueryDtoSerializer implements PrimitiveSerializer<ClubEventRequestsQueryDto> {
  @override
  final Iterable<Type> types = const [ClubEventRequestsQueryDto, _$ClubEventRequestsQueryDto];

  @override
  final String wireName = r'ClubEventRequestsQueryDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ClubEventRequestsQueryDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.page != null) {
      yield r'page';
      yield serializers.serialize(
        object.page,
        specifiedType: const FullType(JsonObject),
      );
    }
    if (object.limit != null) {
      yield r'limit';
      yield serializers.serialize(
        object.limit,
        specifiedType: const FullType(JsonObject),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ClubEventRequestsQueryDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ClubEventRequestsQueryDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'page':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(JsonObject),
          ) as JsonObject;
          result.page = valueDes;
          break;
        case r'limit':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(JsonObject),
          ) as JsonObject;
          result.limit = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ClubEventRequestsQueryDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ClubEventRequestsQueryDtoBuilder();
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

