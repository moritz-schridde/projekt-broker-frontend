import 'package:flutter/material.dart';
import 'package:projekt_broker_frontend/constants/frontend/ui_theme.dart';
import 'package:projekt_broker_frontend/models/owned_stock.dart';

class PersonalInformationDetail extends StatelessWidget {
  final OwnedStock ownedStock;
  const PersonalInformationDetail({
    Key? key,
    required this.ownedStock,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final percent =
        ((ownedStock.stock.price / ownedStock.purchasePrice - 1) * 100);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.symmetric(
            horizontal: BorderSide(
              color: UiTheme.lightTheme.secondaryHeaderColor,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  "Performance",
                  style: theme.textTheme.headline6,
                ),
                Text(
                  '${percent >= 0 ? '+' : ''}${percent.toStringAsFixed(2)}%', //TODO
                  style: percent > 0
                      ? TextStyle(color: Colors.green)
                      : TextStyle(color: Colors.red),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "Im Besitz",
                  style: theme.textTheme.headline6,
                ),
                Text(
                  ownedStock.amount.toStringAsFixed(2),
                  style: theme.textTheme.bodyText2,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
