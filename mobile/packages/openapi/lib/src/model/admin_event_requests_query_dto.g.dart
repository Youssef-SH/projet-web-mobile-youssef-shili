// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_event_requests_query_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const AdminEventRequestsQueryDtoStatusEnum
    _$adminEventRequestsQueryDtoStatusEnum_pending =
    const AdminEventRequestsQueryDtoStatusEnum._('pending');
const AdminEventRequestsQueryDtoStatusEnum
    _$adminEventRequestsQueryDtoStatusEnum_approved =
    const AdminEventRequestsQueryDtoStatusEnum._('approved');
const AdminEventRequestsQueryDtoStatusEnum
    _$adminEventRequestsQueryDtoStatusEnum_rejected =
    const AdminEventRequestsQueryDtoStatusEnum._('rejected');

AdminEventRequestsQueryDtoStatusEnum
    _$adminEventRequestsQueryDtoStatusEnumValueOf(String name) {
  switch (name) {
    case 'pending':
      return _$adminEventRequestsQueryDtoStatusEnum_pending;
    case 'approved':
      return _$adminEventRequestsQueryDtoStatusEnum_approved;
    case 'rejected':
      return _$adminEventRequestsQueryDtoStatusEnum_rejected;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<AdminEventRequestsQueryDtoStatusEnum>
    _$adminEventRequestsQueryDtoStatusEnumValues = BuiltSet<
        AdminEventRequestsQueryDtoStatusEnum>(const <AdminEventRequestsQueryDtoStatusEnum>[
  _$adminEventRequestsQueryDtoStatusEnum_pending,
  _$adminEventRequestsQueryDtoStatusEnum_approved,
  _$adminEventRequestsQueryDtoStatusEnum_rejected,
]);

Serializer<AdminEventRequestsQueryDtoStatusEnum>
    _$adminEventRequestsQueryDtoStatusEnumSerializer =
    _$AdminEventRequestsQueryDtoStatusEnumSerializer();

class _$AdminEventRequestsQueryDtoStatusEnumSerializer
    implements PrimitiveSerializer<AdminEventRequestsQueryDtoStatusEnum> {
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
    AdminEventRequestsQueryDtoStatusEnum
  ];
  @override
  final String wireName = 'AdminEventRequestsQueryDtoStatusEnum';

  @override
  Object serialize(
          Serializers serializers, AdminEventRequestsQueryDtoStatusEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  AdminEventRequestsQueryDtoStatusEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      AdminEventRequestsQueryDtoStatusEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$AdminEventRequestsQueryDto extends AdminEventRequestsQueryDto {
  @override
  final JsonObject? page;
  @override
  final JsonObject? limit;
  @override
  final AdminEventRequestsQueryDtoStatusEnum? status;
  @override
  final String? clubId;

  factory _$AdminEventRequestsQueryDto(
          [void Function(AdminEventRequestsQueryDtoBuilder)? updates]) =>
      (AdminEventRequestsQueryDtoBuilder()..update(updates))._build();

  _$AdminEventRequestsQueryDto._(
      {this.page, this.limit, this.status, this.clubId})
      : super._();
  @override
  AdminEventRequestsQueryDto rebuild(
          void Function(AdminEventRequestsQueryDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AdminEventRequestsQueryDtoBuilder toBuilder() =>
      AdminEventRequestsQueryDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AdminEventRequestsQueryDto &&
        page == other.page &&
        limit == other.limit &&
        status == other.status &&
        clubId == other.clubId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, page.hashCode);
    _$hash = $jc(_$hash, limit.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, clubId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AdminEventRequestsQueryDto')
          ..add('page', page)
          ..add('limit', limit)
          ..add('status', status)
          ..add('clubId', clubId))
        .toString();
  }
}

class AdminEventRequestsQueryDtoBuilder
    implements
        Builder<AdminEventRequestsQueryDto, AdminEventRequestsQueryDtoBuilder> {
  _$AdminEventRequestsQueryDto? _$v;

  JsonObject? _page;
  JsonObject? get page => _$this._page;
  set page(JsonObject? page) => _$this._page = page;

  JsonObject? _limit;
  JsonObject? get limit => _$this._limit;
  set limit(JsonObject? limit) => _$this._limit = limit;

  AdminEventRequestsQueryDtoStatusEnum? _status;
  AdminEventRequestsQueryDtoStatusEnum? get status => _$this._status;
  set status(AdminEventRequestsQueryDtoStatusEnum? status) =>
      _$this._status = status;

  String? _clubId;
  String? get clubId => _$this._clubId;
  set clubId(String? clubId) => _$this._clubId = clubId;

  AdminEventRequestsQueryDtoBuilder() {
    AdminEventRequestsQueryDto._defaults(this);
  }

  AdminEventRequestsQueryDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _page = $v.page;
      _limit = $v.limit;
      _status = $v.status;
      _clubId = $v.clubId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AdminEventRequestsQueryDto other) {
    _$v = other as _$AdminEventRequestsQueryDto;
  }

  @override
  void update(void Function(AdminEventRequestsQueryDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AdminEventRequestsQueryDto build() => _build();

  _$AdminEventRequestsQueryDto _build() {
    final _$result = _$v ??
        _$AdminEventRequestsQueryDto._(
          page: page,
          limit: limit,
          status: status,
          clubId: clubId,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
