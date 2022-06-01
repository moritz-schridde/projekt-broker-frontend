import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

import 'owned_stock.dart';

part 'depot.g.dart';

@JsonSerializable()
@CopyWith()
class Depot {
  final List<OwnedStock> stocks;
  final double budget;

  Depot({required this.stocks, required this.budget});

  get total {
    double total = 0;
    while (stocks.iterator.moveNext()) {
      total +=
          stocks.iterator.current.amount * stocks.iterator.current.stock.price;
    }

    return total;
  }

  factory Depot.fromJson(Map<String, dynamic> json) => _$DepotFromJson(json);

  get toJson => _$DepotToJson(this);
}
