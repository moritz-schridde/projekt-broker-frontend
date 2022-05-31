// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_detail.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$OrderDetailCWProxy {
  OrderDetail amount(int amount);

  OrderDetail value(double value);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OrderDetail(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OrderDetail(...).copyWith(id: 12, name: "My name")
  /// ````
  OrderDetail call({
    int? amount,
    double? value,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfOrderDetail.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfOrderDetail.copyWith.fieldName(...)`
class _$OrderDetailCWProxyImpl implements _$OrderDetailCWProxy {
  final OrderDetail _value;

  const _$OrderDetailCWProxyImpl(this._value);

  @override
  OrderDetail amount(int amount) => this(amount: amount);

  @override
  OrderDetail value(double value) => this(value: value);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OrderDetail(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OrderDetail(...).copyWith(id: 12, name: "My name")
  /// ````
  OrderDetail call({
    Object? amount = const $CopyWithPlaceholder(),
    Object? value = const $CopyWithPlaceholder(),
  }) {
    return OrderDetail(
      amount: amount == const $CopyWithPlaceholder() || amount == null
          ? _value.amount
          // ignore: cast_nullable_to_non_nullable
          : amount as int,
      value: value == const $CopyWithPlaceholder() || value == null
          ? _value.value
          // ignore: cast_nullable_to_non_nullable
          : value as double,
    );
  }
}

extension $OrderDetailCopyWith on OrderDetail {
  /// Returns a callable class that can be used as follows: `instanceOfOrderDetail.copyWith(...)` or like so:`instanceOfOrderDetail.copyWith.fieldName(...)`.
  _$OrderDetailCWProxy get copyWith => _$OrderDetailCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDetail _$OrderDetailFromJson(Map<String, dynamic> json) => OrderDetail(
      value: (json['value'] as num).toDouble(),
      amount: json['amount'] as int,
    );

Map<String, dynamic> _$OrderDetailToJson(OrderDetail instance) =>
    <String, dynamic>{
      'value': instance.value,
      'amount': instance.amount,
    };
