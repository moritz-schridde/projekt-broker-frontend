import 'package:flutter/material.dart';

import 'package:json_annotation/json_annotation.dart';

part 'stock.g.dart';

@JsonSerializable()
class Stock {
  final String shortName;
  final String longName;
  final IconData icon;
  final double price;

  Stock({
    required this.shortName,
    required this.longName,
    IconData? icon,
    required this.price,
  }) : icon = icon ?? Icons.assessment;

  factory Stock.fromJson(Map<String, dynamic> json) => _$StockFromJson(json);

  get toJson => _$StockToJson(this);
}
