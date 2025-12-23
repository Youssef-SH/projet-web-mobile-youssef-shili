//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'response_error_details.g.dart';

/// ResponseErrorDetails
///
/// Properties:
/// * [details] - Field-level error details (if applicable)
@BuiltValue()
abstract class ResponseErrorDetails implements Built<ResponseErrorDetails, ResponseErrorDetailsBuilder> {
  /// Field-level error details (if applicable)
  @BuiltValueField(wireName: r'details')
  JsonObject? get details;

  ResponseErrorDetails._();

  factory ResponseErrorDetails([void updates(ResponseErrorDetailsBuilder b)]) = _$ResponseErrorDetails;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ResponseErrorDetailsBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ResponseErrorDetails> get serializer => _$ResponseErrorDetailsSerializer();
}

class _$ResponseErrorDetailsSerializer implements PrimitiveSerializer<ResponseErrorDetails> {
  @override
  final Iterable<Type> types = const [ResponseErrorDetails, _$ResponseErrorDetails];

  @override
  final String wireName = r'ResponseErrorDetails';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ResponseErrorDetails object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.details != null) {
      yield r'details';
      yield serializers.serialize(
        object.details,
        specifiedType: const FullType(JsonObject),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ResponseErrorDetails object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ResponseErrorDetailsBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'details':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(JsonObject),
          ) as JsonObject;
          result.details = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ResponseErrorDetails deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ResponseErrorDetailsBuilder();
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

