import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projekt_broker_frontend/constants/frontend/ui_theme.dart';

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
          children: [
            const Text("Gib den gewünschten Kaufbetrag ein:"),
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
                      minWidth: 75,
                      maxWidth: 150,
                    ),
                    suffixIconConstraints: const BoxConstraints(
                      minWidth: 10,
                      maxWidth: 20,
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
                      minWidth: 75,
                      maxWidth: 150,
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(2.0),
                  ),
                ),
              ],
            ),
            //TODO get Guthaben from backend
            Text("Verfügbares Guthaben: 10000€"),
            Row(
              children: [
                OutlinedButton(
                  child: Text("10%"),
                  onPressed: () {},
                )
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Kaufübersicht"),
            ),
          ],
        ),
      ),
    );
  }
}
