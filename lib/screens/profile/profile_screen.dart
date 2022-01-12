import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart' as FireFlutter;
import 'package:projekt_broker_frontend/services/firebase_auth_service.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FireFlutter.ProfileScreen(
      providerConfigs: FirebaseAuthService.providerConfigurations,
    );
  }
}
