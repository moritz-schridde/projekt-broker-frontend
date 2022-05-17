import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projekt_broker_frontend/constants/frontend/ui_theme.dart';
import 'package:projekt_broker_frontend/widgets/rounded_button.dart';

class BuyStockScreen extends StatelessWidget {
  static const routeName = "/buy_stock";
  const BuyStockScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        //TODO add Aktienname
        title: Text("Aktien kaufen (Aktienname)"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Gib den gewünschten Kaufbetrag ein:",
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //TODO Refector widgets
                TextField(
                  keyboardType: TextInputType.number,
                  style: theme.textTheme.headline3,
                  cursorColor: UiTheme.textColorBlack,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(r'[0-9]'),
                    ),
                  ],
                  decoration: InputDecoration(
                    //TODO empty text when focus (FocusNode)
                    hintText: "7657",
                    suffixIcon: Text(
                      "€",
                      style: theme.textTheme.headline3?.copyWith(
                        color: UiTheme.primaryColor,
                      ),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 100,
                      maxWidth: 160,
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(2.0),
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  style: theme.textTheme.headline3,
                  cursorColor: UiTheme.textColorBlack,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(r'[0-9]'),
                    ),
                  ],
                  decoration: InputDecoration(
                    //TODO empty text when focus (FocusNode)
                    hintText: "76",
                    suffixIcon: Text(
                      "APL",
                      style: theme.textTheme.headline3?.copyWith(
                        color: UiTheme.primaryColor,
                      ),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 100,
                      maxWidth: 160,
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(2.0),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            //TODO get Guthaben from backend
            Text("Verfügbares Guthaben: 10000€"),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  child: Text("0%"),
                  style: OutlinedButton.styleFrom(
                    primary: UiTheme.textColorBlack,
                    padding: const EdgeInsets.symmetric(
                      vertical: 2,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: () {},
                ),
                OutlinedButton(
                  child: Text("10%"),
                  style: OutlinedButton.styleFrom(
                    primary: UiTheme.textColorBlack,
                    padding: const EdgeInsets.symmetric(
                      vertical: 2,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: () {},
                ),
                OutlinedButton(
                  child: Text("25%"),
                  style: OutlinedButton.styleFrom(
                    primary: UiTheme.textColorBlack,
                    padding: const EdgeInsets.symmetric(
                      vertical: 2,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: () {},
                ),
                OutlinedButton(
                  child: Text("50%"),
                  style: OutlinedButton.styleFrom(
                    primary: UiTheme.textColorBlack,
                    padding: const EdgeInsets.symmetric(
                      vertical: 2,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: () {},
                ),
                OutlinedButton(
                  child: Text("75%"),
                  style: OutlinedButton.styleFrom(
                    primary: UiTheme.textColorBlack,
                    padding: const EdgeInsets.symmetric(
                      vertical: 2,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: () {},
                ),
                OutlinedButton(
                  child: Text("100%"),
                  style: OutlinedButton.styleFrom(
                    primary: UiTheme.textColorBlack,
                    padding: const EdgeInsets.symmetric(
                      vertical: 2,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: RoundedButton(
                onPressed: () {},
                label: Text(
                  "Kaufübersicht",
                  style: theme.textTheme.headline5?.copyWith(
                    color: UiTheme.textColorWhite,
                  ),
                ),
                width: double.infinity,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
