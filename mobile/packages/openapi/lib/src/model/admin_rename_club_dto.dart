//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'admin_rename_club_dto.g.dart';

/// AdminRenameClubDto
///
/// Properties:
/// * [name] - The new official name of the club as approved by the administration.
@BuiltValue()
abstract class AdminRenameClubDto implements Built<AdminRenameClubDto, AdminRenameClubDtoBuilder> {
  /// The new official name of the club as approved by the administration.
  @BuiltValueField(wireName: r'name')
  String get name;

  AdminRenameClubDto._();

  factory AdminRenameClubDto([void updates(AdminRenameClubDtoBuilder b)]) = _$AdminRenameClubDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AdminRenameClubDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AdminRenameClubDto> get serializer => _$AdminRenameClubDtoSerializer();
}

class _$AdminRenameClubDtoSerializer implements PrimitiveSerializer<AdminRenameClubDto> {
  @override
  final Iterable<Type> types = const [AdminRenameClubDto, _$AdminRenameClubDto];

  @override
  final String wireName = r'AdminRenameClubDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AdminRenameClubDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AdminRenameClubDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AdminRenameClubDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AdminRenameClubDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AdminRenameClubDtoBuilder();
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

