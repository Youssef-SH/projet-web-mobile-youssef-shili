// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_event_request_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const CreateEventRequestResponseDtoStatusEnum
    _$createEventRequestResponseDtoStatusEnum_pending =
    const CreateEventRequestResponseDtoStatusEnum._('pending');
const CreateEventRequestResponseDtoStatusEnum
    _$createEventRequestResponseDtoStatusEnum_approved =
    const CreateEventRequestResponseDtoStatusEnum._('approved');
const CreateEventRequestResponseDtoStatusEnum
    _$createEventRequestResponseDtoStatusEnum_rejected =
    const CreateEventRequestResponseDtoStatusEnum._('rejected');

CreateEventRequestResponseDtoStatusEnum
    _$createEventRequestResponseDtoStatusEnumValueOf(String name) {
  switch (name) {
    case 'pending':
      return _$createEventRequestResponseDtoStatusEnum_pending;
    case 'approved':
      return _$createEventRequestResponseDtoStatusEnum_approved;
    case 'rejected':
      return _$createEventRequestResponseDtoStatusEnum_rejected;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<CreateEventRequestResponseDtoStatusEnum>
    _$createEventRequestResponseDtoStatusEnumValues = BuiltSet<
        CreateEventRequestResponseDtoStatusEnum>(const <CreateEventRequestResponseDtoStatusEnum>[
  _$createEventRequestResponseDtoStatusEnum_pending,
  _$createEventRequestResponseDtoStatusEnum_approved,
  _$createEventRequestResponseDtoStatusEnum_rejected,
]);

Serializer<CreateEventRequestResponseDtoStatusEnum>
    _$createEventRequestResponseDtoStatusEnumSerializer =
    _$CreateEventRequestResponseDtoStatusEnumSerializer();

class _$CreateEventRequestResponseDtoStatusEnumSerializer
    implements PrimitiveSerializer<CreateEventRequestResponseDtoStatusEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'pending': 'Pending',
    'approved': 'Approved',
    'rejected': 'Rejected',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'Pending': 'pending',
    'Approved': 'approved',
    'Rejected': 'rejected',
  };

  @override
  final Iterable<Type> types = const <Type>[
    CreateEventRequestResponseDtoStatusEnum
  ];
  @override
  final String wireName = 'CreateEventRequestResponseDtoStatusEnum';

  @override
  Object serialize(Serializers serializers,
          CreateEventRequestResponseDtoStatusEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  CreateEventRequestResponseDtoStatusEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      CreateEventRequestResponseDtoStatusEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$CreateEventRequestResponseDto extends CreateEventRequestResponseDto {
  @override
  final String id;
  @override
  final CreateEventRequestResponseDtoStatusEnum status;

  factory _$CreateEventRequestResponseDto(
          [void Function(CreateEventRequestResponseDtoBuilder)? updates]) =>
      (CreateEventRequestResponseDtoBuilder()..update(updates))._build();

  _$CreateEventRequestResponseDto._({required this.id, required this.status})
      : super._();
  @override
  CreateEventRequestResponseDto rebuild(
          void Function(CreateEventRequestResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateEventRequestResponseDtoBuilder toBuilder() =>
      CreateEventRequestResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateEventRequestResponseDto &&
        id == other.id &&
        status == other.status;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateEventRequestResponseDto')
          ..add('id', id)
          ..add('status', status))
        .toString();
  }
}

class CreateEventRequestResponseDtoBuilder
    implements
        Builder<CreateEventRequestResponseDto,
            CreateEventRequestResponseDtoBuilder> {
  _$CreateEventRequestResponseDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  CreateEventRequestResponseDtoStatusEnum? _status;
  CreateEventRequestResponseDtoStatusEnum? get status => _$this._status;
  set status(CreateEventRequestResponseDtoStatusEnum? status) =>
      _$this._status = status;

  CreateEventRequestResponseDtoBuilder() {
    CreateEventRequestResponseDto._defaults(this);
  }

  CreateEventRequestResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _status = $v.status;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateEventRequestResponseDto other) {
    _$v = other as _$CreateEventRequestResponseDto;
  }

  @override
  void update(void Function(CreateEventRequestResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateEventRequestResponseDto build() => _build();

  _$CreateEventRequestResponseDto _build() {
    final _$result = _$v ??
        _$CreateEventRequestResponseDto._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'CreateEventRequestResponseDto', 'id'),
          status: BuiltValueNullFieldError.checkNotNull(
              status, r'CreateEventRequestResponseDto', 'status'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
