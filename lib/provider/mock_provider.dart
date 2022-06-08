import 'package:flutter/material.dart';
import 'package:projekt_broker_frontend/models/owned_stock.dart';
import 'package:projekt_broker_frontend/models/stock.dart';

import '../models/depot.dart';
import '../models/order.dart';
import '../models/order_detail.dart';

class MockProvider with ChangeNotifier {
  bool initialized = false;

  double portfolioBudget = 10000;
  int portfolioStockCount = 211;

  Stock dummyStock = Stock(
    longName: "Tesla",
    shortName: "TSL",
    icon: Icons.airline_seat_flat_angled_rounded,
    price: 750,
  );

  Stock dummyStock2 = Stock(
    longName: "Google",
    shortName: "GGL",
    icon: Icons.g_mobiledata,
    price: 3000,
  );

  Stock dummyStock3 = Stock(
    longName: "Twitter",
    shortName: "TWT",
    icon: Icons.airplane_ticket,
    price: 5,
  );

  late List<OwnedStock> myStocks;

  late List<Order> myOrders;

  late Depot depot;

  MockProvider() {
    loadMockData();
  }

  Future loadMockData() async {
    myStocks = [
      OwnedStock(stock: dummyStock, amount: 3),
      OwnedStock(stock: dummyStock2, amount: 1),
      OwnedStock(stock: dummyStock3, amount: 2.5),
    ];

    myOrders = [
      Order(
        orderId: "1",
        doing: Doing.buy,
        info: OrderDetail(
          stock: dummyStock,
          value: 750,
          amount: 3,
        ),
      ),
      Order(
        orderId: "2",
        doing: Doing.sell,
        info: OrderDetail(
          stock: dummyStock2,
          value: 3000,
          amount: 1,
        ),
      ),
      Order(
        orderId: "3",
        doing: Doing.buy,
        info: OrderDetail(
          stock: dummyStock3,
          value: 5,
          amount: 2,
        ),
      ),
    ];

    depot = Depot(stocks: myStocks, budget: portfolioBudget);

    initialized = true;
    notifyListeners();
  }
}
