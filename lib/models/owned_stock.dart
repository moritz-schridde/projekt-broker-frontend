import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

import 'stock.dart';

part 'owned_stock.g.dart';

@JsonSerializable()
@CopyWith()
class OwnedStock {
  @JsonKey(name: "share")
  final Stock stock;
  final double amount;
  final double purchasePrice;

  OwnedStock({
    required this.stock,
    required this.amount,
    required this.purchasePrice,
  });

  factory OwnedStock.fromJson(Map<String, dynamic> json) =>
      _$OwnedStockFromJson(json);

  get toJson => _$OwnedStockToJson(this);
}
