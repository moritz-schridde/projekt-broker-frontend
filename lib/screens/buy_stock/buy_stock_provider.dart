import 'package:flutter/material.dart';
import 'package:projekt_broker_frontend/models/order_detail.dart';
import 'package:projekt_broker_frontend/provider/order_provider.dart';
import 'package:projekt_broker_frontend/provider/portfolio_provider.dart';
import 'package:projekt_broker_frontend/services/backend_service.dart';

import '../../models/order.dart';
import '../../models/stock.dart';

enum BuyStockMode {
  buy,
  sell,
}

class BuyStockProvider with ChangeNotifier {
  // deps
  BackendService backendService;
  OrderProvider orderProvider;

  late Stock stock;

  late BuyStockMode mode;

  late TextEditingController textEditControllerMoney;
  late TextEditingController textEditControllerStock;

  late int availableAmount;

  bool expertise = false;

  BuyStockProvider({
    required this.backendService,
    required this.orderProvider,
  });

  void init({
    required Stock stock,
    required BuyStockMode mode,
    required int amount,
  }) {
    this.stock = stock;
    this.mode = mode;

    textEditControllerMoney = TextEditingController(
      text: stock.price.toStringAsFixed(2),
    );
    textEditControllerStock = TextEditingController(
      text: "$amount",
    );
    setMoneyCount(stockCount: amount);
    availableAmount = amount;
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

  Future submit() async {
    final amount = int.tryParse(textEditControllerStock.text) ?? 1;
    final order = Order(
      info: OrderDetail(
        stock: stock,
        value: stock.price * amount, // ! buying at the currently known price
        amount: amount,
      ),
      type: OrderType.values[mode.index],
    );

    await backendService.callBackend(
      requestType: RequestType.POST,
      endpoint: "order",
      body: order.toJson,
    );
    orderProvider.clearCache(notify: true);
  }
}
