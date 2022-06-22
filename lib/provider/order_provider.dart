import 'package:flutter/cupertino.dart';
import 'package:projekt_broker_frontend/services/backend_service.dart';

import '../models/order.dart';
import 'mock_provider.dart';

class OrderProvider with ChangeNotifier {
  // deps
  final MockProvider mockProvider;
  final BackendService backendService;

  List<Order>? _orders;

  OrderProvider({
    required this.mockProvider,
    required this.backendService,
  });

  List<Order>? get orders {
    if (_orders == null) {
      backendService
          .callBackend<Order>(
            requestType: RequestType.GET,
            endpoint: "order",
            jsonParser: (json) => Order.fromJson(json),
          )
          .then((orders) => _orders = orders)
          .then((_) => notifyListeners());
    }
    return _orders;
  }
}
