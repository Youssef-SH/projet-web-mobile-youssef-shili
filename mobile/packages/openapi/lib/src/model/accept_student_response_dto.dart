//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/accept_student_user_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'accept_student_response_dto.g.dart';

/// AcceptStudentResponseDto
///
/// Properties:
/// * [accessToken] - JWT access token for the new session
/// * [refreshToken] - JWT refresh token used for session renewal
/// * [user] - Details of the created and authenticated student user
@BuiltValue()
abstract class AcceptStudentResponseDto implements Built<AcceptStudentResponseDto, AcceptStudentResponseDtoBuilder> {
  /// JWT access token for the new session
  @BuiltValueField(wireName: r'accessToken')
  String get accessToken;

  /// JWT refresh token used for session renewal
  @BuiltValueField(wireName: r'refreshToken')
  String get refreshToken;

  /// Details of the created and authenticated student user
  @BuiltValueField(wireName: r'user')
  AcceptStudentUserDto get user;

  AcceptStudentResponseDto._();

  factory AcceptStudentResponseDto([void updates(AcceptStudentResponseDtoBuilder b)]) = _$AcceptStudentResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AcceptStudentResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AcceptStudentResponseDto> get serializer => _$AcceptStudentResponseDtoSerializer();
}

class _$AcceptStudentResponseDtoSerializer implements PrimitiveSerializer<AcceptStudentResponseDto> {
  @override
  final Iterable<Type> types = const [AcceptStudentResponseDto, _$AcceptStudentResponseDto];

  @override
  final String wireName = r'AcceptStudentResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AcceptStudentResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'accessToken';
    yield serializers.serialize(
      object.accessToken,
      specifiedType: const FullType(String),
    );
    yield r'refreshToken';
    yield serializers.serialize(
      object.refreshToken,
      specifiedType: const FullType(String),
    );
    yield r'user';
    yield serializers.serialize(
      object.user,
      specifiedType: const FullType(AcceptStudentUserDto),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AcceptStudentResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AcceptStudentResponseDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'accessToken':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.accessToken = valueDes;
          break;
        case r'refreshToken':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.refreshToken = valueDes;
          break;
        case r'user':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AcceptStudentUserDto),
          ) as AcceptStudentUserDto;
          result.user.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AcceptStudentResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AcceptStudentResponseDtoBuilder();
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

