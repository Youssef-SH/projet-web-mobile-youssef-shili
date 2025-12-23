//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'subscribe_club_response_dto.g.dart';

/// SubscribeClubResponseDto
///
/// Properties:
/// * [clubId] - UUID of the club affected by the follow/unfollow action.
/// * [isFollowed] - Whether the student is now following the club.
@BuiltValue()
abstract class SubscribeClubResponseDto implements Built<SubscribeClubResponseDto, SubscribeClubResponseDtoBuilder> {
  /// UUID of the club affected by the follow/unfollow action.
  @BuiltValueField(wireName: r'clubId')
  String get clubId;

  /// Whether the student is now following the club.
  @BuiltValueField(wireName: r'isFollowed')
  bool get isFollowed;

  SubscribeClubResponseDto._();

  factory SubscribeClubResponseDto([void updates(SubscribeClubResponseDtoBuilder b)]) = _$SubscribeClubResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SubscribeClubResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SubscribeClubResponseDto> get serializer => _$SubscribeClubResponseDtoSerializer();
}

class _$SubscribeClubResponseDtoSerializer implements PrimitiveSerializer<SubscribeClubResponseDto> {
  @override
  final Iterable<Type> types = const [SubscribeClubResponseDto, _$SubscribeClubResponseDto];

  @override
  final String wireName = r'SubscribeClubResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SubscribeClubResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'clubId';
    yield serializers.serialize(
      object.clubId,
      specifiedType: const FullType(String),
    );
    yield r'isFollowed';
    yield serializers.serialize(
      object.isFollowed,
      specifiedType: const FullType(bool),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    SubscribeClubResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SubscribeClubResponseDtoBuilder result,
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
        case r'isFollowed':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isFollowed = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SubscribeClubResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SubscribeClubResponseDtoBuilder();
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

