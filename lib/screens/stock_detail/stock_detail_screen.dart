import 'package:flutter/material.dart';
import 'package:projekt_broker_frontend/constants/frontend/ui_theme.dart';
import 'package:projekt_broker_frontend/models/owned_stock.dart';
import 'package:projekt_broker_frontend/provider/portfolio_provider.dart';
import 'package:projekt_broker_frontend/screens/buy_stock/buy_stock_provider.dart';
import 'package:projekt_broker_frontend/screens/buy_stock/buy_stock_screen.dart';
import 'package:projekt_broker_frontend/screens/stock_detail/stock_detail_screen_provider.dart';
import 'package:projekt_broker_frontend/screens/stock_detail/widgets/stock_chart.dart';
import 'package:projekt_broker_frontend/widgets/main_bottom_navigation_bar.dart';
import 'package:projekt_broker_frontend/widgets/main_top_navigation_bar.dart';
import 'package:projekt_broker_frontend/widgets/rounded_button.dart';
import 'package:projekt_broker_frontend/widgets/stock_search_card.dart';
import 'package:provider/provider.dart';

import '../../models/stock.dart';
import 'widgets/personal_information_detail_page.dart';

class StockDetailScreen extends StatelessWidget {
  static const routeName = "/stock_detail";
  Stock stock;

  StockDetailScreen({
    Key? key,
    required this.stock,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: MainTopNavigationBar.appBar(
        context: context,
        title: "Trading",
      ),
      body: Consumer2<StockDetailScreenProvider, PortfolioProvider>(
        builder: (context, stockDetailScreenProvider, portfolioProvider, _) {
          final ownedStock = portfolioProvider.tryGetOwnedStock(stock);

          return SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  IgnorePointer(child: StockSearchCard(stock: stock)),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25.0,
                      vertical: 10.0,
                    ),
                    child: Divider(
                      color: UiTheme.primaryGradientStartLight,
                      thickness: 1,
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  StockChart(),
                  SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RoundedButton(
                        onPressed: () => Navigator.of(context).pushNamed(
                          BuyStockScreen.routeName,
                          arguments: {
                            "mode": BuyStockMode.buy,
                            "stock": stockDetailScreenProvider.stock,
                          },
                        ),
                        label: Text(
                          "Kaufen",
                          style: theme.textTheme.headline6?.copyWith(
                            fontSize: 18,
                            color: UiTheme.textColorWhite,
                          ),
                        ),
                        width: 150,
                      ),
                      RoundedButton(
                        onPressed: () => Navigator.of(context).pushNamed(
                          BuyStockScreen.routeName,
                          arguments: {
                            "mode": BuyStockMode.sell,
                            "stock": stockDetailScreenProvider.stock,
                          },
                        ),
                        label: Text(
                          "Verkaufen",
                          style: theme.textTheme.headline6?.copyWith(
                            fontSize: 18,
                            color: UiTheme.textColorWhite,
                          ),
                        ),
                        width: 150,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  if (ownedStock != null)
                    PersonalInformationDetail(ownedStock: ownedStock),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: MainBottomNavigationBar(),
    );
  }
}
