import 'package:flutter/material.dart';
import 'package:projekt_broker_frontend/models/bank_account.dart';
import 'package:projekt_broker_frontend/provider/mock_provider.dart';
import 'package:projekt_broker_frontend/provider/navigation_provider.dart';
import 'package:projekt_broker_frontend/provider/order_provider.dart';
import 'package:projekt_broker_frontend/provider/portfolio_provider.dart';
import 'package:projekt_broker_frontend/provider/stock_provider.dart';
import 'package:projekt_broker_frontend/screens/auth/auth_screen.dart';
import 'package:projekt_broker_frontend/screens/buy_stock/buy_stock_provider.dart';
import 'package:projekt_broker_frontend/screens/buy_stock/buy_stock_screen.dart';
import 'package:projekt_broker_frontend/screens/register/register_provider.dart';
import 'package:projekt_broker_frontend/screens/register/register_screen.dart';
import 'package:projekt_broker_frontend/screens/buy_stock/widgets/buy_stock_success.dart';
import 'package:projekt_broker_frontend/screens/profile/profile_provider.dart';
import 'package:projekt_broker_frontend/screens/order_overview/order_overview_provider.dart';
import 'package:projekt_broker_frontend/screens/wrapper/wrapper_screen.dart';
import 'package:projekt_broker_frontend/services/backend_service.dart';
import 'package:projekt_broker_frontend/widgets/draggable_overview.dart';
import 'package:projekt_broker_frontend/screens/crash/crash_screen.dart';
import 'package:projekt_broker_frontend/screens/home/home_screen.dart';
import 'package:projekt_broker_frontend/screens/loading/loading_screen.dart';
import 'package:projekt_broker_frontend/screens/order_overview/order_overview_screen.dart';
import 'package:projekt_broker_frontend/screens/profile/profile_screen.dart';
import 'package:projekt_broker_frontend/screens/stock_search/stock_search_screen.dart';
import 'package:provider/provider.dart';
import 'provider/portfolio_provider.dart';
import 'provider/user_info_provider.dart';
import 'screens/register/register_screen.dart';
import 'screens/stock_detail/stock_detail_screen.dart';
import 'screens/stock_detail/stock_detail_screen_provider.dart';
import 'screens/stock_search/stock_search_screen_provider.dart';

abstract class AppRouter {
  static MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    late final Map<String, dynamic> arguments;
    try {
      arguments = routeSettings.arguments as Map<String, dynamic>;
    } catch (e) {
      arguments = {};
    }

    return CustomMaterialPageRoute(
      settings: routeSettings,
      builder: (context) {
        final _backendService = context.read<BackendService>();

        // Non auth required routes
        switch (routeSettings.name) {
          case AuthScreen.routeName:
            return AuthScreen();
          case LoadingScreen.routeName:
            return LoadingScreen();
          case CrashScreen.routeName:
            return CrashScreen();
          case RegisterScreen.routeName:
            return ChangeNotifierProvider(
              create: (context) => RegisterProvider(
                backendService: _backendService,
              ),
              child: RegisterScreen(),
            );
        }

        // read Providers here
        final navigationProvider = context.read<NavigationProvider>();
        final orderProvider = context.read<OrderProvider>();
        final userInfoProvider = context.read<UserInfoProvider>();
        final stockProvider = context.read<StockProvider>();
        final portfolioProvider = context.read<PortfolioProvider>();

        // Auth required routes
        switch (routeSettings.name) {
          case WrapperScreen.routeName:
            return WrapperScreen();
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
            return ChangeNotifierProvider<OrderOverviewProvider>(
              create: (context) => OrderOverviewProvider(
                orderProvider: orderProvider,
              ),
              child: OrderOverviewScreen(),
            );
          case StockSearchScreen.routeName:
            navigationProvider.currentRouteIndex = 2;
            return ChangeNotifierProvider<StockSearchScreenProvider>(
              create: (_) => StockSearchScreenProvider(
                stockProvider: stockProvider,
              ),
              child: StockSearchScreen(),
            );
          case ProfileScreen.routeName:
            navigationProvider.currentRouteIndex = 3;
            return ChangeNotifierProvider<ProfileProvider>(
              create: (context) => ProfileProvider(
                userInfoProvider: userInfoProvider,
                premium: false,
              ),
              child: ProfileScreen(),
            );
          case StockDetailScreen.routeName:
            return ChangeNotifierProvider(
              create: (context) => StockDetailScreenProvider(
                portfolioProvider: portfolioProvider,
                stock: arguments["stock"],
              ),
              child: StockDetailScreen(),
            );
          case BuyStockScreen.routeName:
            context.read<BuyStockProvider>().init(
                  mode: arguments["mode"],
                  stock: arguments["stock"],
                  amount: arguments["amount"] ?? 1,
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

class CustomMaterialPageRoute<T> extends MaterialPageRoute<T> {
  CustomMaterialPageRoute({
    required WidgetBuilder builder,
    required RouteSettings settings,
  }) : super(
          builder: builder,
          settings: settings,
        );

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    // ? remove?
    return new FadeTransition(
      opacity: animation,
      child: child,
    );
    // return child;
  }
}
