import 'dart:developer';

import 'package:flutter/material.dart';

class StockOverviewCard extends StatelessWidget {
  const StockOverviewCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Container(
        decoration: BoxDecoration(
          border: Border.symmetric(
            horizontal: BorderSide(
              color: Color.fromARGB(255, 182, 137, 223).withOpacity(0.5),
            ),
          ),
        ),
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 182, 137, 223).withOpacity(0.2),
              ),
              child: Icon(
                Icons.euro_symbol,
                color: Color.fromARGB(255, 138, 43, 226),
              ),
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
            Icon(
              Icons.show_chart_outlined,
              size: 40,
              color: Color.fromARGB(255, 138, 43, 226),
            ),
            Column(
              children: [
                Text("29.850,15€"),
                Text("2,3"),
              ],
              crossAxisAlignment: CrossAxisAlignment.end,
            ),
          ],
        ),
      ),
    );
  }
}
