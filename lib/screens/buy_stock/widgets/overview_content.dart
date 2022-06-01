import 'package:flutter/material.dart';
import 'package:projekt_broker_frontend/constants/frontend/ui_theme.dart';
import 'package:projekt_broker_frontend/provider/portfolio_provider.dart';
import 'package:projekt_broker_frontend/screens/buy_stock/widgets/buy_stock_failed.dart';
import 'package:projekt_broker_frontend/widgets/rounded_button.dart';
import 'package:provider/provider.dart';

class OverviewContent extends StatelessWidget {
  const OverviewContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Consumer<PortfolioProvider>(
      builder: (context, portfolioProvider, _) => Column(
        children: [
          // POC
          //TODO save Stock estate in stock or somewhere else
          //TODO save amount of money from input
          //TODO replace with transaction amount
          Padding(
            padding: const EdgeInsets.only(
              left: 18.0,
            ),
            child: Column(
              children: [
                ...[
                  ["Anzahl an Aktien", "30"],
                  ["Geschätzter Kaufpreis", "2€"],
                  ["Transaktionskosten", "1€"],
                  ["Verfügbares Guthaben", portfolioProvider.budget],
                  ["Geschätztes Restguthaben", (portfolioProvider.budget! - 2)],
                ]
                    .map(
                      (item) => Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 18.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  item[0].toString(),
                                  style: theme.textTheme.bodyText1,
                                ),
                                Text(
                                  item[1].toString(),
                                  style: theme.textTheme.bodyText1,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10.0,
                            ),
                            child: Divider(
                              color:
                                  UiTheme.primaryGradientEnd.withOpacity(0.5),
                              height: 3,
                              thickness: 1,
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Meine Expertise ist nicht ausreichend",
                      style: theme.textTheme.bodyText1,
                    ),
                    // TODO checkbox without statefull widget
                    Checkbox(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(8.0),
            child: RoundedButton(
              label: Text(
                "Kaufen",
                style: theme.textTheme.headline5?.copyWith(
                  color: UiTheme.textColorWhite,
                ),
              ),
              width: double.infinity,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) {
                    return BuyStockFailed();
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
