import 'package:flutter/material.dart';
import 'package:projekt_broker_frontend/provider/portfolio_provider.dart';

import '../../models/stock.dart';

enum BuyStockMode {
  buy,
  sell,
}

class BuyStockProvider with ChangeNotifier {
  late Stock stock;

  late BuyStockMode mode;

  late TextEditingController textEditControllerMoney;
  late TextEditingController textEditControllerStock;

  bool expertise = false;

  BuyStockProvider();

  void init({
    required Stock stock,
    required BuyStockMode mode,
  }) {
    this.stock = stock;
    this.mode = mode;

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

  void setExpertise({required bool? value}) {
    expertise = value ?? false;
    notifyListeners();
  }
}
