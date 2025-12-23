//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'reject_event_request_dto.g.dart';

/// RejectEventRequestDto
///
/// Properties:
/// * [comment] - Reason why this event request was rejected. Shown to the club on detail view.
@BuiltValue()
abstract class RejectEventRequestDto implements Built<RejectEventRequestDto, RejectEventRequestDtoBuilder> {
  /// Reason why this event request was rejected. Shown to the club on detail view.
  @BuiltValueField(wireName: r'comment')
  String get comment;

  RejectEventRequestDto._();

  factory RejectEventRequestDto([void updates(RejectEventRequestDtoBuilder b)]) = _$RejectEventRequestDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RejectEventRequestDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RejectEventRequestDto> get serializer => _$RejectEventRequestDtoSerializer();
}

class _$RejectEventRequestDtoSerializer implements PrimitiveSerializer<RejectEventRequestDto> {
  @override
  final Iterable<Type> types = const [RejectEventRequestDto, _$RejectEventRequestDto];

  @override
  final String wireName = r'RejectEventRequestDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RejectEventRequestDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'comment';
    yield serializers.serialize(
      object.comment,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    RejectEventRequestDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required RejectEventRequestDtoBuilder result,
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
  RejectEventRequestDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RejectEventRequestDtoBuilder();
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

