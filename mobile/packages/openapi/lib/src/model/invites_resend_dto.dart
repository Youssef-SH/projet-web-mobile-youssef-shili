//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'invites_resend_dto.g.dart';

/// InvitesResendDto
///
/// Properties:
/// * [emails] 
@BuiltValue()
abstract class InvitesResendDto implements Built<InvitesResendDto, InvitesResendDtoBuilder> {
  @BuiltValueField(wireName: r'emails')
  BuiltList<String> get emails;

  InvitesResendDto._();

  factory InvitesResendDto([void updates(InvitesResendDtoBuilder b)]) = _$InvitesResendDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(InvitesResendDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<InvitesResendDto> get serializer => _$InvitesResendDtoSerializer();
}

class _$InvitesResendDtoSerializer implements PrimitiveSerializer<InvitesResendDto> {
  @override
  final Iterable<Type> types = const [InvitesResendDto, _$InvitesResendDto];

  @override
  final String wireName = r'InvitesResendDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    InvitesResendDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'emails';
    yield serializers.serialize(
      object.emails,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    InvitesResendDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required InvitesResendDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'emails':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.emails.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  InvitesResendDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = InvitesResendDtoBuilder();
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

