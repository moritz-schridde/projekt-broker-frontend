import 'package:flutter/material.dart';
import 'package:projekt_broker_frontend/constants/frontend/ui_theme.dart';
import 'package:projekt_broker_frontend/screens/buy_stock/buy_stock_provider.dart';
import 'package:projekt_broker_frontend/screens/buy_stock/buy_stock_screen.dart';
import 'package:projekt_broker_frontend/screens/stock_detail/stock_detail_screen_provider.dart';
import 'package:projekt_broker_frontend/widgets/main_bottom_navigation_bar.dart';
import 'package:projekt_broker_frontend/widgets/main_top_navigation_bar.dart';
import 'package:projekt_broker_frontend/widgets/rounded_button.dart';
import 'package:provider/provider.dart';

import 'widgets/personal_information_detail_page.dart';

class StockDetailScreen extends StatelessWidget {
  static const routeName = "/stock_detail";

  const StockDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: MainTopNavigationBar.appBar(
        context: context,
        title: "Trading",
      ),
      body: Consumer<StockDetailScreenProvider>(
        builder: (context, stockDetailScreenProvider, _) => Center(
          child: Column(
            children: [
              //TODO: Placeholder for Stock
              Placeholder(
                fallbackHeight: 150,
              ),
              // TODO: Placholder vor Chart
              Placeholder(
                fallbackHeight: 150,
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
              // TODO: Placholder Performance and count
              PersonalInformationDetail(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MainBottomNavigationBar(),
    );
  }
}
