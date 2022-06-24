import 'package:flutter/material.dart';
import 'package:projekt_broker_frontend/constants/frontend/ui_theme.dart';
import 'package:projekt_broker_frontend/provider/portfolio_provider.dart';
import 'package:projekt_broker_frontend/screens/buy_stock/buy_stock_provider.dart';
import 'package:projekt_broker_frontend/screens/buy_stock/widgets/buy_stock_failed.dart';
import 'package:projekt_broker_frontend/screens/buy_stock/widgets/buy_stock_success.dart';
import 'package:projekt_broker_frontend/screens/home/widgets/portfolio_overview_bottom_sheet_content_provider.dart';
import 'package:projekt_broker_frontend/widgets/rounded_button.dart';
import 'package:provider/provider.dart';

class BuyStockOverviewContent extends StatelessWidget {
  const BuyStockOverviewContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Consumer2<BuyStockProvider, PortfolioProvider>(
      builder: (context, buyStockProvider, portfolioProvider, _) => Column(
        children: [
          //TODO Refector as other screen
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
                  // general (both)
                  [
                    "Anzahl an Aktien",
                    buyStockProvider.textEditControllerStock.text,
                  ],
                  [
                    "Geschätzter ${buyStockProvider.mode == BuyStockMode.buy ? "Kaufpreis" : "Verkaufspreis"}",
                    "${buyStockProvider.textEditControllerMoney.text} €",
                  ],
                  [
                    "Transaktionskosten",
                    "0,99 €",
                  ],
                  // buy only
                  if (buyStockProvider.mode == BuyStockMode.buy) ...[
                    [
                      "Verfügbares Guthaben",
                      "${portfolioProvider.budget} €",
                    ],
                    [
                      "Geschätztes Restguthaben",
                      "${((portfolioProvider.budget ?? 0) + (double.tryParse(buyStockProvider.textEditControllerMoney.text) ?? 0))} €",
                    ],
                  ],
                  // sell only
                  if (buyStockProvider.mode == BuyStockMode.sell)
                    [
                      "Geschätztes Guthaben nach Verkauf",
                      "${((portfolioProvider.budget ?? 0) - (double.tryParse(buyStockProvider.textEditControllerMoney.text) ?? 0))} €",
                    ],
                ]
                    .map(
                      (item) => Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 18.0,
                              top: 10.0,
                              bottom: 10.0,
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
                Padding(
                  padding: const EdgeInsets.only(
                    right: 18.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Meine Expertise ist nicht ausreichend",
                        style: theme.textTheme.bodyText1,
                      ),
                      // TODO checkbox without statefull widget
                      Checkbox(
                        value: buyStockProvider.expertise,
                        onChanged: (value) {
                          buyStockProvider.setExpertise(value: value);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 20.0,
            ),
            child: RoundedButton(
              label: Text(
                buyStockProvider.mode == BuyStockMode.buy
                    ? "Kaufen"
                    : "Verkaufen",
                style: theme.textTheme.headline5?.copyWith(
                  color: UiTheme.textColorWhite,
                ),
              ),
              width: double.infinity,
              onPressed: () {
                if (buyStockProvider.expertise) {
                  //TODO backend call
                  //TODO validate
                  buyStockProvider.setExpertise(value: false);
                  Navigator.of(context).pushNamed(BuyStockSuccess.routeName);
                } else {
                  showDialog(
                    context: context,
                    builder: (_) {
                      return BuyStockFailed();
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
