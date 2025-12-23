//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/club_card_response_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'clubs_list_response_dto.g.dart';

/// ClubsListResponseDto
///
/// Properties:
/// * [clubs] - List of all active clubs visible in the directory. Each entry contains minimal public info.
@BuiltValue()
abstract class ClubsListResponseDto implements Built<ClubsListResponseDto, ClubsListResponseDtoBuilder> {
  /// List of all active clubs visible in the directory. Each entry contains minimal public info.
  @BuiltValueField(wireName: r'clubs')
  BuiltList<ClubCardResponseDto> get clubs;

  ClubsListResponseDto._();

  factory ClubsListResponseDto([void updates(ClubsListResponseDtoBuilder b)]) = _$ClubsListResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ClubsListResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ClubsListResponseDto> get serializer => _$ClubsListResponseDtoSerializer();
}

class _$ClubsListResponseDtoSerializer implements PrimitiveSerializer<ClubsListResponseDto> {
  @override
  final Iterable<Type> types = const [ClubsListResponseDto, _$ClubsListResponseDto];

  @override
  final String wireName = r'ClubsListResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ClubsListResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'clubs';
    yield serializers.serialize(
      object.clubs,
      specifiedType: const FullType(BuiltList, [FullType(ClubCardResponseDto)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ClubsListResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ClubsListResponseDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'clubs':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ClubCardResponseDto)]),
          ) as BuiltList<ClubCardResponseDto>;
          result.clubs.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ClubsListResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ClubsListResponseDtoBuilder();
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

