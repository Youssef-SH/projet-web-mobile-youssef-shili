//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'invite_preview_summary_dto.g.dart';

/// InvitePreviewSummaryDto
///
/// Properties:
/// * [accountType] - Type of invite being processed (Student or Club)
/// * [mode] - Import mode: add new or replace existing invites
/// * [totalRows] - Total number of rows detected in the uploaded CSV file
/// * [willCreate] - Number of new invites that will be created
/// * [willSkip] - Number of existing valid entries that will be skipped
/// * [willDeactivate] - Number of accounts that will be deactivated due to replace mode
@BuiltValue()
abstract class InvitePreviewSummaryDto implements Built<InvitePreviewSummaryDto, InvitePreviewSummaryDtoBuilder> {
  /// Type of invite being processed (Student or Club)
  @BuiltValueField(wireName: r'accountType')
  InvitePreviewSummaryDtoAccountTypeEnum get accountType;
  // enum accountTypeEnum {  Student,  Club,  };

  /// Import mode: add new or replace existing invites
  @BuiltValueField(wireName: r'mode')
  InvitePreviewSummaryDtoModeEnum get mode;
  // enum modeEnum {  add,  replace,  };

  /// Total number of rows detected in the uploaded CSV file
  @BuiltValueField(wireName: r'totalRows')
  num get totalRows;

  /// Number of new invites that will be created
  @BuiltValueField(wireName: r'willCreate')
  num get willCreate;

  /// Number of existing valid entries that will be skipped
  @BuiltValueField(wireName: r'willSkip')
  num get willSkip;

  /// Number of accounts that will be deactivated due to replace mode
  @BuiltValueField(wireName: r'willDeactivate')
  num get willDeactivate;

  InvitePreviewSummaryDto._();

  factory InvitePreviewSummaryDto([void updates(InvitePreviewSummaryDtoBuilder b)]) = _$InvitePreviewSummaryDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(InvitePreviewSummaryDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<InvitePreviewSummaryDto> get serializer => _$InvitePreviewSummaryDtoSerializer();
}

class _$InvitePreviewSummaryDtoSerializer implements PrimitiveSerializer<InvitePreviewSummaryDto> {
  @override
  final Iterable<Type> types = const [InvitePreviewSummaryDto, _$InvitePreviewSummaryDto];

  @override
  final String wireName = r'InvitePreviewSummaryDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    InvitePreviewSummaryDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'accountType';
    yield serializers.serialize(
      object.accountType,
      specifiedType: const FullType(InvitePreviewSummaryDtoAccountTypeEnum),
    );
    yield r'mode';
    yield serializers.serialize(
      object.mode,
      specifiedType: const FullType(InvitePreviewSummaryDtoModeEnum),
    );
    yield r'totalRows';
    yield serializers.serialize(
      object.totalRows,
      specifiedType: const FullType(num),
    );
    yield r'willCreate';
    yield serializers.serialize(
      object.willCreate,
      specifiedType: const FullType(num),
    );
    yield r'willSkip';
    yield serializers.serialize(
      object.willSkip,
      specifiedType: const FullType(num),
    );
    yield r'willDeactivate';
    yield serializers.serialize(
      object.willDeactivate,
      specifiedType: const FullType(num),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    InvitePreviewSummaryDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required InvitePreviewSummaryDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'accountType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(InvitePreviewSummaryDtoAccountTypeEnum),
          ) as InvitePreviewSummaryDtoAccountTypeEnum;
          result.accountType = valueDes;
          break;
        case r'mode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(InvitePreviewSummaryDtoModeEnum),
          ) as InvitePreviewSummaryDtoModeEnum;
          result.mode = valueDes;
          break;
        case r'totalRows':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.totalRows = valueDes;
          break;
        case r'willCreate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.willCreate = valueDes;
          break;
        case r'willSkip':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.willSkip = valueDes;
          break;
        case r'willDeactivate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.willDeactivate = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  InvitePreviewSummaryDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = InvitePreviewSummaryDtoBuilder();
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

class InvitePreviewSummaryDtoAccountTypeEnum extends EnumClass {

  /// Type of invite being processed (Student or Club)
  @BuiltValueEnumConst(wireName: r'Student')
  static const InvitePreviewSummaryDtoAccountTypeEnum student = _$invitePreviewSummaryDtoAccountTypeEnum_student;
  /// Type of invite being processed (Student or Club)
  @BuiltValueEnumConst(wireName: r'Club')
  static const InvitePreviewSummaryDtoAccountTypeEnum club = _$invitePreviewSummaryDtoAccountTypeEnum_club;

  static Serializer<InvitePreviewSummaryDtoAccountTypeEnum> get serializer => _$invitePreviewSummaryDtoAccountTypeEnumSerializer;

  const InvitePreviewSummaryDtoAccountTypeEnum._(String name): super(name);

  static BuiltSet<InvitePreviewSummaryDtoAccountTypeEnum> get values => _$invitePreviewSummaryDtoAccountTypeEnumValues;
  static InvitePreviewSummaryDtoAccountTypeEnum valueOf(String name) => _$invitePreviewSummaryDtoAccountTypeEnumValueOf(name);
}

class InvitePreviewSummaryDtoModeEnum extends EnumClass {

  /// Import mode: add new or replace existing invites
  @BuiltValueEnumConst(wireName: r'add')
  static const InvitePreviewSummaryDtoModeEnum add = _$invitePreviewSummaryDtoModeEnum_add;
  /// Import mode: add new or replace existing invites
  @BuiltValueEnumConst(wireName: r'replace')
  static const InvitePreviewSummaryDtoModeEnum replace = _$invitePreviewSummaryDtoModeEnum_replace;

  static Serializer<InvitePreviewSummaryDtoModeEnum> get serializer => _$invitePreviewSummaryDtoModeEnumSerializer;

  const InvitePreviewSummaryDtoModeEnum._(String name): super(name);

  static BuiltSet<InvitePreviewSummaryDtoModeEnum> get values => _$invitePreviewSummaryDtoModeEnumValues;
  static InvitePreviewSummaryDtoModeEnum valueOf(String name) => _$invitePreviewSummaryDtoModeEnumValueOf(name);
}

