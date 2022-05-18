import 'package:flutter/material.dart';

enum BuyStockMode {
  buy,
  sell,
}

class BuyStockProvider with ChangeNotifier {
  BuyStockMode mode;
  BuyStockProvider({required this.mode});
}
