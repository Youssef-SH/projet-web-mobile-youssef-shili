//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'accept_student_user_dto.g.dart';

/// AcceptStudentUserDto
///
/// Properties:
/// * [id] - Unique identifier of the newly created student user
/// * [email] - Email address associated with the new student account
/// * [role] - Role assigned to the user within the platform
/// * [fullName] - Full name of the student
@BuiltValue()
abstract class AcceptStudentUserDto implements Built<AcceptStudentUserDto, AcceptStudentUserDtoBuilder> {
  /// Unique identifier of the newly created student user
  @BuiltValueField(wireName: r'id')
  String get id;

  /// Email address associated with the new student account
  @BuiltValueField(wireName: r'email')
  String get email;

  /// Role assigned to the user within the platform
  @BuiltValueField(wireName: r'role')
  AcceptStudentUserDtoRoleEnum get role;
  // enum roleEnum {  Student,  Club,  Admin,  };

  /// Full name of the student
  @BuiltValueField(wireName: r'fullName')
  JsonObject? get fullName;

  AcceptStudentUserDto._();

  factory AcceptStudentUserDto([void updates(AcceptStudentUserDtoBuilder b)]) = _$AcceptStudentUserDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AcceptStudentUserDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AcceptStudentUserDto> get serializer => _$AcceptStudentUserDtoSerializer();
}

class _$AcceptStudentUserDtoSerializer implements PrimitiveSerializer<AcceptStudentUserDto> {
  @override
  final Iterable<Type> types = const [AcceptStudentUserDto, _$AcceptStudentUserDto];

  @override
  final String wireName = r'AcceptStudentUserDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AcceptStudentUserDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'email';
    yield serializers.serialize(
      object.email,
      specifiedType: const FullType(String),
    );
    yield r'role';
    yield serializers.serialize(
      object.role,
      specifiedType: const FullType(AcceptStudentUserDtoRoleEnum),
    );
    yield r'fullName';
    yield object.fullName == null ? null : serializers.serialize(
      object.fullName,
      specifiedType: const FullType.nullable(JsonObject),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AcceptStudentUserDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AcceptStudentUserDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
          break;
        case r'email':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.email = valueDes;
          break;
        case r'role':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AcceptStudentUserDtoRoleEnum),
          ) as AcceptStudentUserDtoRoleEnum;
          result.role = valueDes;
          break;
        case r'fullName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.fullName = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AcceptStudentUserDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AcceptStudentUserDtoBuilder();
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

class AcceptStudentUserDtoRoleEnum extends EnumClass {

  /// Role assigned to the user within the platform
  @BuiltValueEnumConst(wireName: r'Student')
  static const AcceptStudentUserDtoRoleEnum student = _$acceptStudentUserDtoRoleEnum_student;
  /// Role assigned to the user within the platform
  @BuiltValueEnumConst(wireName: r'Club')
  static const AcceptStudentUserDtoRoleEnum club = _$acceptStudentUserDtoRoleEnum_club;
  /// Role assigned to the user within the platform
  @BuiltValueEnumConst(wireName: r'Admin')
  static const AcceptStudentUserDtoRoleEnum admin = _$acceptStudentUserDtoRoleEnum_admin;

  static Serializer<AcceptStudentUserDtoRoleEnum> get serializer => _$acceptStudentUserDtoRoleEnumSerializer;

  const AcceptStudentUserDtoRoleEnum._(String name): super(name);

  static BuiltSet<AcceptStudentUserDtoRoleEnum> get values => _$acceptStudentUserDtoRoleEnumValues;
  static AcceptStudentUserDtoRoleEnum valueOf(String name) => _$acceptStudentUserDtoRoleEnumValueOf(name);
}

