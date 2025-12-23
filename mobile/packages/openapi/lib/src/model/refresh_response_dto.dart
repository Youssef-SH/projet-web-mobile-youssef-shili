//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'refresh_response_dto.g.dart';

/// RefreshResponseDto
///
/// Properties:
/// * [accessToken] - Newly issued access token for authenticated API calls
/// * [refreshToken] - Newly issued refresh token to obtain future access tokens
@BuiltValue()
abstract class RefreshResponseDto implements Built<RefreshResponseDto, RefreshResponseDtoBuilder> {
  /// Newly issued access token for authenticated API calls
  @BuiltValueField(wireName: r'accessToken')
  String get accessToken;

  /// Newly issued refresh token to obtain future access tokens
  @BuiltValueField(wireName: r'refreshToken')
  String get refreshToken;

  RefreshResponseDto._();

  factory RefreshResponseDto([void updates(RefreshResponseDtoBuilder b)]) = _$RefreshResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RefreshResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RefreshResponseDto> get serializer => _$RefreshResponseDtoSerializer();
}

class _$RefreshResponseDtoSerializer implements PrimitiveSerializer<RefreshResponseDto> {
  @override
  final Iterable<Type> types = const [RefreshResponseDto, _$RefreshResponseDto];

  @override
  final String wireName = r'RefreshResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RefreshResponseDto object, {
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
  }

  @override
  Object serialize(
    Serializers serializers,
    RefreshResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required RefreshResponseDtoBuilder result,
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  RefreshResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RefreshResponseDtoBuilder();
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

