//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'change_password_response_dto.g.dart';

/// ChangePasswordResponseDto
///
/// Properties:
/// * [ok] - Indicates whether the password was updated successfully.
/// * [message] - Confirmation message describing the result of the operation.
@BuiltValue()
abstract class ChangePasswordResponseDto implements Built<ChangePasswordResponseDto, ChangePasswordResponseDtoBuilder> {
  /// Indicates whether the password was updated successfully.
  @BuiltValueField(wireName: r'ok')
  bool get ok;

  /// Confirmation message describing the result of the operation.
  @BuiltValueField(wireName: r'message')
  String get message;

  ChangePasswordResponseDto._();

  factory ChangePasswordResponseDto([void updates(ChangePasswordResponseDtoBuilder b)]) = _$ChangePasswordResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ChangePasswordResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ChangePasswordResponseDto> get serializer => _$ChangePasswordResponseDtoSerializer();
}

class _$ChangePasswordResponseDtoSerializer implements PrimitiveSerializer<ChangePasswordResponseDto> {
  @override
  final Iterable<Type> types = const [ChangePasswordResponseDto, _$ChangePasswordResponseDto];

  @override
  final String wireName = r'ChangePasswordResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ChangePasswordResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'ok';
    yield serializers.serialize(
      object.ok,
      specifiedType: const FullType(bool),
    );
    yield r'message';
    yield serializers.serialize(
      object.message,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ChangePasswordResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ChangePasswordResponseDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'ok':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.ok = valueDes;
          break;
        case r'message':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.message = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ChangePasswordResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ChangePasswordResponseDtoBuilder();
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

