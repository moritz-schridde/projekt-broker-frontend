import 'package:flutter/material.dart';
import 'package:projekt_broker_frontend/pages/stock_detail/widgets/personal_information_detail_page.dart';
import 'package:projekt_broker_frontend/widgets/main_bottom_navigation_bar.dart';

class StockDetailPage extends StatelessWidget {
  static const routeName = "/stock_detail";

  const StockDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                // TODO: Refactor Buttons
                ElevatedButton(
                  onPressed: () {},
                  child: Padding(
                    child: const Text("Kaufen"),
                    padding: EdgeInsets.all(8),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Padding(
                    child: const Text("Verkaufen"),
                    padding: EdgeInsets.all(8),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ),
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
