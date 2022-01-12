import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projekt_broker_frontend/screens/auth/auth_screen.dart';
import 'package:projekt_broker_frontend/screens/crash/crash_screen.dart';
import 'package:projekt_broker_frontend/screens/home/home_screen.dart';
import 'package:projekt_broker_frontend/screens/loading/loading_screen.dart';
import 'package:projekt_broker_frontend/screens/order_overview/order_overview_screen.dart';
import 'package:projekt_broker_frontend/screens/profile/profile_screen.dart';
import 'package:projekt_broker_frontend/screens/stock_search/stock_search_screen.dart';
import 'package:provider/provider.dart';

abstract class AppRouter {
  static MaterialPageRoute generateRoute(RouteSettings routeSettings) {
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

          default:
            return const CrashScreen();
        }
      },
    );
  }
}
