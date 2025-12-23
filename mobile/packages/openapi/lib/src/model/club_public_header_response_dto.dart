//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'club_public_header_response_dto.g.dart';

/// ClubPublicHeaderResponseDto
///
/// Properties:
/// * [id] - Unique identifier of the club.
/// * [name] - Official public name of the club.
/// * [description] - Short description of the club’s mission, goals, and activities.
/// * [logoUrl] - Publicly accessible URL of the club’s logo.
/// * [followerCount] - Total number of students currently following this club.
/// * [postCount] - Number of published posts by this club.
/// * [isFollowed] - Whether the authenticated student follows this club. Included only when the requester is a student.
/// * [isActive] - Whether this club’s account is currently active. Included only when the requester is an admin.
@BuiltValue()
abstract class ClubPublicHeaderResponseDto implements Built<ClubPublicHeaderResponseDto, ClubPublicHeaderResponseDtoBuilder> {
  /// Unique identifier of the club.
  @BuiltValueField(wireName: r'id')
  String get id;

  /// Official public name of the club.
  @BuiltValueField(wireName: r'name')
  String get name;

  /// Short description of the club’s mission, goals, and activities.
  @BuiltValueField(wireName: r'description')
  String get description;

  /// Publicly accessible URL of the club’s logo.
  @BuiltValueField(wireName: r'logoUrl')
  String get logoUrl;

  /// Total number of students currently following this club.
  @BuiltValueField(wireName: r'followerCount')
  num get followerCount;

  /// Number of published posts by this club.
  @BuiltValueField(wireName: r'postCount')
  num get postCount;

  /// Whether the authenticated student follows this club. Included only when the requester is a student.
  @BuiltValueField(wireName: r'isFollowed')
  bool? get isFollowed;

  /// Whether this club’s account is currently active. Included only when the requester is an admin.
  @BuiltValueField(wireName: r'isActive')
  bool? get isActive;

  ClubPublicHeaderResponseDto._();

  factory ClubPublicHeaderResponseDto([void updates(ClubPublicHeaderResponseDtoBuilder b)]) = _$ClubPublicHeaderResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ClubPublicHeaderResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ClubPublicHeaderResponseDto> get serializer => _$ClubPublicHeaderResponseDtoSerializer();
}

class _$ClubPublicHeaderResponseDtoSerializer implements PrimitiveSerializer<ClubPublicHeaderResponseDto> {
  @override
  final Iterable<Type> types = const [ClubPublicHeaderResponseDto, _$ClubPublicHeaderResponseDto];

  @override
  final String wireName = r'ClubPublicHeaderResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ClubPublicHeaderResponseDto object, {
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
    yield r'description';
    yield serializers.serialize(
      object.description,
      specifiedType: const FullType(String),
    );
    yield r'logoUrl';
    yield serializers.serialize(
      object.logoUrl,
      specifiedType: const FullType(String),
    );
    yield r'followerCount';
    yield serializers.serialize(
      object.followerCount,
      specifiedType: const FullType(num),
    );
    yield r'postCount';
    yield serializers.serialize(
      object.postCount,
      specifiedType: const FullType(num),
    );
    if (object.isFollowed != null) {
      yield r'isFollowed';
      yield serializers.serialize(
        object.isFollowed,
        specifiedType: const FullType(bool),
      );
    }
    if (object.isActive != null) {
      yield r'isActive';
      yield serializers.serialize(
        object.isActive,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ClubPublicHeaderResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ClubPublicHeaderResponseDtoBuilder result,
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
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.description = valueDes;
          break;
        case r'logoUrl':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.logoUrl = valueDes;
          break;
        case r'followerCount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.followerCount = valueDes;
          break;
        case r'postCount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.postCount = valueDes;
          break;
        case r'isFollowed':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isFollowed = valueDes;
          break;
        case r'isActive':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isActive = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ClubPublicHeaderResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ClubPublicHeaderResponseDtoBuilder();
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

