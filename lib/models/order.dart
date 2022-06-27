import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';

import 'package:json_annotation/json_annotation.dart';
import 'package:projekt_broker_frontend/models/order_detail.dart';

part 'order.g.dart';

@JsonEnum()
enum OrderType {
  BUY,
  SELL,
}

@JsonEnum()
enum OrderState {
  CLOSED,
  OPEN,
  PENDING,
}

@JsonSerializable(explicitToJson: true)
@CopyWith()
class Order {
  final int? orderId;
  @JsonKey(name: "offerType")
  final OrderType type;
  @JsonKey(name: "offerState")
  final OrderState? state;
  final OrderDetail info;
  final DateTime? timestamp;

  Order({
    this.orderId,
    required this.type,
    required this.info,
    this.state,
    this.timestamp,
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  get toJson => _$OrderToJson(this);
}
