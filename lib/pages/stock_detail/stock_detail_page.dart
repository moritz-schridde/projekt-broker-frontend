import 'package:flutter/material.dart';
import 'package:projekt_broker_frontend/constants/frontend/ui_theme.dart';
import 'package:projekt_broker_frontend/pages/stock_detail/widgets/personal_information_detail_page.dart';
import 'package:projekt_broker_frontend/screens/buy_stock/buy_stock_screen.dart';
import 'package:projekt_broker_frontend/widgets/main_bottom_navigation_bar.dart';
import 'package:projekt_broker_frontend/widgets/rounded_button.dart';

class StockDetailPage extends StatelessWidget {
  static const routeName = "/stock_detail";

  const StockDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: Center(
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
                  onPressed: () =>
                      Navigator.of(context).pushNamed(BuyStockScreen.routeName),
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
                  onPressed: () {},
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
      bottomNavigationBar: MainBottomNavigationBar(),
    );
  }
}
