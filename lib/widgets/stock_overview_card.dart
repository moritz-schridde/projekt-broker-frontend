import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projekt_broker_frontend/constants/frontend/ui_theme.dart';
import 'package:projekt_broker_frontend/models/owned_stock.dart';
import 'package:projekt_broker_frontend/provider/portfolio_provider.dart';
import 'package:projekt_broker_frontend/screens/stock_detail/widgets/stock_chart.dart';

import '../screens/stock_detail/stock_detail_screen.dart';

class StockOverviewCard extends StatelessWidget {
  OwnedStock ownedStock;
  StockOverviewCard({
    Key? key,
    required this.ownedStock,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final percent =
        ((ownedStock.stock.price / ownedStock.purchasePrice - 1) * 100);
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        StockDetailScreen.routeName,
        arguments: {"stock": ownedStock.stock},
      ),
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
                      ownedStock.stock.icon,
                      color: UiTheme.lightTheme.primaryColor,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(ownedStock.stock.shortName,
                        style: theme.textTheme.headline6),
                    Text(
                      '${percent >= 0 ? '+' : ''}${percent.toStringAsFixed(2)}%', //TODO
                      style: percent > 0
                          ? TextStyle(color: Colors.green)
                          : TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Icon(
                  Icons.show_chart_outlined,
                  size: 40,
                  color: UiTheme.lightTheme.primaryColor,
                ),
                // StockChart(),
              ),
              Expanded(
                child: Column(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
