import 'package:flutter/material.dart';

import '../../widgets/main_bottom_navigation_bar.dart';

class StockSearchScreen extends StatelessWidget {
  static const routeName = "/stock-search";
  const StockSearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Text("To be developed"),
          )
        ],
      ),
      bottomNavigationBar: MainBottomNavigationBar(),
    );
  }
}
