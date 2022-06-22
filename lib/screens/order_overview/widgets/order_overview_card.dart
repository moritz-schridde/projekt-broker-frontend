import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projekt_broker_frontend/constants/frontend/ui_theme.dart';
import 'package:projekt_broker_frontend/models/order.dart';
import 'package:projekt_broker_frontend/screens/stock_detail/stock_detail_screen.dart';

class OrderOverviewCard extends StatelessWidget {
  final Order order;

  const OrderOverviewCard({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String status = "erfolgreich";
    final theme = Theme.of(context);
    final DateFormat dateFormat = new DateFormat("yyyy dd MMMM, HH:mm");
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(
        StockDetailScreen.routeName,
        arguments: {"stock": order.info.stock},
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
                      order.info.stock.icon,
                      color: UiTheme.lightTheme.primaryColor,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${order.info.stock.shortName}",
                      style: theme.textTheme.headline6,
                    ),
                    Text(
                      "Menge: ${order.info.amount}",
                      style: theme.textTheme.bodyText2,
                    ),
                    Text(
                      "Preis: ${order.info.value / order.info.amount}€",
                      style: theme.textTheme.bodyText2,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Orderwert: ${order.info.value}€",
                      style: theme.textTheme.headline6,
                    ),
                    Text(
                      order.timestamp != null
                          ? dateFormat.format(order.timestamp!).toString()
                          : "",
                      style: theme.textTheme.bodyText2,
                    ),
                    Builder(
                      builder: (context) {
                        print(order.timestamp);
                        switch (order.state) {
                          case OrderState.OPEN:
                            return Text(
                              "Order offen",
                              style: theme.textTheme.bodyText2,
                            );
                          case OrderState.CLOSED:
                            return Text(
                              "Order erfolgreich ausgeführt",
                              style: theme.textTheme.bodyText2!
                                  .copyWith(color: UiTheme.primarySuccess),
                            );
                          default:
                            return Text(
                              "Order ausstehend",
                              style: theme.textTheme.bodyText2!
                                  .copyWith(color: UiTheme.primaryFailure),
                            );
                        }
                      },
                    ),
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
