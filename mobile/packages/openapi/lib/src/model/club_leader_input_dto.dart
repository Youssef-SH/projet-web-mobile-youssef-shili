//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'club_leader_input_dto.g.dart';

/// ClubLeaderInputDto
///
/// Properties:
/// * [role] 
/// * [fullName] 
/// * [email] 
/// * [phone] 
/// * [cin] 
/// * [studyLevel] 
/// * [specialization] 
@BuiltValue()
abstract class ClubLeaderInputDto implements Built<ClubLeaderInputDto, ClubLeaderInputDtoBuilder> {
  @BuiltValueField(wireName: r'role')
  ClubLeaderInputDtoRoleEnum get role;
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
  ClubLeaderInputDtoStudyLevelEnum get studyLevel;
  // enum studyLevelEnum {  CPI1,  CPI2,  L1,  L2,  L3,  ING1,  ING2,  ING3,  M1,  M2,  };

  @BuiltValueField(wireName: r'specialization')
  String get specialization;

  ClubLeaderInputDto._();

  factory ClubLeaderInputDto([void updates(ClubLeaderInputDtoBuilder b)]) = _$ClubLeaderInputDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ClubLeaderInputDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ClubLeaderInputDto> get serializer => _$ClubLeaderInputDtoSerializer();
}

class _$ClubLeaderInputDtoSerializer implements PrimitiveSerializer<ClubLeaderInputDto> {
  @override
  final Iterable<Type> types = const [ClubLeaderInputDto, _$ClubLeaderInputDto];

  @override
  final String wireName = r'ClubLeaderInputDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ClubLeaderInputDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'role';
    yield serializers.serialize(
      object.role,
      specifiedType: const FullType(ClubLeaderInputDtoRoleEnum),
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
      specifiedType: const FullType(ClubLeaderInputDtoStudyLevelEnum),
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
    ClubLeaderInputDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ClubLeaderInputDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'role':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ClubLeaderInputDtoRoleEnum),
          ) as ClubLeaderInputDtoRoleEnum;
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
            specifiedType: const FullType(ClubLeaderInputDtoStudyLevelEnum),
          ) as ClubLeaderInputDtoStudyLevelEnum;
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
  ClubLeaderInputDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ClubLeaderInputDtoBuilder();
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

class ClubLeaderInputDtoRoleEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'President')
  static const ClubLeaderInputDtoRoleEnum president = _$clubLeaderInputDtoRoleEnum_president;
  @BuiltValueEnumConst(wireName: r'VicePresident')
  static const ClubLeaderInputDtoRoleEnum vicePresident = _$clubLeaderInputDtoRoleEnum_vicePresident;

  static Serializer<ClubLeaderInputDtoRoleEnum> get serializer => _$clubLeaderInputDtoRoleEnumSerializer;

  const ClubLeaderInputDtoRoleEnum._(String name): super(name);

  static BuiltSet<ClubLeaderInputDtoRoleEnum> get values => _$clubLeaderInputDtoRoleEnumValues;
  static ClubLeaderInputDtoRoleEnum valueOf(String name) => _$clubLeaderInputDtoRoleEnumValueOf(name);
}

class ClubLeaderInputDtoStudyLevelEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'CPI1')
  static const ClubLeaderInputDtoStudyLevelEnum cPI1 = _$clubLeaderInputDtoStudyLevelEnum_cPI1;
  @BuiltValueEnumConst(wireName: r'CPI2')
  static const ClubLeaderInputDtoStudyLevelEnum cPI2 = _$clubLeaderInputDtoStudyLevelEnum_cPI2;
  @BuiltValueEnumConst(wireName: r'L1')
  static const ClubLeaderInputDtoStudyLevelEnum l1 = _$clubLeaderInputDtoStudyLevelEnum_l1;
  @BuiltValueEnumConst(wireName: r'L2')
  static const ClubLeaderInputDtoStudyLevelEnum l2 = _$clubLeaderInputDtoStudyLevelEnum_l2;
  @BuiltValueEnumConst(wireName: r'L3')
  static const ClubLeaderInputDtoStudyLevelEnum l3 = _$clubLeaderInputDtoStudyLevelEnum_l3;
  @BuiltValueEnumConst(wireName: r'ING1')
  static const ClubLeaderInputDtoStudyLevelEnum iNG1 = _$clubLeaderInputDtoStudyLevelEnum_iNG1;
  @BuiltValueEnumConst(wireName: r'ING2')
  static const ClubLeaderInputDtoStudyLevelEnum iNG2 = _$clubLeaderInputDtoStudyLevelEnum_iNG2;
  @BuiltValueEnumConst(wireName: r'ING3')
  static const ClubLeaderInputDtoStudyLevelEnum iNG3 = _$clubLeaderInputDtoStudyLevelEnum_iNG3;
  @BuiltValueEnumConst(wireName: r'M1')
  static const ClubLeaderInputDtoStudyLevelEnum m1 = _$clubLeaderInputDtoStudyLevelEnum_m1;
  @BuiltValueEnumConst(wireName: r'M2')
  static const ClubLeaderInputDtoStudyLevelEnum m2 = _$clubLeaderInputDtoStudyLevelEnum_m2;

  static Serializer<ClubLeaderInputDtoStudyLevelEnum> get serializer => _$clubLeaderInputDtoStudyLevelEnumSerializer;

  const ClubLeaderInputDtoStudyLevelEnum._(String name): super(name);

  static BuiltSet<ClubLeaderInputDtoStudyLevelEnum> get values => _$clubLeaderInputDtoStudyLevelEnumValues;
  static ClubLeaderInputDtoStudyLevelEnum valueOf(String name) => _$clubLeaderInputDtoStudyLevelEnumValueOf(name);
}

