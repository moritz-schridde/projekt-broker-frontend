import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';

import 'package:json_annotation/json_annotation.dart';
import 'package:projekt_broker_frontend/models/order_detail.dart';

part 'order.g.dart';

@JsonEnum()
enum Doing {
  buy,
  sell,
}

@JsonSerializable()
@CopyWith()
class Order {
  final String orderId;
  final Doing doing;
  final OrderDetail info;

  Order({
    required this.orderId,
    required this.doing,
    required this.info,
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  get toJson => _$OrderToJson(this);
}
