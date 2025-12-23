//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'accept_student_invite_dto.g.dart';

/// AcceptStudentInviteDto
///
/// Properties:
/// * [token] 
/// * [fullName] 
/// * [password] 
@BuiltValue()
abstract class AcceptStudentInviteDto implements Built<AcceptStudentInviteDto, AcceptStudentInviteDtoBuilder> {
  @BuiltValueField(wireName: r'token')
  String get token;

  @BuiltValueField(wireName: r'fullName')
  String get fullName;

  @BuiltValueField(wireName: r'password')
  String get password;

  AcceptStudentInviteDto._();

  factory AcceptStudentInviteDto([void updates(AcceptStudentInviteDtoBuilder b)]) = _$AcceptStudentInviteDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AcceptStudentInviteDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AcceptStudentInviteDto> get serializer => _$AcceptStudentInviteDtoSerializer();
}

class _$AcceptStudentInviteDtoSerializer implements PrimitiveSerializer<AcceptStudentInviteDto> {
  @override
  final Iterable<Type> types = const [AcceptStudentInviteDto, _$AcceptStudentInviteDto];

  @override
  final String wireName = r'AcceptStudentInviteDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AcceptStudentInviteDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'token';
    yield serializers.serialize(
      object.token,
      specifiedType: const FullType(String),
    );
    yield r'fullName';
    yield serializers.serialize(
      object.fullName,
      specifiedType: const FullType(String),
    );
    yield r'password';
    yield serializers.serialize(
      object.password,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AcceptStudentInviteDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AcceptStudentInviteDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'token':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.token = valueDes;
          break;
        case r'fullName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.fullName = valueDes;
          break;
        case r'password':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.password = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AcceptStudentInviteDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AcceptStudentInviteDtoBuilder();
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

