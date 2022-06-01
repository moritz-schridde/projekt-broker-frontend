// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$OrderCWProxy {
  Order doing(Doing doing);

  Order info(OrderDetail info);

  Order orderId(String orderId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Order(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Order(...).copyWith(id: 12, name: "My name")
  /// ````
  Order call({
    Doing? doing,
    OrderDetail? info,
    String? orderId,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfOrder.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfOrder.copyWith.fieldName(...)`
class _$OrderCWProxyImpl implements _$OrderCWProxy {
  final Order _value;

  const _$OrderCWProxyImpl(this._value);

  @override
  Order doing(Doing doing) => this(doing: doing);

  @override
  Order info(OrderDetail info) => this(info: info);

  @override
  Order orderId(String orderId) => this(orderId: orderId);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Order(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Order(...).copyWith(id: 12, name: "My name")
  /// ````
  Order call({
    Object? doing = const $CopyWithPlaceholder(),
    Object? info = const $CopyWithPlaceholder(),
    Object? orderId = const $CopyWithPlaceholder(),
  }) {
    return Order(
      doing: doing == const $CopyWithPlaceholder() || doing == null
          ? _value.doing
          // ignore: cast_nullable_to_non_nullable
          : doing as Doing,
      info: info == const $CopyWithPlaceholder() || info == null
          ? _value.info
          // ignore: cast_nullable_to_non_nullable
          : info as OrderDetail,
      orderId: orderId == const $CopyWithPlaceholder() || orderId == null
          ? _value.orderId
          // ignore: cast_nullable_to_non_nullable
          : orderId as String,
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
      orderId: json['orderId'] as String,
      doing: $enumDecode(_$DoingEnumMap, json['doing']),
      info: OrderDetail.fromJson(json['info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'orderId': instance.orderId,
      'doing': _$DoingEnumMap[instance.doing],
      'info': instance.info,
    };

const _$DoingEnumMap = {
  Doing.buy: 'buy',
  Doing.sell: 'sell',
};
