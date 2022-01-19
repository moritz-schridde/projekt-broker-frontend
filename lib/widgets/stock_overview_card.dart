import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:projekt_broker_frontend/constants/frontend/ui_theme.dart';
import 'package:projekt_broker_frontend/pages/stock_detail/stock_detail_page.dart';

class StockOverviewCard extends StatelessWidget {
  const StockOverviewCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.pushReplacementNamed(context, StockDetailPage.routeName),
      child: Card(
        elevation: 0,
        child: Container(
          decoration: BoxDecoration(
            border: Border.symmetric(
              horizontal: BorderSide(
                color: UiTheme.lightTheme.secondaryHeaderColor,
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
                  color: UiTheme.lightTheme.secondaryHeaderColor,
                ),
                child: Icon(
                  Icons.euro_symbol,
                  color: UiTheme.lightTheme.primaryColor,
                ),
              ),
              Column(
                children: [
                  Text("APL", style: UiTheme.textTheme.headline6),
                  Text(
                    "+1,6%",
                    style: TextStyle(color: Colors.green),
                  ),
                ],
              ),
              Icon(
                Icons.show_chart_outlined,
                size: 40,
                color: UiTheme.lightTheme.primaryColor,
              ),
              Column(
                children: [
                  Text("29.850,15€", style: UiTheme.textTheme.headline6),
                  Text("2,3"),
                ],
                crossAxisAlignment: CrossAxisAlignment.end,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
