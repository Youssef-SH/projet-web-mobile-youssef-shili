//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'login_user_snapshot_dto.g.dart';

/// LoginUserSnapshotDto
///
/// Properties:
/// * [id] - Unique identifier of the authenticated user.
/// * [email] - Email address of the authenticated user
/// * [role] - Role assigned to the authenticated user
/// * [fullName] - Full name of the user (Admin & Student only). Null for club accounts.
/// * [clubId] - Club ID if the user is a club account, otherwise null
@BuiltValue()
abstract class LoginUserSnapshotDto implements Built<LoginUserSnapshotDto, LoginUserSnapshotDtoBuilder> {
  /// Unique identifier of the authenticated user.
  @BuiltValueField(wireName: r'id')
  String get id;

  /// Email address of the authenticated user
  @BuiltValueField(wireName: r'email')
  String get email;

  /// Role assigned to the authenticated user
  @BuiltValueField(wireName: r'role')
  LoginUserSnapshotDtoRoleEnum get role;
  // enum roleEnum {  Student,  Club,  Admin,  };

  /// Full name of the user (Admin & Student only). Null for club accounts.
  @BuiltValueField(wireName: r'fullName')
  JsonObject? get fullName;

  /// Club ID if the user is a club account, otherwise null
  @BuiltValueField(wireName: r'clubId')
  JsonObject? get clubId;

  LoginUserSnapshotDto._();

  factory LoginUserSnapshotDto([void updates(LoginUserSnapshotDtoBuilder b)]) = _$LoginUserSnapshotDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(LoginUserSnapshotDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<LoginUserSnapshotDto> get serializer => _$LoginUserSnapshotDtoSerializer();
}

class _$LoginUserSnapshotDtoSerializer implements PrimitiveSerializer<LoginUserSnapshotDto> {
  @override
  final Iterable<Type> types = const [LoginUserSnapshotDto, _$LoginUserSnapshotDto];

  @override
  final String wireName = r'LoginUserSnapshotDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    LoginUserSnapshotDto object, {
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
      specifiedType: const FullType(LoginUserSnapshotDtoRoleEnum),
    );
    yield r'fullName';
    yield object.fullName == null ? null : serializers.serialize(
      object.fullName,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'clubId';
    yield object.clubId == null ? null : serializers.serialize(
      object.clubId,
      specifiedType: const FullType.nullable(JsonObject),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    LoginUserSnapshotDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required LoginUserSnapshotDtoBuilder result,
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
            specifiedType: const FullType(LoginUserSnapshotDtoRoleEnum),
          ) as LoginUserSnapshotDtoRoleEnum;
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
        case r'clubId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.clubId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  LoginUserSnapshotDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = LoginUserSnapshotDtoBuilder();
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

class LoginUserSnapshotDtoRoleEnum extends EnumClass {

  /// Role assigned to the authenticated user
  @BuiltValueEnumConst(wireName: r'Student')
  static const LoginUserSnapshotDtoRoleEnum student = _$loginUserSnapshotDtoRoleEnum_student;
  /// Role assigned to the authenticated user
  @BuiltValueEnumConst(wireName: r'Club')
  static const LoginUserSnapshotDtoRoleEnum club = _$loginUserSnapshotDtoRoleEnum_club;
  /// Role assigned to the authenticated user
  @BuiltValueEnumConst(wireName: r'Admin')
  static const LoginUserSnapshotDtoRoleEnum admin = _$loginUserSnapshotDtoRoleEnum_admin;

  static Serializer<LoginUserSnapshotDtoRoleEnum> get serializer => _$loginUserSnapshotDtoRoleEnumSerializer;

  const LoginUserSnapshotDtoRoleEnum._(String name): super(name);

  static BuiltSet<LoginUserSnapshotDtoRoleEnum> get values => _$loginUserSnapshotDtoRoleEnumValues;
  static LoginUserSnapshotDtoRoleEnum valueOf(String name) => _$loginUserSnapshotDtoRoleEnumValueOf(name);
}

