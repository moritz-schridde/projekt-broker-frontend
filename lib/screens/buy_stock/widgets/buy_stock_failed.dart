import 'package:flutter/material.dart';
import 'package:projekt_broker_frontend/constants/frontend/ui_theme.dart';
import 'package:projekt_broker_frontend/screens/home/home_screen.dart';
import 'package:projekt_broker_frontend/widgets/rounded_button.dart';

class BuyStockFailed extends StatelessWidget {
  const BuyStockFailed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20),
        color: UiTheme.textColorWhite,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: (MediaQuery.of(context).size.height / 6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.ac_unit),
          Text(
            "Order konnte nicht platziert werden",
            style: theme.textTheme.headline4,
            textAlign: TextAlign.center,
          ),
          RoundedButton(
            label: Text(
              "Erneut versuchen",
              style: theme.textTheme.headline5?.copyWith(
                color: UiTheme.textColorWhite,
              ),
            ),
            onPressed: () {},
            width: double.infinity,
          ),
          TextButton(
            child: Text("Zurück zur Startseite"),
            onPressed: () =>
                Navigator.of(context).popUntil((route) => route.isFirst),
          ),
        ],
      ),
    );
  }
}
