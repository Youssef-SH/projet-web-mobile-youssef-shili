//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/club_leader_dto.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_club_leaders_response_dto.g.dart';

/// UpdateClubLeadersResponseDto
///
/// Properties:
/// * [leaders] - Leaders after update. Both will have ids now.
@BuiltValue()
abstract class UpdateClubLeadersResponseDto implements Built<UpdateClubLeadersResponseDto, UpdateClubLeadersResponseDtoBuilder> {
  /// Leaders after update. Both will have ids now.
  @BuiltValueField(wireName: r'leaders')
  BuiltList<ClubLeaderDto> get leaders;

  UpdateClubLeadersResponseDto._();

  factory UpdateClubLeadersResponseDto([void updates(UpdateClubLeadersResponseDtoBuilder b)]) = _$UpdateClubLeadersResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateClubLeadersResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateClubLeadersResponseDto> get serializer => _$UpdateClubLeadersResponseDtoSerializer();
}

class _$UpdateClubLeadersResponseDtoSerializer implements PrimitiveSerializer<UpdateClubLeadersResponseDto> {
  @override
  final Iterable<Type> types = const [UpdateClubLeadersResponseDto, _$UpdateClubLeadersResponseDto];

  @override
  final String wireName = r'UpdateClubLeadersResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateClubLeadersResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'leaders';
    yield serializers.serialize(
      object.leaders,
      specifiedType: const FullType(BuiltList, [FullType(ClubLeaderDto)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdateClubLeadersResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpdateClubLeadersResponseDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'leaders':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ClubLeaderDto)]),
          ) as BuiltList<ClubLeaderDto>;
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
  UpdateClubLeadersResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateClubLeadersResponseDtoBuilder();
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

