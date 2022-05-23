import 'package:flutter/material.dart';

class MockProvider with ChangeNotifier {
  bool initialized = false;

  double portfolioBudget = 10000;

  MockProvider() {
    loadMockData();
  }

  Future loadMockData() async {
    initialized = true;
    notifyListeners();
  }
}
