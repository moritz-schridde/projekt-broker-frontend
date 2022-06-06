//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:projekt_broker_frontend/provider/mock_provider.dart';

import '../models/depot.dart';

class PortfolioProvider with ChangeNotifier {
  final MockProvider mockProvider;

  double? _budget;
  int? _stockCount;

  double? get budget {
    _budget ??= mockProvider.depot.budget;
    return _budget;
  }

  int? get stockCount {
    _stockCount ??= mockProvider.depot.stocks.length;
    return _stockCount;
  }

  Depot get depot {
    return mockProvider.depot;
  }

  PortfolioProvider({required this.mockProvider});
}
