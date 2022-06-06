import 'package:flutter/material.dart';
import 'package:projekt_broker_frontend/provider/mock_provider.dart';
import 'package:projekt_broker_frontend/screens/auth/auth_screen.dart';
import 'package:projekt_broker_frontend/screens/buy_stock/buy_stock_provider.dart';
import 'package:projekt_broker_frontend/screens/buy_stock/buy_stock_screen.dart';
import 'package:projekt_broker_frontend/screens/register/register_provider.dart';
import 'package:projekt_broker_frontend/screens/register/register_screen.dart';
import 'package:projekt_broker_frontend/widgets/draggable_overview.dart';
import 'package:projekt_broker_frontend/screens/crash/crash_screen.dart';
import 'package:projekt_broker_frontend/screens/home/home_screen.dart';
import 'package:projekt_broker_frontend/screens/loading/loading_screen.dart';
import 'package:projekt_broker_frontend/screens/order_overview/order_overview_screen.dart';
import 'package:projekt_broker_frontend/screens/profile/profile_screen.dart';
import 'package:projekt_broker_frontend/screens/stock_search/stock_search_screen.dart';
import 'package:provider/provider.dart';

import 'screens/register/register_screen.dart';
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
          case RegisterScreen.routeName:
            return RegisterScreen();
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
          case RegisterScreen.routeName:
            return ChangeNotifierProvider(
              create: (context) => RegisterProvider(
                context.read<RegisterProvider>().bankAccount,
                context.read<RegisterProvider>().userInfo,
              ),
              child: RegisterScreen(),
            );

          case StockDetailScreen.routeName:
            return ChangeNotifierProvider(
              create: (context) => StockDetailScreenProvider(
                stock: context.read<MockProvider>().dummyStock, // TODO remove stock
              ),
              child: StockDetailScreen(),
            );
          case BuyStockScreen.routeName:
            return ChangeNotifierProvider(
              create: (context) => BuyStockProvider(
                mode: arguments["mode"],
                stock: arguments["stock"], // TODO remove mock
              ),
              child: BuyStockScreen(),
            );

          default:
            return const CrashScreen();
        }
      },
    );
  }
}
