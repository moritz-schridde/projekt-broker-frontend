import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

import 'owned_stock.dart';

part 'depot.g.dart';

@JsonSerializable()
@CopyWith()
class Depot {
  @JsonKey(name: "shares")
  final List<OwnedStock> stocks;
  final double budget;

  Depot({required this.stocks, required this.budget});

  double get investedTotal {
    double total = 0;
    Iterator StockIterator = stocks.iterator;
    while (StockIterator.moveNext()) {
      total += StockIterator.current.amount * StockIterator.current.stock.price;
    }

    return total;
  }

  double get purchasePriceTotal => stocks.fold<double>(
        0,
        (value, ownedStock) =>
            value + (ownedStock.purchasePrice * ownedStock.amount),
      );

  factory Depot.fromJson(Map<String, dynamic> json) => _$DepotFromJson(json);

  get toJson => _$DepotToJson(this);
}
