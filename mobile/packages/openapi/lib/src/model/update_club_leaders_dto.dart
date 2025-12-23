//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/club_leader_input_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_club_leaders_dto.g.dart';

/// UpdateClubLeadersDto
///
/// Properties:
/// * [leaders] - List of both club leaders (President and Vice-President). Must contain exactly 2 entries.
@BuiltValue()
abstract class UpdateClubLeadersDto implements Built<UpdateClubLeadersDto, UpdateClubLeadersDtoBuilder> {
  /// List of both club leaders (President and Vice-President). Must contain exactly 2 entries.
  @BuiltValueField(wireName: r'leaders')
  BuiltList<ClubLeaderInputDto> get leaders;

  UpdateClubLeadersDto._();

  factory UpdateClubLeadersDto([void updates(UpdateClubLeadersDtoBuilder b)]) = _$UpdateClubLeadersDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateClubLeadersDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateClubLeadersDto> get serializer => _$UpdateClubLeadersDtoSerializer();
}

class _$UpdateClubLeadersDtoSerializer implements PrimitiveSerializer<UpdateClubLeadersDto> {
  @override
  final Iterable<Type> types = const [UpdateClubLeadersDto, _$UpdateClubLeadersDto];

  @override
  final String wireName = r'UpdateClubLeadersDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateClubLeadersDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'leaders';
    yield serializers.serialize(
      object.leaders,
      specifiedType: const FullType(BuiltList, [FullType(ClubLeaderInputDto)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdateClubLeadersDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpdateClubLeadersDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'leaders':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ClubLeaderInputDto)]),
          ) as BuiltList<ClubLeaderInputDto>;
          result.leaders.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpdateClubLeadersDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateClubLeadersDtoBuilder();
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

