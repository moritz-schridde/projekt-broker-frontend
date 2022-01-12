import 'package:flutter/material.dart';

class StockDetailPage extends StatelessWidget {
  const StockDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          //TODO: Placeholder for Stock
          Placeholder(
            fallbackHeight: 150,
          ),
          // TODO: Placholder vor Chart
          Placeholder(),
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
          Placeholder(),
        ],
      ),
    );
  }
}
