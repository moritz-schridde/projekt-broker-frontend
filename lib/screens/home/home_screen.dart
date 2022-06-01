import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projekt_broker_frontend/constants/frontend/ui_theme.dart';
import 'package:projekt_broker_frontend/provider/portfolio_provider.dart';
import 'package:projekt_broker_frontend/screens/home/widgets/portfolio_overview_card.dart';
import 'package:projekt_broker_frontend/widgets/main_bottom_navigation_bar.dart';
import 'package:projekt_broker_frontend/widgets/stock_overview_card.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "/home";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Consumer<PortfolioProvider>(
      builder: ((context, portfolioProvider, child) => Scaffold(
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
                      child: Text(
                        "Meine Aktien",
                        style: theme.textTheme.headline3,
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: portfolioProvider.stockCount,
                      itemBuilder: (context, index) {
                        return StockOverviewCard(
                          ownedStock: portfolioProvider.depot.stocks[index],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: MainBottomNavigationBar(),
          )),
    );
  }
}
