import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projekt_broker_frontend/provider/mock_provider.dart';
import 'package:projekt_broker_frontend/provider/navigation_provider.dart';
import 'package:projekt_broker_frontend/provider/portfolio_provider.dart';
import 'package:projekt_broker_frontend/screens/loading/loading_screen.dart';
import 'package:projekt_broker_frontend/services/backend_service.dart';
import 'package:projekt_broker_frontend/services/firebase_auth_service.dart';
import 'package:provider/provider.dart';

import 'app.dart';

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Global Provider
    // Provider which are essential for the app
    return MultiProvider(
      providers: [
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
        if (!context.watch<MockProvider>().initialized) {
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
            if (user != null) {
              // register Global Provider which are dependend on the currentUser here
              return MultiProvider(
                providers: [
                  Provider.value(value: false), // dummy provider
                  ChangeNotifierProvider(
                    create: (context) =>
                        PortfolioProvider(mockProvider: _mockProvider),
                  )
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
