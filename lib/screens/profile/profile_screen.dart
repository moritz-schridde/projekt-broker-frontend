import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart' as FireFlutter;
import 'package:projekt_broker_frontend/constants/frontend/ui_theme.dart';
import 'package:projekt_broker_frontend/screens/profile/profile_provider.dart';
import 'package:projekt_broker_frontend/screens/profile/widgets/profile_premium.dart';
import 'package:projekt_broker_frontend/services/firebase_auth_service.dart';
import 'package:projekt_broker_frontend/widgets/main_top_navigation_bar.dart';
import 'package:projekt_broker_frontend/widgets/rounded_button.dart';
import 'package:provider/provider.dart';

import '../../widgets/main_bottom_navigation_bar.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: MainTopNavigationBar.appBar(
        context: context,
        title: "Mein Profil",
      ),
      body: FireFlutter.ProfileScreen(
        providerConfigs: FirebaseAuthService.providerConfigurations,
        children: [
          ProfilePremium(),
          OutlinedButton(
            onPressed: () => context
                .read<FirebaseAuthService>()
                .getBearerToken()
                .then(print),
            child: Text("log Bearer"),
          ),
        ],
      ),
      bottomNavigationBar: MainBottomNavigationBar(),
    );
  }
}
