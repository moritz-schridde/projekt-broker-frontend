import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:projekt_broker_frontend/constants/frontend/ui_assets.dart';
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
        body: Builder(builder: (context) {
          final depot = portfolioProvider.depot;

          if (depot == null) {
            return Center(child: CircularProgressIndicator());
          }

          return Center(
            child: Column(
              children: [
                PortfolioOverviewCard(
                  depot: portfolioProvider.depot!,
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
                      style: theme.textTheme.headline3?.copyWith(
                        color: theme.primaryColor,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Builder(builder: (context) {
                    final itemCount = portfolioProvider.stockCount ?? 0;
                    if (!(itemCount > 0)) {
                      return SingleChildScrollView(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Lottie.asset(
                                "${UiAssets.baseLottieImg}/graph-growing.json",
                                height: MediaQuery.of(context).size.height / 2,
                              ),
                              Text(
                                "Hole dir jetzt Stocks und profitiere!",
                                textAlign: TextAlign.center,
                                style: theme.textTheme.headline4?.copyWith(
                                  color: theme.primaryColor,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }
                    return ListView.separated(
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
                          ownedStock: portfolioProvider.depot!.stocks[index],
                        );
                      },
                    );
                  }),
                ),
              ],
            ),
          );
        }),
        bottomNavigationBar: MainBottomNavigationBar(),
      ),
    );
  }
}
