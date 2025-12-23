//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/club_leader_dto.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'club_leaders_response_dto.g.dart';

/// ClubLeadersResponseDto
///
/// Properties:
/// * [clubId] - Club whose leaders are being retrieved.
/// * [leaders] - Exactly two leaders: President and VicePresident.
@BuiltValue()
abstract class ClubLeadersResponseDto implements Built<ClubLeadersResponseDto, ClubLeadersResponseDtoBuilder> {
  /// Club whose leaders are being retrieved.
  @BuiltValueField(wireName: r'clubId')
  String get clubId;

  /// Exactly two leaders: President and VicePresident.
  @BuiltValueField(wireName: r'leaders')
  BuiltList<ClubLeaderDto> get leaders;

  ClubLeadersResponseDto._();

  factory ClubLeadersResponseDto([void updates(ClubLeadersResponseDtoBuilder b)]) = _$ClubLeadersResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ClubLeadersResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ClubLeadersResponseDto> get serializer => _$ClubLeadersResponseDtoSerializer();
}

class _$ClubLeadersResponseDtoSerializer implements PrimitiveSerializer<ClubLeadersResponseDto> {
  @override
  final Iterable<Type> types = const [ClubLeadersResponseDto, _$ClubLeadersResponseDto];

  @override
  final String wireName = r'ClubLeadersResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ClubLeadersResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'clubId';
    yield serializers.serialize(
      object.clubId,
      specifiedType: const FullType(String),
    );
    yield r'leaders';
    yield serializers.serialize(
      object.leaders,
      specifiedType: const FullType(BuiltList, [FullType(ClubLeaderDto)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ClubLeadersResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ClubLeadersResponseDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'clubId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.clubId = valueDes;
          break;
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
  ClubLeadersResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ClubLeadersResponseDtoBuilder();
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

