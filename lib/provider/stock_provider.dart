import 'package:flutter/cupertino.dart';
import 'package:projekt_broker_frontend/services/backend_service.dart';

import '../models/stock.dart';

class StockProvider with ChangeNotifier {
  // deps
  final BackendService backendService;

  List<Stock>? _stocks;

  StockProvider({
    required this.backendService,
  });

  List<Stock>? get stocks {
    if (_stocks == null) {
      backendService
          .callBackend<Stock>(
            requestType: RequestType.GET,
            endpoint: "share",
            jsonParser: (json) => Stock.fromJson(json),
          )
          .then((stocks) => _stocks = stocks)
          .then((_) => notifyListeners());
    }

    return _stocks;
  }
}
