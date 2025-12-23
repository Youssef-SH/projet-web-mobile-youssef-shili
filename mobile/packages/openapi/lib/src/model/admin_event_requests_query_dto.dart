//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'admin_event_requests_query_dto.g.dart';

/// AdminEventRequestsQueryDto
///
/// Properties:
/// * [page] - Page number (starting at 1)
/// * [limit] - Items per page
/// * [status] - Filter by request status.
/// * [clubId] - Filter by club (id from /clubs).
@BuiltValue()
abstract class AdminEventRequestsQueryDto implements Built<AdminEventRequestsQueryDto, AdminEventRequestsQueryDtoBuilder> {
  /// Page number (starting at 1)
  @BuiltValueField(wireName: r'page')
  JsonObject? get page;

  /// Items per page
  @BuiltValueField(wireName: r'limit')
  JsonObject? get limit;

  /// Filter by request status.
  @BuiltValueField(wireName: r'status')
  AdminEventRequestsQueryDtoStatusEnum? get status;
  // enum statusEnum {  Pending,  Approved,  Rejected,  };

  /// Filter by club (id from /clubs).
  @BuiltValueField(wireName: r'clubId')
  String? get clubId;

  AdminEventRequestsQueryDto._();

  factory AdminEventRequestsQueryDto([void updates(AdminEventRequestsQueryDtoBuilder b)]) = _$AdminEventRequestsQueryDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AdminEventRequestsQueryDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AdminEventRequestsQueryDto> get serializer => _$AdminEventRequestsQueryDtoSerializer();
}

class _$AdminEventRequestsQueryDtoSerializer implements PrimitiveSerializer<AdminEventRequestsQueryDto> {
  @override
  final Iterable<Type> types = const [AdminEventRequestsQueryDto, _$AdminEventRequestsQueryDto];

  @override
  final String wireName = r'AdminEventRequestsQueryDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AdminEventRequestsQueryDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.page != null) {
      yield r'page';
      yield serializers.serialize(
        object.page,
        specifiedType: const FullType(JsonObject),
      );
    }
    if (object.limit != null) {
      yield r'limit';
      yield serializers.serialize(
        object.limit,
        specifiedType: const FullType(JsonObject),
      );
    }
    if (object.status != null) {
      yield r'status';
      yield serializers.serialize(
        object.status,
        specifiedType: const FullType(AdminEventRequestsQueryDtoStatusEnum),
      );
    }
    if (object.clubId != null) {
      yield r'clubId';
      yield serializers.serialize(
        object.clubId,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AdminEventRequestsQueryDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AdminEventRequestsQueryDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'page':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(JsonObject),
          ) as JsonObject;
          result.page = valueDes;
          break;
        case r'limit':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(JsonObject),
          ) as JsonObject;
          result.limit = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AdminEventRequestsQueryDtoStatusEnum),
          ) as AdminEventRequestsQueryDtoStatusEnum;
          result.status = valueDes;
          break;
        case r'clubId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.clubId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AdminEventRequestsQueryDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AdminEventRequestsQueryDtoBuilder();
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

class AdminEventRequestsQueryDtoStatusEnum extends EnumClass {

  /// Filter by request status.
  @BuiltValueEnumConst(wireName: r'Pending')
  static const AdminEventRequestsQueryDtoStatusEnum pending = _$adminEventRequestsQueryDtoStatusEnum_pending;
  /// Filter by request status.
  @BuiltValueEnumConst(wireName: r'Approved')
  static const AdminEventRequestsQueryDtoStatusEnum approved = _$adminEventRequestsQueryDtoStatusEnum_approved;
  /// Filter by request status.
  @BuiltValueEnumConst(wireName: r'Rejected')
  static const AdminEventRequestsQueryDtoStatusEnum rejected = _$adminEventRequestsQueryDtoStatusEnum_rejected;

  static Serializer<AdminEventRequestsQueryDtoStatusEnum> get serializer => _$adminEventRequestsQueryDtoStatusEnumSerializer;

  const AdminEventRequestsQueryDtoStatusEnum._(String name): super(name);

  static BuiltSet<AdminEventRequestsQueryDtoStatusEnum> get values => _$adminEventRequestsQueryDtoStatusEnumValues;
  static AdminEventRequestsQueryDtoStatusEnum valueOf(String name) => _$adminEventRequestsQueryDtoStatusEnumValueOf(name);
}

