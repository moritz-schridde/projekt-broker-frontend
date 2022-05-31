import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';

import 'package:json_annotation/json_annotation.dart';

part 'order_detail.g.dart';

@JsonSerializable()
@CopyWith()
class OrderDetail {
  final double value;
  final int amount;

  OrderDetail({
    required this.value,
    required this.amount,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailFromJson(json);

  get toJson => _$OrderDetailAccountToJson(this);
}
