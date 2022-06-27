import 'dart:math' as Math;
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:json_annotation/json_annotation.dart';

import '../converter/fl_spot_converter.dart';

part 'stock_performance.g.dart';

@JsonSerializable()
@CopyWith()
class StockPerformance {
  @FlSpotConverter()
  final List<FlSpot> spots;

  StockPerformance({required this.spots});

  double get min => spots.fold<double>(
        spots.first.y,
        (previousValue, element) => Math.min(previousValue, element.y),
      );

  double get max => spots.fold<double>(
        spots.first.y,
        (previousValue, element) => Math.max(previousValue, element.y),
      );

  double get range => max - min;

  factory StockPerformance.fromJson(Map<String, dynamic> json) =>
      _$StockPerformanceFromJson(json);

  get toJson => _$StockPerformanceToJson(this);
}
