import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:projekt_broker_frontend/services/firebase_auth_service.dart';

class AuthScreen extends StatelessWidget {
  static const routeName = "/auth";
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SignInScreen(
      providerConfigs: FirebaseAuthService.providerConfigurations,
    );
  }
}
