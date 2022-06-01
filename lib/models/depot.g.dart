// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'depot.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DepotCWProxy {
  Depot stocks(List<OwnedStock> stocks);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Depot(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Depot(...).copyWith(id: 12, name: "My name")
  /// ````
  Depot call({
    List<OwnedStock>? stocks,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDepot.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDepot.copyWith.fieldName(...)`
class _$DepotCWProxyImpl implements _$DepotCWProxy {
  final Depot _value;

  const _$DepotCWProxyImpl(this._value);

  @override
  Depot stocks(List<OwnedStock> stocks) => this(stocks: stocks);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Depot(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Depot(...).copyWith(id: 12, name: "My name")
  /// ````
  Depot call({
    Object? stocks = const $CopyWithPlaceholder(),
  }) {
    return Depot(
      stocks: stocks == const $CopyWithPlaceholder() || stocks == null
          ? _value.stocks
          // ignore: cast_nullable_to_non_nullable
          : stocks as List<OwnedStock>,
    );
  }
}

extension $DepotCopyWith on Depot {
  /// Returns a callable class that can be used as follows: `instanceOfDepot.copyWith(...)` or like so:`instanceOfDepot.copyWith.fieldName(...)`.
  _$DepotCWProxy get copyWith => _$DepotCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Depot _$DepotFromJson(Map<String, dynamic> json) => Depot(
      stocks: (json['stocks'] as List<dynamic>)
          .map((e) => OwnedStock.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DepotToJson(Depot instance) => <String, dynamic>{
      'stocks': instance.stocks,
    };
