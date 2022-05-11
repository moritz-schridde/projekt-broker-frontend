import 'package:flutter/material.dart';

class BuyStockScreen extends StatelessWidget {
  static const routeName = "/buy_stock";
  const BuyStockScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aktien kaufen (Aktienname)"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Gib den gewünschten Kaufbetrag ein:"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  color: Colors.lime,
                  width: 200,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "7657",
                    ),
                  ),
                ),
                Container(
                  color: Colors.lime,
                  width: 200,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "7657",
                    ),
                  ),
                ),
              ],
            ),
            Text("Verfügbares Guthaben: 10000€"),
            Row(
              children: [
                OutlinedButton(
                  onPressed: () {},
                  child: Text("10%"),
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
