import 'package:flutter/material.dart';
import 'package:projekt_broker_frontend/screens/home/home_screen.dart';
import 'package:projekt_broker_frontend/screens/order_overview/order_overview_screen.dart';
import 'package:projekt_broker_frontend/screens/profile/profile_screen.dart';
import 'package:projekt_broker_frontend/screens/stock_search/stock_search_screen.dart';

class NavigationProvider with ChangeNotifier {
  static const routes = [
    HomeScreen.routeName,
    OrderOverviewScreen.routeName,
    StockSearchScreen.routeName,
    ProfileScreen.routeName,
  ];

  int _currentRouteIndex = 0;

  int get currentRouteIndex => _currentRouteIndex;

  set currentRouteIndex(int currentRouteIndex) {
    _currentRouteIndex = currentRouteIndex;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }
}
