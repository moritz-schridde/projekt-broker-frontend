import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projekt_broker_frontend/constants/frontend/ui_theme.dart';
import 'package:projekt_broker_frontend/models/owned_stock.dart';
import 'package:projekt_broker_frontend/provider/portfolio_provider.dart';

import '../screens/stock_detail/stock_detail_screen.dart';

class StockOverviewCard extends StatelessWidget {
  OwnedStock ownedStock;
  StockOverviewCard({
    Key? key,
    required this.ownedStock,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, StockDetailScreen.routeName),
      child: Card(
        elevation: 0,
        child: Container(
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.symmetric(
            horizontal: 8.0,
          ),
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
                  //Icons.euro_symbol,
                  ownedStock.stock.icon,
                  color: UiTheme.lightTheme.primaryColor,
                ),
              ),
              Column(
                children: [
                  Text(ownedStock.stock.shortName,
                      style: theme.textTheme.headline6),
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
                  Text(
                      NumberFormat.currency(
                              locale: 'de',
                              name: 'euro',
                              symbol: '€',
                              decimalDigits: 2)
                          .format(ownedStock.stock.price * ownedStock.amount),
                      style: theme.textTheme.headline6),
                  Text(ownedStock.amount.toString()),
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
