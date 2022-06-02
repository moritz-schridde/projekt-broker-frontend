import 'package:flutter/material.dart';
import 'package:projekt_broker_frontend/constants/frontend/ui_theme.dart';
import 'package:projekt_broker_frontend/screens/home/home_screen.dart';
import 'package:projekt_broker_frontend/widgets/rounded_button.dart';

class BuyStockFailed extends StatelessWidget {
  const BuyStockFailed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
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
            "Order konnte nicht platziert werden",
            style: theme.textTheme.headline4,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundedButton(
              label: Text(
                "Erneut versuchen",
                style: theme.textTheme.headline5?.copyWith(
                  color: UiTheme.textColorWhite,
                ),
              ),
              width: double.infinity,
              onPressed: () {},
            ),
            TextButton(
              child: Text("Zurück zur Startseite"),
              onPressed: () =>
                  Navigator.of(context).popUntil((route) => route.isFirst),
            ),
          ],
        )
      ],
      // child: Column(
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Icon(Icons.ac_unit),
      //     Text(
      //       "Order konnte nicht platziert werden",
      //       style: theme.textTheme.headline4,
      //       textAlign: TextAlign.center,
      //     ),

      //   ],
      // ),
    );
  }
}
