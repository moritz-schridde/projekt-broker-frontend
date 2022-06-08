import 'package:flutter/material.dart';
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
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(StockDetailScreen.routeName),
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
                  Icons.euro_symbol,
                  color: UiTheme.lightTheme.primaryColor,
                ),
              ),
              Column(
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
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
              Column(
                children: [
                  Text(
                    "Orderwert: ${order.info.value}€",
                    style: theme.textTheme.headline6,
                  ),
                  Text(
                    "30. Dezember, 10:56",
                    style: theme.textTheme.bodyText2,
                  ),
                  (status == "in Ausführung")
                      ? Text(
                          "Order in Ausführung",
                          style: theme.textTheme.bodyText2,
                        )
                      : (status == "erfolgreich")
                          ? Text(
                              "Order erfolgreich ausgeführt",
                              style: theme.textTheme.bodyText2!
                                  .copyWith(color: UiTheme.primarySuccess),
                            )
                          : Text(
                              "Order fehlgeschlagen",
                              style: theme.textTheme.bodyText2!
                                  .copyWith(color: UiTheme.primaryFailure),
                            ),
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
