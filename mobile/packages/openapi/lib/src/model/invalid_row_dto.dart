//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'invalid_row_dto.g.dart';

/// InvalidRowDto
///
/// Properties:
/// * [row] - Row number in the CSV where the error occurred
/// * [email] - Invalid email found in the row
/// * [reason] - Reason for rejecting the row
@BuiltValue()
abstract class InvalidRowDto implements Built<InvalidRowDto, InvalidRowDtoBuilder> {
  /// Row number in the CSV where the error occurred
  @BuiltValueField(wireName: r'row')
  num get row;

  /// Invalid email found in the row
  @BuiltValueField(wireName: r'email')
  String get email;

  /// Reason for rejecting the row
  @BuiltValueField(wireName: r'reason')
  String get reason;

  InvalidRowDto._();

  factory InvalidRowDto([void updates(InvalidRowDtoBuilder b)]) = _$InvalidRowDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(InvalidRowDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<InvalidRowDto> get serializer => _$InvalidRowDtoSerializer();
}

class _$InvalidRowDtoSerializer implements PrimitiveSerializer<InvalidRowDto> {
  @override
  final Iterable<Type> types = const [InvalidRowDto, _$InvalidRowDto];

  @override
  final String wireName = r'InvalidRowDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    InvalidRowDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'row';
    yield serializers.serialize(
      object.row,
      specifiedType: const FullType(num),
    );
    yield r'email';
    yield serializers.serialize(
      object.email,
      specifiedType: const FullType(String),
    );
    yield r'reason';
    yield serializers.serialize(
      object.reason,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    InvalidRowDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required InvalidRowDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'row':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.row = valueDes;
          break;
        case r'email':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.email = valueDes;
          break;
        case r'reason':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.reason = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  InvalidRowDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = InvalidRowDtoBuilder();
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

