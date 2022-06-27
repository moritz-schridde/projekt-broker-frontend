// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_performance.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$StockPerformanceCWProxy {
  StockPerformance spots(List<FlSpot> spots);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `StockPerformance(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// StockPerformance(...).copyWith(id: 12, name: "My name")
  /// ````
  StockPerformance call({
    List<FlSpot>? spots,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfStockPerformance.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfStockPerformance.copyWith.fieldName(...)`
class _$StockPerformanceCWProxyImpl implements _$StockPerformanceCWProxy {
  final StockPerformance _value;

  const _$StockPerformanceCWProxyImpl(this._value);

  @override
  StockPerformance spots(List<FlSpot> spots) => this(spots: spots);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `StockPerformance(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// StockPerformance(...).copyWith(id: 12, name: "My name")
  /// ````
  StockPerformance call({
    Object? spots = const $CopyWithPlaceholder(),
  }) {
    return StockPerformance(
      spots: spots == const $CopyWithPlaceholder() || spots == null
          ? _value.spots
          // ignore: cast_nullable_to_non_nullable
          : spots as List<FlSpot>,
    );
  }
}

extension $StockPerformanceCopyWith on StockPerformance {
  /// Returns a callable class that can be used as follows: `instanceOfStockPerformance.copyWith(...)` or like so:`instanceOfStockPerformance.copyWith.fieldName(...)`.
  _$StockPerformanceCWProxy get copyWith => _$StockPerformanceCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockPerformance _$StockPerformanceFromJson(Map<String, dynamic> json) =>
    StockPerformance(
      spots: (json['spots'] as List<dynamic>)
          .map((e) =>
              const FlSpotConverter().fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StockPerformanceToJson(StockPerformance instance) =>
    <String, dynamic>{
      'spots': instance.spots.map(const FlSpotConverter().toJson).toList(),
    };
