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
    _orders ??= mockProvider.myOrders;
    return _orders;
  }
}
