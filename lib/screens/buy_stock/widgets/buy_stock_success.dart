import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projekt_broker_frontend/constants/frontend/ui_theme.dart';
import 'package:projekt_broker_frontend/screens/order_overview/order_overview_screen.dart';
import 'package:projekt_broker_frontend/widgets/rounded_button.dart';

class BuyStockSuccess extends StatelessWidget {
  static const routeName = "/buy_stock_success";

  const BuyStockSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: UiTheme.primaryColor,
            child: Icon(
              Icons.cancel,
              color: Colors.white,
              size: 60,
            ),
          ),
          Text(
            "Deine Order wurde platziert!",
            style: theme.textTheme.headline4,
            textAlign: TextAlign.center,
          ),
          Column(
            children: [
              RoundedButton(
                label: Text(
                  "Orderübersicht",
                  style: theme.textTheme.headline5?.copyWith(
                    color: UiTheme.textColorWhite,
                  ),
                ),
                width: double.infinity,
                onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil(
                  OrderOverviewScreen.routeName,
                  (route) => false,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextButton(
                child: Text("Zurück zur Startseite"),
                onPressed: () =>
                    Navigator.of(context).popUntil((route) => route.isFirst),
              ),
            ],
          )
        ],
      ),
    );
  }
}
