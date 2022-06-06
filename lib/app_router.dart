import 'package:flutter/material.dart';
import 'package:projekt_broker_frontend/provider/mock_provider.dart';
import 'package:projekt_broker_frontend/provider/navigation_provider.dart';
import 'package:projekt_broker_frontend/screens/auth/auth_screen.dart';
import 'package:projekt_broker_frontend/screens/buy_stock/buy_stock_provider.dart';
import 'package:projekt_broker_frontend/screens/buy_stock/buy_stock_screen.dart';
import 'package:projekt_broker_frontend/screens/buy_stock/widgets/buy_stock_success.dart';
import 'package:projekt_broker_frontend/screens/profile/profile_provider.dart';
import 'package:projekt_broker_frontend/widgets/draggable_overview.dart';
import 'package:projekt_broker_frontend/screens/crash/crash_screen.dart';
import 'package:projekt_broker_frontend/screens/home/home_screen.dart';
import 'package:projekt_broker_frontend/screens/loading/loading_screen.dart';
import 'package:projekt_broker_frontend/screens/order_overview/order_overview_screen.dart';
import 'package:projekt_broker_frontend/screens/profile/profile_screen.dart';
import 'package:projekt_broker_frontend/screens/stock_search/stock_search_screen.dart';
import 'package:provider/provider.dart';

import 'screens/stock_detail/stock_detail_screen.dart';
import 'screens/stock_detail/stock_detail_screen_provider.dart';

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
        final navigationProvider = context.read<NavigationProvider>();
        //

        // Auth required routes
        switch (routeSettings.name) {
          case HomeScreen.routeName:
            navigationProvider.currentRouteIndex = 0;
            return MultiProvider(
              providers: [
                Provider.value(value: false), // dummy provider
              ],
              builder: (context, _) {
                return HomeScreen();
              },
            );
          case OrderOverviewScreen.routeName:
            navigationProvider.currentRouteIndex = 1;
            return OrderOverviewScreen();
          case StockSearchScreen.routeName:
            navigationProvider.currentRouteIndex = 2;
            return StockSearchScreen();
          case ProfileScreen.routeName:
            navigationProvider.currentRouteIndex = 3;
            return ChangeNotifierProvider<ProfileProvider>(
              create: (context) => ProfileProvider(
                premium: true,
              ),
              child: ProfileScreen(),
            );
          case StockDetailScreen.routeName:
            return ChangeNotifierProvider(
              create: (context) => StockDetailScreenProvider(
                stock: context
                    .read<MockProvider>()
                    .dummyStock, // TODO remove stock
              ),
              child: StockDetailScreen(),
            );
          case BuyStockScreen.routeName:
            context.read<BuyStockProvider>().init(
                  mode: arguments["mode"],
                  stock: arguments["stock"], // TODO remove mock
                );
            return BuyStockScreen();
          case BuyStockSuccess.routeName:
            return BuyStockSuccess();

          default:
            return const CrashScreen();
        }
      },
    );
  }
}
