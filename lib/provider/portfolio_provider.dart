//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:projekt_broker_frontend/models/owned_stock.dart';
import 'package:projekt_broker_frontend/provider/mock_provider.dart';
import 'package:projekt_broker_frontend/services/backend_service.dart';

import '../models/depot.dart';
import '../models/stock.dart';

class PortfolioProvider with ChangeNotifier {
  final BackendService backendService;

  Depot? _depot;

  PortfolioProvider({
    required this.backendService,
  });

  Depot? get depot {
    if (_depot == null) {
      backendService
          .callBackend<Depot>(
            requestType: RequestType.GET,
            endpoint: "depot",
            jsonParser: (json) => Depot.fromJson(json),
          )
          .then((depot) => _depot = depot)
          .then((_) => notifyListeners());
    }

    return _depot;
    // return mockProvider.depot;
  }

  double? get budget {
    return _depot?.budget;
  }

  int? get stockCount {
    return _depot?.stocks.length;
  }

  OwnedStock? tryGetOwnedStock(Stock stock) {
    try {
      return _depot?.stocks.firstWhere(
        (ownedStock) => ownedStock.stock.shareId == stock.shareId,
      );
    } catch (e) {
      return null;
    }
  }

  void clearCache({bool notify = false}) {
    _depot = null;
    if (notify) {
      notifyListeners();
    }
  }
}
