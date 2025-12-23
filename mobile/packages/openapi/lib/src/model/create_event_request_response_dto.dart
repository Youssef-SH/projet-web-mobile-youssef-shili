//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_event_request_response_dto.g.dart';

/// CreateEventRequestResponseDto
///
/// Properties:
/// * [id] - Unique identifier of the newly created event request.
/// * [status] - Initial status of the request. Always Pending on creation.
@BuiltValue()
abstract class CreateEventRequestResponseDto implements Built<CreateEventRequestResponseDto, CreateEventRequestResponseDtoBuilder> {
  /// Unique identifier of the newly created event request.
  @BuiltValueField(wireName: r'id')
  String get id;

  /// Initial status of the request. Always Pending on creation.
  @BuiltValueField(wireName: r'status')
  CreateEventRequestResponseDtoStatusEnum get status;
  // enum statusEnum {  Pending,  Approved,  Rejected,  };

  CreateEventRequestResponseDto._();

  factory CreateEventRequestResponseDto([void updates(CreateEventRequestResponseDtoBuilder b)]) = _$CreateEventRequestResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateEventRequestResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateEventRequestResponseDto> get serializer => _$CreateEventRequestResponseDtoSerializer();
}

class _$CreateEventRequestResponseDtoSerializer implements PrimitiveSerializer<CreateEventRequestResponseDto> {
  @override
  final Iterable<Type> types = const [CreateEventRequestResponseDto, _$CreateEventRequestResponseDto];

  @override
  final String wireName = r'CreateEventRequestResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateEventRequestResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(CreateEventRequestResponseDtoStatusEnum),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateEventRequestResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateEventRequestResponseDtoBuilder result,
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
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(CreateEventRequestResponseDtoStatusEnum),
          ) as CreateEventRequestResponseDtoStatusEnum;
          result.status = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateEventRequestResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateEventRequestResponseDtoBuilder();
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

class CreateEventRequestResponseDtoStatusEnum extends EnumClass {

  /// Initial status of the request. Always Pending on creation.
  @BuiltValueEnumConst(wireName: r'Pending')
  static const CreateEventRequestResponseDtoStatusEnum pending = _$createEventRequestResponseDtoStatusEnum_pending;
  /// Initial status of the request. Always Pending on creation.
  @BuiltValueEnumConst(wireName: r'Approved')
  static const CreateEventRequestResponseDtoStatusEnum approved = _$createEventRequestResponseDtoStatusEnum_approved;
  /// Initial status of the request. Always Pending on creation.
  @BuiltValueEnumConst(wireName: r'Rejected')
  static const CreateEventRequestResponseDtoStatusEnum rejected = _$createEventRequestResponseDtoStatusEnum_rejected;

  static Serializer<CreateEventRequestResponseDtoStatusEnum> get serializer => _$createEventRequestResponseDtoStatusEnumSerializer;

  const CreateEventRequestResponseDtoStatusEnum._(String name): super(name);

  static BuiltSet<CreateEventRequestResponseDtoStatusEnum> get values => _$createEventRequestResponseDtoStatusEnumValues;
  static CreateEventRequestResponseDtoStatusEnum valueOf(String name) => _$createEventRequestResponseDtoStatusEnumValueOf(name);
}

