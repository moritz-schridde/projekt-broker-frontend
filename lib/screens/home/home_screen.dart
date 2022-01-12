import 'package:flutter/material.dart';
import 'package:projekt_broker_frontend/screens/home/widgets/portfolio_overview_card.dart';
import 'package:projekt_broker_frontend/services/firebase_auth_service.dart';
import 'package:provider/src/provider.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "/home";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Home'),
            PortfolioOverviewCard(),
            OutlinedButton(
              onPressed: context.read<FirebaseAuthService>().signOut,
              child: const Text('Sign out'),
            )
          ],
        ),
      ),
    );
  }
}
