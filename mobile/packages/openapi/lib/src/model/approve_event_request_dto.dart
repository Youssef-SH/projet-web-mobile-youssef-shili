//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'approve_event_request_dto.g.dart';

/// ApproveEventRequestDto
///
/// Properties:
/// * [comment] - Optional admin note / justification, stored on the request and shown to the club.
@BuiltValue()
abstract class ApproveEventRequestDto implements Built<ApproveEventRequestDto, ApproveEventRequestDtoBuilder> {
  /// Optional admin note / justification, stored on the request and shown to the club.
  @BuiltValueField(wireName: r'comment')
  String? get comment;

  ApproveEventRequestDto._();

  factory ApproveEventRequestDto([void updates(ApproveEventRequestDtoBuilder b)]) = _$ApproveEventRequestDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ApproveEventRequestDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ApproveEventRequestDto> get serializer => _$ApproveEventRequestDtoSerializer();
}

class _$ApproveEventRequestDtoSerializer implements PrimitiveSerializer<ApproveEventRequestDto> {
  @override
  final Iterable<Type> types = const [ApproveEventRequestDto, _$ApproveEventRequestDto];

  @override
  final String wireName = r'ApproveEventRequestDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ApproveEventRequestDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.comment != null) {
      yield r'comment';
      yield serializers.serialize(
        object.comment,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ApproveEventRequestDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ApproveEventRequestDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'comment':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.comment = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ApproveEventRequestDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ApproveEventRequestDtoBuilder();
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

