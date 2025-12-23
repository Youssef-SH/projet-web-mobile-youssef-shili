//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'me_response_dto.g.dart';

/// MeResponseDto
///
/// Properties:
/// * [id] - Unique identifier of the authenticated user.
/// * [email] - Email address of the authenticated user
/// * [role] - Role of the authenticated user within the platform
/// * [fullName] - Full name of the user (Admin & Student only). Null for club accounts.
/// * [clubId] - Club ID if the user is a club account, otherwise null
@BuiltValue()
abstract class MeResponseDto implements Built<MeResponseDto, MeResponseDtoBuilder> {
  /// Unique identifier of the authenticated user.
  @BuiltValueField(wireName: r'id')
  String get id;

  /// Email address of the authenticated user
  @BuiltValueField(wireName: r'email')
  String get email;

  /// Role of the authenticated user within the platform
  @BuiltValueField(wireName: r'role')
  MeResponseDtoRoleEnum get role;
  // enum roleEnum {  Student,  Club,  Admin,  };

  /// Full name of the user (Admin & Student only). Null for club accounts.
  @BuiltValueField(wireName: r'fullName')
  JsonObject? get fullName;

  /// Club ID if the user is a club account, otherwise null
  @BuiltValueField(wireName: r'clubId')
  JsonObject? get clubId;

  MeResponseDto._();

  factory MeResponseDto([void updates(MeResponseDtoBuilder b)]) = _$MeResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MeResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MeResponseDto> get serializer => _$MeResponseDtoSerializer();
}

class _$MeResponseDtoSerializer implements PrimitiveSerializer<MeResponseDto> {
  @override
  final Iterable<Type> types = const [MeResponseDto, _$MeResponseDto];

  @override
  final String wireName = r'MeResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MeResponseDto object, {
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
      specifiedType: const FullType(MeResponseDtoRoleEnum),
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
    MeResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required MeResponseDtoBuilder result,
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
            specifiedType: const FullType(MeResponseDtoRoleEnum),
          ) as MeResponseDtoRoleEnum;
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
  MeResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MeResponseDtoBuilder();
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

class MeResponseDtoRoleEnum extends EnumClass {

  /// Role of the authenticated user within the platform
  @BuiltValueEnumConst(wireName: r'Student')
  static const MeResponseDtoRoleEnum student = _$meResponseDtoRoleEnum_student;
  /// Role of the authenticated user within the platform
  @BuiltValueEnumConst(wireName: r'Club')
  static const MeResponseDtoRoleEnum club = _$meResponseDtoRoleEnum_club;
  /// Role of the authenticated user within the platform
  @BuiltValueEnumConst(wireName: r'Admin')
  static const MeResponseDtoRoleEnum admin = _$meResponseDtoRoleEnum_admin;

  static Serializer<MeResponseDtoRoleEnum> get serializer => _$meResponseDtoRoleEnumSerializer;

  const MeResponseDtoRoleEnum._(String name): super(name);

  static BuiltSet<MeResponseDtoRoleEnum> get values => _$meResponseDtoRoleEnumValues;
  static MeResponseDtoRoleEnum valueOf(String name) => _$meResponseDtoRoleEnumValueOf(name);
}

