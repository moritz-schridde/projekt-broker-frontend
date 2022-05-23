import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/i10n.dart';
import 'package:projekt_broker_frontend/screens/auth/auth_screen.dart';
import 'package:projekt_broker_frontend/screens/home/home_screen.dart';
import 'package:projekt_broker_frontend/screens/loading/loading_screen.dart';

import 'package:provider/src/provider.dart';

import 'app_router.dart';
import 'constants/frontend/ui_theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('de', ''),
      ],
      title: 'WertpapierHändl\'',
      theme: UiTheme.lightTheme,
      darkTheme: UiTheme.lightTheme, // disable dark theme
      home: Builder(
        builder: (context) {
          WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
            Navigator.pushReplacementNamed(
              context,
              context.read<User?>() != null
                  ? HomeScreen.routeName
                  : AuthScreen.routeName,
            );
          });
          return LoadingScreen();
        },
      ),
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
