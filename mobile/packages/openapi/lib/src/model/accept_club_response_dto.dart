//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/accept_club_user_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'accept_club_response_dto.g.dart';

/// AcceptClubResponseDto
///
/// Properties:
/// * [accessToken] - JWT access token for the newly created club session
/// * [refreshToken] - JWT refresh token for renewing the club session
/// * [user] - Details of the authenticated club user after invite acceptance
@BuiltValue()
abstract class AcceptClubResponseDto implements Built<AcceptClubResponseDto, AcceptClubResponseDtoBuilder> {
  /// JWT access token for the newly created club session
  @BuiltValueField(wireName: r'accessToken')
  String get accessToken;

  /// JWT refresh token for renewing the club session
  @BuiltValueField(wireName: r'refreshToken')
  String get refreshToken;

  /// Details of the authenticated club user after invite acceptance
  @BuiltValueField(wireName: r'user')
  AcceptClubUserDto get user;

  AcceptClubResponseDto._();

  factory AcceptClubResponseDto([void updates(AcceptClubResponseDtoBuilder b)]) = _$AcceptClubResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AcceptClubResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AcceptClubResponseDto> get serializer => _$AcceptClubResponseDtoSerializer();
}

class _$AcceptClubResponseDtoSerializer implements PrimitiveSerializer<AcceptClubResponseDto> {
  @override
  final Iterable<Type> types = const [AcceptClubResponseDto, _$AcceptClubResponseDto];

  @override
  final String wireName = r'AcceptClubResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AcceptClubResponseDto object, {
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
      specifiedType: const FullType(AcceptClubUserDto),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AcceptClubResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AcceptClubResponseDtoBuilder result,
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
            specifiedType: const FullType(AcceptClubUserDto),
          ) as AcceptClubUserDto;
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
  AcceptClubResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AcceptClubResponseDtoBuilder();
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

