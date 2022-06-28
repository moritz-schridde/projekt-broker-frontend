// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$StockCWProxy {
  Stock icon(IconData icon);

  Stock longName(String longName);

  Stock price(double price);

  Stock shareId(int? shareId);

  Stock shortName(String shortName);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Stock(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Stock(...).copyWith(id: 12, name: "My name")
  /// ````
  Stock call({
    IconData? icon,
    String? longName,
    double? price,
    int? shareId,
    String? shortName,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfStock.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfStock.copyWith.fieldName(...)`
class _$StockCWProxyImpl implements _$StockCWProxy {
  final Stock _value;

  const _$StockCWProxyImpl(this._value);

  @override
  Stock icon(IconData icon) => this(icon: icon);

  @override
  Stock longName(String longName) => this(longName: longName);

  @override
  Stock price(double price) => this(price: price);

  @override
  Stock shareId(int? shareId) => this(shareId: shareId);

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
    Object? icon = const $CopyWithPlaceholder(),
    Object? longName = const $CopyWithPlaceholder(),
    Object? price = const $CopyWithPlaceholder(),
    Object? shareId = const $CopyWithPlaceholder(),
    Object? shortName = const $CopyWithPlaceholder(),
  }) {
    return Stock(
      icon: icon == const $CopyWithPlaceholder() || icon == null
          ? _value.icon
          // ignore: cast_nullable_to_non_nullable
          : icon as IconData,
      longName: longName == const $CopyWithPlaceholder() || longName == null
          ? _value.longName
          // ignore: cast_nullable_to_non_nullable
          : longName as String,
      price: price == const $CopyWithPlaceholder() || price == null
          ? _value.price
          // ignore: cast_nullable_to_non_nullable
          : price as double,
      shareId: shareId == const $CopyWithPlaceholder()
          ? _value.shareId
          // ignore: cast_nullable_to_non_nullable
          : shareId as int?,
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
      shareId: json['shareId'] as int?,
      shortName: json['shortName'] as String,
      longName: json['longName'] as String,
      price: (json['price'] as num).toDouble(),
      icon: const IconConverter().fromJson(json['iconId'] as String),
    );

Map<String, dynamic> _$StockToJson(Stock instance) => <String, dynamic>{
      'shareId': instance.shareId,
      'shortName': instance.shortName,
      'longName': instance.longName,
      'iconId': "${instance.shareId}",
      'price': instance.price,
    };
