//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'accept_club_user_dto.g.dart';

/// AcceptClubUserDto
///
/// Properties:
/// * [id] - Unique identifier of the newly created club user
/// * [email] - Email address associated with the club account
/// * [role] - Role assigned to the user (always Club)
/// * [fullName] - Full name for this user — always null for club accounts
/// * [clubId] - Unique identifier of the associated club
@BuiltValue()
abstract class AcceptClubUserDto implements Built<AcceptClubUserDto, AcceptClubUserDtoBuilder> {
  /// Unique identifier of the newly created club user
  @BuiltValueField(wireName: r'id')
  String get id;

  /// Email address associated with the club account
  @BuiltValueField(wireName: r'email')
  String get email;

  /// Role assigned to the user (always Club)
  @BuiltValueField(wireName: r'role')
  AcceptClubUserDtoRoleEnum get role;
  // enum roleEnum {  Student,  Club,  Admin,  };

  /// Full name for this user — always null for club accounts
  @BuiltValueField(wireName: r'fullName')
  JsonObject? get fullName;

  /// Unique identifier of the associated club
  @BuiltValueField(wireName: r'clubId')
  String get clubId;

  AcceptClubUserDto._();

  factory AcceptClubUserDto([void updates(AcceptClubUserDtoBuilder b)]) = _$AcceptClubUserDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AcceptClubUserDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AcceptClubUserDto> get serializer => _$AcceptClubUserDtoSerializer();
}

class _$AcceptClubUserDtoSerializer implements PrimitiveSerializer<AcceptClubUserDto> {
  @override
  final Iterable<Type> types = const [AcceptClubUserDto, _$AcceptClubUserDto];

  @override
  final String wireName = r'AcceptClubUserDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AcceptClubUserDto object, {
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
      specifiedType: const FullType(AcceptClubUserDtoRoleEnum),
    );
    yield r'fullName';
    yield object.fullName == null ? null : serializers.serialize(
      object.fullName,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'clubId';
    yield serializers.serialize(
      object.clubId,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AcceptClubUserDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AcceptClubUserDtoBuilder result,
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
            specifiedType: const FullType(AcceptClubUserDtoRoleEnum),
          ) as AcceptClubUserDtoRoleEnum;
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
            specifiedType: const FullType(String),
          ) as String;
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
  AcceptClubUserDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AcceptClubUserDtoBuilder();
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

class AcceptClubUserDtoRoleEnum extends EnumClass {

  /// Role assigned to the user (always Club)
  @BuiltValueEnumConst(wireName: r'Student')
  static const AcceptClubUserDtoRoleEnum student = _$acceptClubUserDtoRoleEnum_student;
  /// Role assigned to the user (always Club)
  @BuiltValueEnumConst(wireName: r'Club')
  static const AcceptClubUserDtoRoleEnum club = _$acceptClubUserDtoRoleEnum_club;
  /// Role assigned to the user (always Club)
  @BuiltValueEnumConst(wireName: r'Admin')
  static const AcceptClubUserDtoRoleEnum admin = _$acceptClubUserDtoRoleEnum_admin;

  static Serializer<AcceptClubUserDtoRoleEnum> get serializer => _$acceptClubUserDtoRoleEnumSerializer;

  const AcceptClubUserDtoRoleEnum._(String name): super(name);

  static BuiltSet<AcceptClubUserDtoRoleEnum> get values => _$acceptClubUserDtoRoleEnumValues;
  static AcceptClubUserDtoRoleEnum valueOf(String name) => _$acceptClubUserDtoRoleEnumValueOf(name);
}

