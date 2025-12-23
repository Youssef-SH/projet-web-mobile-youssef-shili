//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/json_object.dart';
import 'package:openapi/src/model/api_response_dto.dart';
import 'package:openapi/src/model/response_error_details.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'clubs_get_leaders200_response.g.dart';

/// ClubsGetLeaders200Response
///
/// Properties:
/// * [code] - Machine-readable status code (e.g. OK, CREATED, VALIDATION_ERROR)
/// * [message] - Human readable result summary
/// * [data] 
/// * [error] - Error details for failed operations
/// * [requestId] - Correlation ID for tracing
/// * [timestamp] - Timestamp (UTC) for the response
@BuiltValue()
abstract class ClubsGetLeaders200Response implements ApiResponseDto, Built<ClubsGetLeaders200Response, ClubsGetLeaders200ResponseBuilder> {
  ClubsGetLeaders200Response._();

  factory ClubsGetLeaders200Response([void updates(ClubsGetLeaders200ResponseBuilder b)]) = _$ClubsGetLeaders200Response;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ClubsGetLeaders200ResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ClubsGetLeaders200Response> get serializer => _$ClubsGetLeaders200ResponseSerializer();
}

class _$ClubsGetLeaders200ResponseSerializer implements PrimitiveSerializer<ClubsGetLeaders200Response> {
  @override
  final Iterable<Type> types = const [ClubsGetLeaders200Response, _$ClubsGetLeaders200Response];

  @override
  final String wireName = r'ClubsGetLeaders200Response';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ClubsGetLeaders200Response object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'code';
    yield serializers.serialize(
      object.code,
      specifiedType: const FullType(String),
    );
    if (object.data != null) {
      yield r'data';
      yield serializers.serialize(
        object.data,
        specifiedType: const FullType.nullable(JsonObject),
      );
    }
    yield r'message';
    yield serializers.serialize(
      object.message,
      specifiedType: const FullType(String),
    );
    if (object.error != null) {
      yield r'error';
      yield serializers.serialize(
        object.error,
        specifiedType: const FullType.nullable(ResponseErrorDetails),
      );
    }
    yield r'requestId';
    yield serializers.serialize(
      object.requestId,
      specifiedType: const FullType(String),
    );
    yield r'timestamp';
    yield serializers.serialize(
      object.timestamp,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ClubsGetLeaders200Response object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ClubsGetLeaders200ResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.code = valueDes;
          break;
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.data = valueDes;
          break;
        case r'message':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.message = valueDes;
          break;
        case r'error':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(ResponseErrorDetails),
          ) as ResponseErrorDetails?;
          if (valueDes == null) continue;
          result.error.replace(valueDes);
          break;
        case r'requestId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.requestId = valueDes;
          break;
        case r'timestamp':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.timestamp = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ClubsGetLeaders200Response deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ClubsGetLeaders200ResponseBuilder();
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

