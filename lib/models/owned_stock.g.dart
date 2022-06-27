// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'owned_stock.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$OwnedStockCWProxy {
  OwnedStock amount(double amount);

  OwnedStock purchasePrice(double purchasePrice);

  OwnedStock stock(Stock stock);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OwnedStock(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OwnedStock(...).copyWith(id: 12, name: "My name")
  /// ````
  OwnedStock call({
    double? amount,
    double? purchasePrice,
    Stock? stock,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfOwnedStock.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfOwnedStock.copyWith.fieldName(...)`
class _$OwnedStockCWProxyImpl implements _$OwnedStockCWProxy {
  final OwnedStock _value;

  const _$OwnedStockCWProxyImpl(this._value);

  @override
  OwnedStock amount(double amount) => this(amount: amount);

  @override
  OwnedStock purchasePrice(double purchasePrice) =>
      this(purchasePrice: purchasePrice);

  @override
  OwnedStock stock(Stock stock) => this(stock: stock);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OwnedStock(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OwnedStock(...).copyWith(id: 12, name: "My name")
  /// ````
  OwnedStock call({
    Object? amount = const $CopyWithPlaceholder(),
    Object? purchasePrice = const $CopyWithPlaceholder(),
    Object? stock = const $CopyWithPlaceholder(),
  }) {
    return OwnedStock(
      amount: amount == const $CopyWithPlaceholder() || amount == null
          ? _value.amount
          // ignore: cast_nullable_to_non_nullable
          : amount as double,
      purchasePrice:
          purchasePrice == const $CopyWithPlaceholder() || purchasePrice == null
              ? _value.purchasePrice
              // ignore: cast_nullable_to_non_nullable
              : purchasePrice as double,
      stock: stock == const $CopyWithPlaceholder() || stock == null
          ? _value.stock
          // ignore: cast_nullable_to_non_nullable
          : stock as Stock,
    );
  }
}

extension $OwnedStockCopyWith on OwnedStock {
  /// Returns a callable class that can be used as follows: `instanceOfOwnedStock.copyWith(...)` or like so:`instanceOfOwnedStock.copyWith.fieldName(...)`.
  _$OwnedStockCWProxy get copyWith => _$OwnedStockCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OwnedStock _$OwnedStockFromJson(Map<String, dynamic> json) => OwnedStock(
      stock: Stock.fromJson(json['share'] as Map<String, dynamic>),
      amount: (json['amount'] as num).toDouble(),
      purchasePrice: (json['purchasePrice'] as num).toDouble(),
    );

Map<String, dynamic> _$OwnedStockToJson(OwnedStock instance) =>
    <String, dynamic>{
      'share': instance.stock,
      'amount': instance.amount,
      'purchasePrice': instance.purchasePrice,
    };
