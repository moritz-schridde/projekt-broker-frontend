import 'package:flutter/material.dart';
import 'package:projekt_broker_frontend/models/owned_stock.dart';
import 'package:projekt_broker_frontend/models/stock_performance.dart';
import 'package:projekt_broker_frontend/services/backend_service.dart';

import '../../models/stock.dart';
import '../../provider/portfolio_provider.dart';

class StockDetailScreenProvider with ChangeNotifier {
  // dep
  final PortfolioProvider portfolioProvider;
  final BackendService backendService;

  final Stock stock;
  late final OwnedStock? ownedStock;
  StockPerformance? stockPerformance;

  StockDetailScreenProvider({
    required this.backendService,
    required this.portfolioProvider,
    required this.stock,
  }) {
    init();
  }

  void init() {
    ownedStock = portfolioProvider.tryGetOwnedStock(stock);

    backendService
        .callBackend<StockPerformance>(
      requestType: RequestType.GET,
      endpoint: "share/${stock.shareId}/performance",
      jsonParser: (json) => StockPerformance.fromJson(json),
    )
        .then((response) {
      stockPerformance = response;
      notifyListeners();
    });
  }
}
