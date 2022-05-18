import 'dart:html';

import 'package:flutter/material.dart';
import 'package:projekt_broker_frontend/provider/mock_provider.dart';

class PortfolioProvider with ChangeNotifier {
  final MockProvider mockProvider;

  double? _budget;

  double? get budget {
    _budget ??= mockProvider.portfolioBudget;
    return _budget;
  }

  PortfolioProvider({required this.mockProvider});
}
