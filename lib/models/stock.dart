import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';

import 'package:json_annotation/json_annotation.dart';

import '../converter/icon_converter.dart';

part 'stock.g.dart';

@JsonSerializable()
@CopyWith()
class Stock {
  final int? shareId;
  final String shortName;
  final String longName;
  @JsonKey(name: "iconId")
  @IconConverter()
  final IconData icon;
  final double price;

  Stock({
    this.shareId,
    required this.shortName,
    required this.longName,
    required this.price,
    required this.icon,
  });

  factory Stock.fromJson(Map<String, dynamic> json) => _$StockFromJson(json);

  get toJson => _$StockToJson(this);
}
