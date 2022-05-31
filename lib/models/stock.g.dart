// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$StockCWProxy {
  Stock longName(String longName);

  Stock price(double price);

  Stock shortName(String shortName);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Stock(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Stock(...).copyWith(id: 12, name: "My name")
  /// ````
  Stock call({
    String? longName,
    double? price,
    String? shortName,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfStock.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfStock.copyWith.fieldName(...)`
class _$StockCWProxyImpl implements _$StockCWProxy {
  final Stock _value;

  const _$StockCWProxyImpl(this._value);

  @override
  Stock longName(String longName) => this(longName: longName);

  @override
  Stock price(double price) => this(price: price);

  @override
  Stock shortName(String shortName) => this(shortName: shortName);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Stock(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Stock(...).copyWith(id: 12, name: "My name")
  /// ````
  Stock call({
    Object? longName = const $CopyWithPlaceholder(),
    Object? price = const $CopyWithPlaceholder(),
    Object? shortName = const $CopyWithPlaceholder(),
  }) {
    return Stock(
      longName: longName == const $CopyWithPlaceholder() || longName == null
          ? _value.longName
          // ignore: cast_nullable_to_non_nullable
          : longName as String,
      price: price == const $CopyWithPlaceholder() || price == null
          ? _value.price
          // ignore: cast_nullable_to_non_nullable
          : price as double,
      shortName: shortName == const $CopyWithPlaceholder() || shortName == null
          ? _value.shortName
          // ignore: cast_nullable_to_non_nullable
          : shortName as String,
    );
  }
}

extension $StockCopyWith on Stock {
  /// Returns a callable class that can be used as follows: `instanceOfStock.copyWith(...)` or like so:`instanceOfStock.copyWith.fieldName(...)`.
  _$StockCWProxy get copyWith => _$StockCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Stock _$StockFromJson(Map<String, dynamic> json) => Stock(
      shortName: json['shortName'] as String,
      longName: json['longName'] as String,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$StockToJson(Stock instance) => <String, dynamic>{
      'shortName': instance.shortName,
      'longName': instance.longName,
      'price': instance.price,
    };
