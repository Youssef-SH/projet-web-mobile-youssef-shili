//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'admin_rename_club_response_dto.g.dart';

/// AdminRenameClubResponseDto
///
/// Properties:
/// * [id] - Unique identifier of the club whose name was updated.
/// * [name] - New official name of the club after the rename operation.
@BuiltValue()
abstract class AdminRenameClubResponseDto implements Built<AdminRenameClubResponseDto, AdminRenameClubResponseDtoBuilder> {
  /// Unique identifier of the club whose name was updated.
  @BuiltValueField(wireName: r'id')
  String get id;

  /// New official name of the club after the rename operation.
  @BuiltValueField(wireName: r'name')
  String get name;

  AdminRenameClubResponseDto._();

  factory AdminRenameClubResponseDto([void updates(AdminRenameClubResponseDtoBuilder b)]) = _$AdminRenameClubResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AdminRenameClubResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AdminRenameClubResponseDto> get serializer => _$AdminRenameClubResponseDtoSerializer();
}

class _$AdminRenameClubResponseDtoSerializer implements PrimitiveSerializer<AdminRenameClubResponseDto> {
  @override
  final Iterable<Type> types = const [AdminRenameClubResponseDto, _$AdminRenameClubResponseDto];

  @override
  final String wireName = r'AdminRenameClubResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AdminRenameClubResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AdminRenameClubResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AdminRenameClubResponseDtoBuilder result,
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
  AdminRenameClubResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AdminRenameClubResponseDtoBuilder();
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

