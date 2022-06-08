import 'package:flutter/material.dart';
import 'package:projekt_broker_frontend/constants/frontend/ui_theme.dart';
import 'package:projekt_broker_frontend/provider/portfolio_provider.dart';
import 'package:projekt_broker_frontend/screens/home/widgets/portfolio_overview_card.dart';
import 'package:projekt_broker_frontend/widgets/main_bottom_navigation_bar.dart';
import 'package:projekt_broker_frontend/widgets/stock_overview_card.dart';
import 'package:provider/provider.dart';

import '../register/register_screen.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "/home";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Consumer<PortfolioProvider>(
      builder: (context, portfolioProvider, child) => Scaffold(
        body: Center(
          child: Column(
            children: [
              PortfolioOverviewCard(
                depot: portfolioProvider.depot,
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Meine Aktien",
                    style: theme.textTheme.headline3,
                  ),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ),
                      child: Divider(
                        color: UiTheme.lightTheme.secondaryHeaderColor,
                        height: 2,
                        thickness: 1,
                      ),
                    );
                  },
                  shrinkWrap: true,
                  itemCount: portfolioProvider.stockCount ?? 0,
                  itemBuilder: (context, index) {
                    return StockOverviewCard(
                      ownedStock: portfolioProvider.depot.stocks[index],
                    );
                  },
                ),
              ),
              TextButton(
                child: const Text("registrieren"),
                onPressed: () => Navigator.pushNamed(context, RegisterScreen.routeName),
                // eigentliche Routing wie in app.dart 25-30
              )
            ],
          ),
        ),
        bottomNavigationBar: MainBottomNavigationBar(),
      ),
    );
  }
}
