import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projekt_broker_frontend/models/stock.dart';

class MockProvider with ChangeNotifier {
  bool initialized = false;

  double portfolioBudget = 10000;

  Stock dummyStock = Stock(
    longName: "Tesla",
    shortName: "TSL",
    icon: Icons.airline_seat_flat_angled_rounded,
    price: 10,
  );

  MockProvider() {
    loadMockData();
  }

  Future loadMockData() async {
    initialized = true;
    notifyListeners();
  }
}
