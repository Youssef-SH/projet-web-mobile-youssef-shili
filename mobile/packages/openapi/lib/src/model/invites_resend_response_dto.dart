//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'invites_resend_response_dto.g.dart';

/// InvitesResendResponseDto
///
/// Properties:
/// * [accepted] - Number of invite emails successfully resent
/// * [failed] - Number of invite emails that failed to resend (invalid, expired, or already accepted)
@BuiltValue()
abstract class InvitesResendResponseDto implements Built<InvitesResendResponseDto, InvitesResendResponseDtoBuilder> {
  /// Number of invite emails successfully resent
  @BuiltValueField(wireName: r'accepted')
  num get accepted;

  /// Number of invite emails that failed to resend (invalid, expired, or already accepted)
  @BuiltValueField(wireName: r'failed')
  num get failed;

  InvitesResendResponseDto._();

  factory InvitesResendResponseDto([void updates(InvitesResendResponseDtoBuilder b)]) = _$InvitesResendResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(InvitesResendResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<InvitesResendResponseDto> get serializer => _$InvitesResendResponseDtoSerializer();
}

class _$InvitesResendResponseDtoSerializer implements PrimitiveSerializer<InvitesResendResponseDto> {
  @override
  final Iterable<Type> types = const [InvitesResendResponseDto, _$InvitesResendResponseDto];

  @override
  final String wireName = r'InvitesResendResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    InvitesResendResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'accepted';
    yield serializers.serialize(
      object.accepted,
      specifiedType: const FullType(num),
    );
    yield r'failed';
    yield serializers.serialize(
      object.failed,
      specifiedType: const FullType(num),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    InvitesResendResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required InvitesResendResponseDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'accepted':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.accepted = valueDes;
          break;
        case r'failed':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.failed = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  InvitesResendResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = InvitesResendResponseDtoBuilder();
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

