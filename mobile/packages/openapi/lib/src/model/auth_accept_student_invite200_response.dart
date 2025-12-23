//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/api_response_dto.dart';
import 'package:openapi/src/model/response_error_details.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'auth_accept_student_invite200_response.g.dart';

/// AuthAcceptStudentInvite200Response
///
/// Properties:
/// * [code] 
/// * [message] 
/// * [data] 
/// * [error] - Error details for failed operations
/// * [requestId] - Correlation ID for tracing
/// * [timestamp] - Timestamp (UTC) for the response
@BuiltValue()
abstract class AuthAcceptStudentInvite200Response implements ApiResponseDto, Built<AuthAcceptStudentInvite200Response, AuthAcceptStudentInvite200ResponseBuilder> {
  AuthAcceptStudentInvite200Response._();

  factory AuthAcceptStudentInvite200Response([void updates(AuthAcceptStudentInvite200ResponseBuilder b)]) = _$AuthAcceptStudentInvite200Response;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AuthAcceptStudentInvite200ResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AuthAcceptStudentInvite200Response> get serializer => _$AuthAcceptStudentInvite200ResponseSerializer();
}

class _$AuthAcceptStudentInvite200ResponseSerializer implements PrimitiveSerializer<AuthAcceptStudentInvite200Response> {
  @override
  final Iterable<Type> types = const [AuthAcceptStudentInvite200Response, _$AuthAcceptStudentInvite200Response];

  @override
  final String wireName = r'AuthAcceptStudentInvite200Response';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AuthAcceptStudentInvite200Response object, {
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
    AuthAcceptStudentInvite200Response object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AuthAcceptStudentInvite200ResponseBuilder result,
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
  AuthAcceptStudentInvite200Response deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AuthAcceptStudentInvite200ResponseBuilder();
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

