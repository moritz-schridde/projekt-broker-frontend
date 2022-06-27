import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projekt_broker_frontend/constants/frontend/ui_theme.dart';
import 'package:projekt_broker_frontend/models/owned_stock.dart';
import 'package:projekt_broker_frontend/provider/portfolio_provider.dart';

import '../../../models/stock.dart';
import '../../stock_detail/stock_detail_screen.dart';

class StockSearchCard extends StatelessWidget {
  Stock stock;
  StockSearchCard({
    Key? key,
    required this.stock,
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
              Expanded(
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: UiTheme.primaryGradientStartLight,
                    ),
                    child: Icon(
                      //Icons.euro_symbol,
                      stock.icon,
                      color: UiTheme.lightTheme.primaryColor,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  stock.shortName,
                  style: theme.textTheme.headline6,
                ),
              ),
              Expanded(
                child: Icon(
                  Icons.show_chart_outlined,
                  size: 40,
                  color: UiTheme.lightTheme.primaryColor,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                        NumberFormat.currency(
                          locale: 'de',
                          name: 'euro',
                          symbol: '€',
                          decimalDigits: 2,
                        ).format(stock.price),
                        style: theme.textTheme.headline6),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
