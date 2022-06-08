import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';

import 'package:json_annotation/json_annotation.dart';
import 'package:projekt_broker_frontend/models/stock.dart';

part 'order_detail.g.dart';

@JsonSerializable()
@CopyWith()
class OrderDetail {
  final Stock stock;
  final double value;
  final int amount;

  OrderDetail({
    required this.stock,
    required this.value,
    required this.amount,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailFromJson(json);

  get toJson => _$OrderDetailToJson(this);

  double get stockPrice => this.value / this.amount;
}
