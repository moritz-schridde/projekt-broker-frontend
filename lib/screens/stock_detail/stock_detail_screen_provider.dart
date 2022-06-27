import 'package:flutter/material.dart';
import 'package:projekt_broker_frontend/models/owned_stock.dart';

import '../../models/stock.dart';
import '../../provider/portfolio_provider.dart';

class StockDetailScreenProvider with ChangeNotifier {
  // dep
  PortfolioProvider portfolioProvider;

  final Stock stock;
  late final OwnedStock? ownedStock;

  StockDetailScreenProvider({
    required this.portfolioProvider,
    required this.stock,
  }) {
    ownedStock = portfolioProvider.tryGetOwnedStock(stock);
  }
}
