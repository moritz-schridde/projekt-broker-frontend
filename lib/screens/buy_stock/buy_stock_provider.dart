import 'package:flutter/material.dart';

import '../../models/stock.dart';

enum BuyStockMode {
  buy,
  sell,
}

class BuyStockProvider with ChangeNotifier {
  BuyStockMode mode;
  late TextEditingController textEditControllerMoney;
  late TextEditingController textEditControllerStock;
  final Stock stock;

  BuyStockProvider({
    required this.mode,
    required this.stock,
  }) {
    init();
  }

  void init() {
    textEditControllerMoney = TextEditingController(
      text: stock.price.toStringAsFixed(2),
    );
    textEditControllerStock = TextEditingController(
      text: "1",
    );
  }

  void setStockCount({required double money}) {
    final result = money ~/ stock.price;
    textEditControllerStock.text = result.toString();
    setMoneyCount(stockCount: result);
    notifyListeners();
  }

  void setMoneyCount({required int stockCount}) {
    final result = stockCount * stock.price;
    textEditControllerMoney.text = result.toStringAsFixed(2);
    notifyListeners();
  }
}
