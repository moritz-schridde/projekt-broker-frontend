import 'package:flutter/material.dart';
import 'package:projekt_broker_frontend/pages/stock_detail/stock_detail_page.dart';
import 'package:projekt_broker_frontend/screens/home/widgets/portfolio_overview_card.dart';
import 'package:projekt_broker_frontend/services/firebase_auth_service.dart';
import 'package:projekt_broker_frontend/widgets/main_bottom_navigation_bar.dart';
import 'package:projekt_broker_frontend/widgets/stock_overview_card.dart';
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
            // const Text('Home'),
            PortfolioOverviewCard(),
            OutlinedButton(
              onPressed: context.read<FirebaseAuthService>().signOut,
              child: const Text('Sign out'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Text(
                  "Meine Aktien",
                  style: TextStyle(
                    fontSize: 30,
                    color: Color.fromARGB(255, 138, 43, 226),
                  ),
                ),
                alignment: Alignment.centerLeft,
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 15,
                itemBuilder: (context, index) {
                  return StockOverviewCard();
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: MainBottomNavigationBar(),
    );
  }
}
