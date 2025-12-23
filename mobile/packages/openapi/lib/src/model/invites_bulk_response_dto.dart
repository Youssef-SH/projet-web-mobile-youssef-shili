//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'invites_bulk_response_dto.g.dart';

/// InvitesBulkResponseDto
///
/// Properties:
/// * [accountType] - Type of invite being processed (Student or Club)
/// * [mode] - Import mode: add new invites or replace existing ones
/// * [created] - Number of new invites successfully created
/// * [skipped] - Number of invites skipped (already valid or duplicates)
/// * [deactivated] - Number of accounts deactivated due to replace mode
@BuiltValue()
abstract class InvitesBulkResponseDto implements Built<InvitesBulkResponseDto, InvitesBulkResponseDtoBuilder> {
  /// Type of invite being processed (Student or Club)
  @BuiltValueField(wireName: r'accountType')
  InvitesBulkResponseDtoAccountTypeEnum get accountType;
  // enum accountTypeEnum {  Student,  Club,  };

  /// Import mode: add new invites or replace existing ones
  @BuiltValueField(wireName: r'mode')
  InvitesBulkResponseDtoModeEnum get mode;
  // enum modeEnum {  add,  replace,  };

  /// Number of new invites successfully created
  @BuiltValueField(wireName: r'created')
  num get created;

  /// Number of invites skipped (already valid or duplicates)
  @BuiltValueField(wireName: r'skipped')
  num get skipped;

  /// Number of accounts deactivated due to replace mode
  @BuiltValueField(wireName: r'deactivated')
  num get deactivated;

  InvitesBulkResponseDto._();

  factory InvitesBulkResponseDto([void updates(InvitesBulkResponseDtoBuilder b)]) = _$InvitesBulkResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(InvitesBulkResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<InvitesBulkResponseDto> get serializer => _$InvitesBulkResponseDtoSerializer();
}

class _$InvitesBulkResponseDtoSerializer implements PrimitiveSerializer<InvitesBulkResponseDto> {
  @override
  final Iterable<Type> types = const [InvitesBulkResponseDto, _$InvitesBulkResponseDto];

  @override
  final String wireName = r'InvitesBulkResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    InvitesBulkResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'accountType';
    yield serializers.serialize(
      object.accountType,
      specifiedType: const FullType(InvitesBulkResponseDtoAccountTypeEnum),
    );
    yield r'mode';
    yield serializers.serialize(
      object.mode,
      specifiedType: const FullType(InvitesBulkResponseDtoModeEnum),
    );
    yield r'created';
    yield serializers.serialize(
      object.created,
      specifiedType: const FullType(num),
    );
    yield r'skipped';
    yield serializers.serialize(
      object.skipped,
      specifiedType: const FullType(num),
    );
    yield r'deactivated';
    yield serializers.serialize(
      object.deactivated,
      specifiedType: const FullType(num),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    InvitesBulkResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required InvitesBulkResponseDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'accountType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(InvitesBulkResponseDtoAccountTypeEnum),
          ) as InvitesBulkResponseDtoAccountTypeEnum;
          result.accountType = valueDes;
          break;
        case r'mode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(InvitesBulkResponseDtoModeEnum),
          ) as InvitesBulkResponseDtoModeEnum;
          result.mode = valueDes;
          break;
        case r'created':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.created = valueDes;
          break;
        case r'skipped':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.skipped = valueDes;
          break;
        case r'deactivated':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.deactivated = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  InvitesBulkResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = InvitesBulkResponseDtoBuilder();
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

class InvitesBulkResponseDtoAccountTypeEnum extends EnumClass {

  /// Type of invite being processed (Student or Club)
  @BuiltValueEnumConst(wireName: r'Student')
  static const InvitesBulkResponseDtoAccountTypeEnum student = _$invitesBulkResponseDtoAccountTypeEnum_student;
  /// Type of invite being processed (Student or Club)
  @BuiltValueEnumConst(wireName: r'Club')
  static const InvitesBulkResponseDtoAccountTypeEnum club = _$invitesBulkResponseDtoAccountTypeEnum_club;

  static Serializer<InvitesBulkResponseDtoAccountTypeEnum> get serializer => _$invitesBulkResponseDtoAccountTypeEnumSerializer;

  const InvitesBulkResponseDtoAccountTypeEnum._(String name): super(name);

  static BuiltSet<InvitesBulkResponseDtoAccountTypeEnum> get values => _$invitesBulkResponseDtoAccountTypeEnumValues;
  static InvitesBulkResponseDtoAccountTypeEnum valueOf(String name) => _$invitesBulkResponseDtoAccountTypeEnumValueOf(name);
}

class InvitesBulkResponseDtoModeEnum extends EnumClass {

  /// Import mode: add new invites or replace existing ones
  @BuiltValueEnumConst(wireName: r'add')
  static const InvitesBulkResponseDtoModeEnum add = _$invitesBulkResponseDtoModeEnum_add;
  /// Import mode: add new invites or replace existing ones
  @BuiltValueEnumConst(wireName: r'replace')
  static const InvitesBulkResponseDtoModeEnum replace = _$invitesBulkResponseDtoModeEnum_replace;

  static Serializer<InvitesBulkResponseDtoModeEnum> get serializer => _$invitesBulkResponseDtoModeEnumSerializer;

  const InvitesBulkResponseDtoModeEnum._(String name): super(name);

  static BuiltSet<InvitesBulkResponseDtoModeEnum> get values => _$invitesBulkResponseDtoModeEnumValues;
  static InvitesBulkResponseDtoModeEnum valueOf(String name) => _$invitesBulkResponseDtoModeEnumValueOf(name);
}

