import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projekt_broker_frontend/constants/frontend/ui_assets.dart';
import 'package:projekt_broker_frontend/provider/mock_provider.dart';
import 'package:projekt_broker_frontend/provider/navigation_provider.dart';
import 'package:projekt_broker_frontend/provider/order_provider.dart';
import 'package:projekt_broker_frontend/provider/portfolio_provider.dart';
import 'package:projekt_broker_frontend/provider/stock_provider.dart';
import 'package:projekt_broker_frontend/screens/buy_stock/buy_stock_provider.dart';
import 'package:projekt_broker_frontend/screens/loading/loading_screen.dart';
import 'package:projekt_broker_frontend/services/backend_service.dart';
import 'package:projekt_broker_frontend/services/firebase_auth_service.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'provider/user_info_provider.dart';

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Global Provider
    // Provider which are essential for the app
    return MultiProvider(
      providers: [
        FutureProvider<bool>(
          create: (_) => Future.wait(<Future>[UiAssets.init(context)])
              .then<bool>((_) => true),
          initialData: false,
        ),
        ChangeNotifierProvider<FirebaseAuthService>(
          create: (context) => FirebaseAuthService(),
        ),
        ChangeNotifierProvider<BackendService>(
          create: (context) => BackendService(
              firebaseAuthService: context.read<FirebaseAuthService>()),
        ),
        // TODO use Model to broadcast currentUser
        StreamProvider<User?>(
          create: (context) =>
              context.read<FirebaseAuthService>().authStateChanges,
          initialData: null,
        ),
        ChangeNotifierProvider<MockProvider>(
          create: (_) => MockProvider(),
        ),
        ChangeNotifierProvider<NavigationProvider>(
          create: (_) => NavigationProvider(),
        ),
      ],
      builder: (context, _) {
        if (!context.watch<MockProvider>().initialized ||
            !context.watch<bool>()) {
          return MaterialApp(home: LoadingScreen());
        }

        final User? user = context.watch<User?>();

        // Non auth required global provider
        return MultiProvider(
          providers: [
            Provider.value(value: false), // dummy provider
          ],
          builder: (context, app) {
            final _mockProvider = context.read<MockProvider>();
            final _backendService = context.read<BackendService>();
            if (user != null) {
              // register Global Provider which are dependend on the currentUser here
              return MultiProvider(
                providers: [
                  ChangeNotifierProvider<PortfolioProvider>(
                    create: (context) => PortfolioProvider(
                      mockProvider: _mockProvider,
                      backendService: _backendService,
                    ),
                  ),
                  ChangeNotifierProvider<BuyStockProvider>(
                    create: (context) => BuyStockProvider(),
                  ),
                  ChangeNotifierProvider<StockProvider>(
                    create: (context) => StockProvider(
                      backendService: _backendService,
                    ),
                  ),
                  ChangeNotifierProvider<OrderProvider>(
                    create: (context) => OrderProvider(
                      mockProvider: _mockProvider,
                      backendService: _backendService,
                    ),
                  ),
                  ChangeNotifierProvider<UserInfoProvider>(
                    create: (context) => UserInfoProvider(
                      backendService: _backendService,
                      mockProvider: _mockProvider,
                    ),
                  ),
                ],
                child: app!,
              );
            }
            return app!;
          },
          child: App(),
        );
      },
    );
  }
}
