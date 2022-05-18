import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projekt_broker_frontend/pages/stock_detail/stock_detail_page.dart';
import 'package:projekt_broker_frontend/screens/auth/auth_screen.dart';
import 'package:projekt_broker_frontend/screens/buy_stock/buy_stock_provider.dart';
import 'package:projekt_broker_frontend/screens/buy_stock/buy_stock_screen.dart';
import 'package:projekt_broker_frontend/screens/buy_stock/widgets/draggable_overview.dart';
import 'package:projekt_broker_frontend/screens/crash/crash_screen.dart';
import 'package:projekt_broker_frontend/screens/home/home_screen.dart';
import 'package:projekt_broker_frontend/screens/loading/loading_screen.dart';
import 'package:projekt_broker_frontend/screens/order_overview/order_overview_screen.dart';
import 'package:projekt_broker_frontend/screens/profile/profile_screen.dart';
import 'package:projekt_broker_frontend/screens/stock_search/stock_search_screen.dart';
import 'package:provider/provider.dart';

import 'pages/stock_detail/stock_detail_page.dart';

abstract class AppRouter {
  static MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    late final Map<String, dynamic> arguments;
    try {
      arguments = routeSettings.arguments as Map<String, dynamic>;
    } catch (e) {
      arguments = {};
    }
    print("Navigating to ${routeSettings.name}");
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (context) {
        // Non auth required routes
        switch (routeSettings.name) {
          case AuthScreen.routeName:
            return AuthScreen();
          case LoadingScreen.routeName:
            return LoadingScreen();
          case CrashScreen.routeName:
            return CrashScreen();
        }

        // read Providers here

        //

        // Auth required routes
        switch (routeSettings.name) {
          case HomeScreen.routeName:
            return MultiProvider(
              providers: [
                Provider.value(value: false), // dummy provider
              ],
              builder: (context, _) {
                return HomeScreen();
              },
            );
          case OrderOverviewScreen.routeName:
            return OrderOverviewScreen();
          case StockSearchScreen.routeName:
            return StockSearchScreen();
          case ProfileScreen.routeName:
            return ProfileScreen();
          case StockDetailPage.routeName:
            return StockDetailPage();
          case BuyStockScreen.routeName:
            return ChangeNotifierProvider(
              create: (context) => BuyStockProvider(mode: arguments["mode"]),
              child: BuyStockScreen(),
            );

          default:
            return const CrashScreen();
        }
      },
    );
  }
}
