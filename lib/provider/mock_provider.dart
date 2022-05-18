import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
