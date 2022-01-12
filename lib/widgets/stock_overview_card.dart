import 'dart:developer';

import 'package:flutter/material.dart';

class StockOverviewCard extends StatelessWidget {
  const StockOverviewCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.euro_symbol),
          ),
          Column(
            children: [
              Text("APL"),
              Text(
                "+1,6%",
                style: TextStyle(color: Colors.green),
              ),
            ],
          ),
          Icon(Icons.show_chart_outlined),
          Column(
            children: [
              Text("29.850,15€"),
              Text("2,3"),
            ],
          ),
        ],
      ),
    );
  }
}
