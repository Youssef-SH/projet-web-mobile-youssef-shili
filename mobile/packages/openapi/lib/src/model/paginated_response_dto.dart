//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'paginated_response_dto.g.dart';

/// PaginatedResponseDto
///
/// Properties:
/// * [total] - Total number of items available
/// * [page] - Current page number
/// * [limit] - Number of items per page
/// * [totalPages] - Total number of pages
/// * [data] - Paginated response data
@BuiltValue(instantiable: false)
abstract class PaginatedResponseDto  {
  /// Total number of items available
  @BuiltValueField(wireName: r'total')
  num get total;

  /// Current page number
  @BuiltValueField(wireName: r'page')
  num get page;

  /// Number of items per page
  @BuiltValueField(wireName: r'limit')
  num get limit;

  /// Total number of pages
  @BuiltValueField(wireName: r'totalPages')
  num get totalPages;

  /// Paginated response data
  @BuiltValueField(wireName: r'data')
  BuiltList<BuiltList<String>> get data;

  @BuiltValueSerializer(custom: true)
  static Serializer<PaginatedResponseDto> get serializer => _$PaginatedResponseDtoSerializer();
}

class _$PaginatedResponseDtoSerializer implements PrimitiveSerializer<PaginatedResponseDto> {
  @override
  final Iterable<Type> types = const [PaginatedResponseDto];

  @override
  final String wireName = r'PaginatedResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PaginatedResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'total';
    yield serializers.serialize(
      object.total,
      specifiedType: const FullType(num),
    );
    yield r'page';
    yield serializers.serialize(
      object.page,
      specifiedType: const FullType(num),
    );
    yield r'limit';
    yield serializers.serialize(
      object.limit,
      specifiedType: const FullType(num),
    );
    yield r'totalPages';
    yield serializers.serialize(
      object.totalPages,
      specifiedType: const FullType(num),
    );
    yield r'data';
    yield serializers.serialize(
      object.data,
      specifiedType: const FullType(BuiltList, [FullType(BuiltList, [FullType(String)])]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PaginatedResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  @override
  PaginatedResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.deserialize(serialized, specifiedType: FullType($PaginatedResponseDto)) as $PaginatedResponseDto;
  }
}

/// a concrete implementation of [PaginatedResponseDto], since [PaginatedResponseDto] is not instantiable
@BuiltValue(instantiable: true)
abstract class $PaginatedResponseDto implements PaginatedResponseDto, Built<$PaginatedResponseDto, $PaginatedResponseDtoBuilder> {
  $PaginatedResponseDto._();

  factory $PaginatedResponseDto([void Function($PaginatedResponseDtoBuilder)? updates]) = _$$PaginatedResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($PaginatedResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<$PaginatedResponseDto> get serializer => _$$PaginatedResponseDtoSerializer();
}

class _$$PaginatedResponseDtoSerializer implements PrimitiveSerializer<$PaginatedResponseDto> {
  @override
  final Iterable<Type> types = const [$PaginatedResponseDto, _$$PaginatedResponseDto];

  @override
  final String wireName = r'$PaginatedResponseDto';

  @override
  Object serialize(
    Serializers serializers,
    $PaginatedResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.serialize(object, specifiedType: FullType(PaginatedResponseDto))!;
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PaginatedResponseDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'total':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.total = valueDes;
          break;
        case r'page':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.page = valueDes;
          break;
        case r'limit':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.limit = valueDes;
          break;
        case r'totalPages':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.totalPages = valueDes;
          break;
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(BuiltList, [FullType(String)])]),
          ) as BuiltList<BuiltList<String>>;
          result.data.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  $PaginatedResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = $PaginatedResponseDtoBuilder();
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

