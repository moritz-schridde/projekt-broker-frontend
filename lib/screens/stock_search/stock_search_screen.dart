import 'package:flutter/material.dart';
import 'package:projekt_broker_frontend/widgets/main_top_navigation_bar.dart';

import '../../widgets/main_bottom_navigation_bar.dart';

class StockSearchScreen extends StatelessWidget {
  static const routeName = "/stock-search";
  const StockSearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: MainTopNavigationBar(title: "Suche"),
        preferredSize: Size.fromHeight(40),
      ),
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
