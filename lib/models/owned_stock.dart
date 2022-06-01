import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

import 'stock.dart';

part 'owned_stock.g.dart';

@JsonSerializable()
@CopyWith()
class OwnedStock {
  final Stock stock;
  final double amount;

  OwnedStock({
    required this.stock,
    required this.amount,
  });

  factory OwnedStock.fromJson(Map<String, dynamic> json) =>
      _$OwnedStockFromJson(json);

  get toJson => _$OwnedStockToJson(this);
}
