//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/events_get_request200_response_one_of.dart';
import 'package:openapi/src/model/response_error_details.dart';
import 'package:openapi/src/model/events_get_request200_response_one_of1.dart';
import 'package:openapi/src/model/club_event_request_detail_response_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:one_of/one_of.dart';

part 'events_get_request200_response.g.dart';

/// EventsGetRequest200Response
///
/// Properties:
/// * [code] - Machine-readable status code (e.g. OK, CREATED, VALIDATION_ERROR)
/// * [message] - Human readable result summary
/// * [data] 
/// * [error] - Error details for failed operations
/// * [requestId] - Correlation ID for tracing
/// * [timestamp] - Timestamp (UTC) for the response
@BuiltValue()
abstract class EventsGetRequest200Response implements Built<EventsGetRequest200Response, EventsGetRequest200ResponseBuilder> {
  /// One Of [EventsGetRequest200ResponseOneOf], [EventsGetRequest200ResponseOneOf1]
  OneOf get oneOf;

  EventsGetRequest200Response._();

  factory EventsGetRequest200Response([void updates(EventsGetRequest200ResponseBuilder b)]) = _$EventsGetRequest200Response;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(EventsGetRequest200ResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<EventsGetRequest200Response> get serializer => _$EventsGetRequest200ResponseSerializer();
}

class _$EventsGetRequest200ResponseSerializer implements PrimitiveSerializer<EventsGetRequest200Response> {
  @override
  final Iterable<Type> types = const [EventsGetRequest200Response, _$EventsGetRequest200Response];

  @override
  final String wireName = r'EventsGetRequest200Response';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    EventsGetRequest200Response object) sync* {
  }

  @override
  Object serialize(
    Serializers serializers,
    EventsGetRequest200Response object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final oneOf = object.oneOf;
    return serializers.serialize(oneOf.value, specifiedType: FullType(oneOf.valueType))!;
  }

  @override
  EventsGetRequest200Response deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = EventsGetRequest200ResponseBuilder();
    Object? oneOfDataSrc;
    final targetType = const FullType(OneOf, [FullType(EventsGetRequest200ResponseOneOf), FullType(EventsGetRequest200ResponseOneOf1), ]);
    oneOfDataSrc = serialized;
    result.oneOf = serializers.deserialize(oneOfDataSrc, specifiedType: targetType) as OneOf;
    return result.build();
  }
}

