// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$OrderCWProxy {
  Order info(OrderDetail info);

  Order orderId(int? orderId);

  Order state(OrderState? state);

  Order timestamp(DateTime? timestamp);

  Order type(OrderType type);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Order(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Order(...).copyWith(id: 12, name: "My name")
  /// ````
  Order call({
    OrderDetail? info,
    int? orderId,
    OrderState? state,
    DateTime? timestamp,
    OrderType? type,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfOrder.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfOrder.copyWith.fieldName(...)`
class _$OrderCWProxyImpl implements _$OrderCWProxy {
  final Order _value;

  const _$OrderCWProxyImpl(this._value);

  @override
  Order info(OrderDetail info) => this(info: info);

  @override
  Order orderId(int? orderId) => this(orderId: orderId);

  @override
  Order state(OrderState? state) => this(state: state);

  @override
  Order timestamp(DateTime? timestamp) => this(timestamp: timestamp);

  @override
  Order type(OrderType type) => this(type: type);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Order(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Order(...).copyWith(id: 12, name: "My name")
  /// ````
  Order call({
    Object? info = const $CopyWithPlaceholder(),
    Object? orderId = const $CopyWithPlaceholder(),
    Object? state = const $CopyWithPlaceholder(),
    Object? timestamp = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
  }) {
    return Order(
      info: info == const $CopyWithPlaceholder() || info == null
          ? _value.info
          // ignore: cast_nullable_to_non_nullable
          : info as OrderDetail,
      orderId: orderId == const $CopyWithPlaceholder()
          ? _value.orderId
          // ignore: cast_nullable_to_non_nullable
          : orderId as int?,
      state: state == const $CopyWithPlaceholder()
          ? _value.state
          // ignore: cast_nullable_to_non_nullable
          : state as OrderState?,
      timestamp: timestamp == const $CopyWithPlaceholder()
          ? _value.timestamp
          // ignore: cast_nullable_to_non_nullable
          : timestamp as DateTime?,
      type: type == const $CopyWithPlaceholder() || type == null
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as OrderType,
    );
  }
}

extension $OrderCopyWith on Order {
  /// Returns a callable class that can be used as follows: `instanceOfOrder.copyWith(...)` or like so:`instanceOfOrder.copyWith.fieldName(...)`.
  _$OrderCWProxy get copyWith => _$OrderCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      orderId: json['orderId'] as int?,
      type: $enumDecode(_$OrderTypeEnumMap, json['offerType']),
      info: OrderDetail.fromJson(json['info'] as Map<String, dynamic>),
      state: $enumDecodeNullable(_$OrderStateEnumMap, json['offerState']),
      timestamp: json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'orderId': instance.orderId,
      'offerType': _$OrderTypeEnumMap[instance.type],
      'offerState': _$OrderStateEnumMap[instance.state],
      'info': instance.info.toJson(),
      'timestamp': instance.timestamp?.toIso8601String(),
    };

const _$OrderTypeEnumMap = {
  OrderType.BUY: 'BUY',
  OrderType.SELL: 'SELL',
};

const _$OrderStateEnumMap = {
  OrderState.CLOSED: 'CLOSED',
  OrderState.OPEN: 'OPEN',
  OrderState.PENDING: 'PENDING',
};
