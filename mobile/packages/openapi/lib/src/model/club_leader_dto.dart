//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'club_leader_dto.g.dart';

/// ClubLeaderDto
///
/// Properties:
/// * [id] - Leader identifier inside this club. Present in owner-facing endpoints.
/// * [role] 
/// * [fullName] 
/// * [email] 
/// * [phone] 
/// * [cin] 
/// * [studyLevel] 
/// * [specialization] 
@BuiltValue()
abstract class ClubLeaderDto implements Built<ClubLeaderDto, ClubLeaderDtoBuilder> {
  /// Leader identifier inside this club. Present in owner-facing endpoints.
  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'role')
  ClubLeaderDtoRoleEnum get role;
  // enum roleEnum {  President,  VicePresident,  };

  @BuiltValueField(wireName: r'fullName')
  String get fullName;

  @BuiltValueField(wireName: r'email')
  String get email;

  @BuiltValueField(wireName: r'phone')
  String get phone;

  @BuiltValueField(wireName: r'cin')
  String get cin;

  @BuiltValueField(wireName: r'studyLevel')
  ClubLeaderDtoStudyLevelEnum get studyLevel;
  // enum studyLevelEnum {  CPI1,  CPI2,  L1,  L2,  L3,  ING1,  ING2,  ING3,  M1,  M2,  };

  @BuiltValueField(wireName: r'specialization')
  String get specialization;

  ClubLeaderDto._();

  factory ClubLeaderDto([void updates(ClubLeaderDtoBuilder b)]) = _$ClubLeaderDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ClubLeaderDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ClubLeaderDto> get serializer => _$ClubLeaderDtoSerializer();
}

class _$ClubLeaderDtoSerializer implements PrimitiveSerializer<ClubLeaderDto> {
  @override
  final Iterable<Type> types = const [ClubLeaderDto, _$ClubLeaderDto];

  @override
  final String wireName = r'ClubLeaderDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ClubLeaderDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    yield r'role';
    yield serializers.serialize(
      object.role,
      specifiedType: const FullType(ClubLeaderDtoRoleEnum),
    );
    yield r'fullName';
    yield serializers.serialize(
      object.fullName,
      specifiedType: const FullType(String),
    );
    yield r'email';
    yield serializers.serialize(
      object.email,
      specifiedType: const FullType(String),
    );
    yield r'phone';
    yield serializers.serialize(
      object.phone,
      specifiedType: const FullType(String),
    );
    yield r'cin';
    yield serializers.serialize(
      object.cin,
      specifiedType: const FullType(String),
    );
    yield r'studyLevel';
    yield serializers.serialize(
      object.studyLevel,
      specifiedType: const FullType(ClubLeaderDtoStudyLevelEnum),
    );
    yield r'specialization';
    yield serializers.serialize(
      object.specialization,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ClubLeaderDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ClubLeaderDtoBuilder result,
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
        case r'role':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ClubLeaderDtoRoleEnum),
          ) as ClubLeaderDtoRoleEnum;
          result.role = valueDes;
          break;
        case r'fullName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.fullName = valueDes;
          break;
        case r'email':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.email = valueDes;
          break;
        case r'phone':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.phone = valueDes;
          break;
        case r'cin':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.cin = valueDes;
          break;
        case r'studyLevel':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ClubLeaderDtoStudyLevelEnum),
          ) as ClubLeaderDtoStudyLevelEnum;
          result.studyLevel = valueDes;
          break;
        case r'specialization':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.specialization = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ClubLeaderDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ClubLeaderDtoBuilder();
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

class ClubLeaderDtoRoleEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'President')
  static const ClubLeaderDtoRoleEnum president = _$clubLeaderDtoRoleEnum_president;
  @BuiltValueEnumConst(wireName: r'VicePresident')
  static const ClubLeaderDtoRoleEnum vicePresident = _$clubLeaderDtoRoleEnum_vicePresident;

  static Serializer<ClubLeaderDtoRoleEnum> get serializer => _$clubLeaderDtoRoleEnumSerializer;

  const ClubLeaderDtoRoleEnum._(String name): super(name);

  static BuiltSet<ClubLeaderDtoRoleEnum> get values => _$clubLeaderDtoRoleEnumValues;
  static ClubLeaderDtoRoleEnum valueOf(String name) => _$clubLeaderDtoRoleEnumValueOf(name);
}

class ClubLeaderDtoStudyLevelEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'CPI1')
  static const ClubLeaderDtoStudyLevelEnum cPI1 = _$clubLeaderDtoStudyLevelEnum_cPI1;
  @BuiltValueEnumConst(wireName: r'CPI2')
  static const ClubLeaderDtoStudyLevelEnum cPI2 = _$clubLeaderDtoStudyLevelEnum_cPI2;
  @BuiltValueEnumConst(wireName: r'L1')
  static const ClubLeaderDtoStudyLevelEnum l1 = _$clubLeaderDtoStudyLevelEnum_l1;
  @BuiltValueEnumConst(wireName: r'L2')
  static const ClubLeaderDtoStudyLevelEnum l2 = _$clubLeaderDtoStudyLevelEnum_l2;
  @BuiltValueEnumConst(wireName: r'L3')
  static const ClubLeaderDtoStudyLevelEnum l3 = _$clubLeaderDtoStudyLevelEnum_l3;
  @BuiltValueEnumConst(wireName: r'ING1')
  static const ClubLeaderDtoStudyLevelEnum iNG1 = _$clubLeaderDtoStudyLevelEnum_iNG1;
  @BuiltValueEnumConst(wireName: r'ING2')
  static const ClubLeaderDtoStudyLevelEnum iNG2 = _$clubLeaderDtoStudyLevelEnum_iNG2;
  @BuiltValueEnumConst(wireName: r'ING3')
  static const ClubLeaderDtoStudyLevelEnum iNG3 = _$clubLeaderDtoStudyLevelEnum_iNG3;
  @BuiltValueEnumConst(wireName: r'M1')
  static const ClubLeaderDtoStudyLevelEnum m1 = _$clubLeaderDtoStudyLevelEnum_m1;
  @BuiltValueEnumConst(wireName: r'M2')
  static const ClubLeaderDtoStudyLevelEnum m2 = _$clubLeaderDtoStudyLevelEnum_m2;

  static Serializer<ClubLeaderDtoStudyLevelEnum> get serializer => _$clubLeaderDtoStudyLevelEnumSerializer;

  const ClubLeaderDtoStudyLevelEnum._(String name): super(name);

  static BuiltSet<ClubLeaderDtoStudyLevelEnum> get values => _$clubLeaderDtoStudyLevelEnumValues;
  static ClubLeaderDtoStudyLevelEnum valueOf(String name) => _$clubLeaderDtoStudyLevelEnumValueOf(name);
}

