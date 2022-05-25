import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:projekt_broker_frontend/constants/frontend/ui_theme.dart';
import 'package:projekt_broker_frontend/provider/portfolio_provider.dart';
import 'package:projekt_broker_frontend/screens/buy_stock/buy_stock_provider.dart';
import 'package:projekt_broker_frontend/screens/buy_stock/widgets/buy_stock_text_field.dart';
import 'package:projekt_broker_frontend/screens/buy_stock/widgets/draggable_overview.dart';
import 'package:projekt_broker_frontend/screens/buy_stock/widgets/overview_content.dart';
import 'package:projekt_broker_frontend/widgets/main_bottom_navigation_bar.dart';
import 'package:projekt_broker_frontend/widgets/rounded_button.dart';
import 'package:provider/provider.dart';
import 'package:res_builder/responsive.dart';

class BuyStockScreen extends StatelessWidget {
  static const routeName = "/buy_stock";
  const BuyStockScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Consumer2<BuyStockProvider, PortfolioProvider>(
      builder: (context, buyStockProvider, portfolioProvider, _) => Scaffold(
        appBar: AppBar(
          title: Text(
              "Aktien ${buyStockProvider.mode == BuyStockMode.buy ? 'kaufen' : 'verkaufen'} (${buyStockProvider.stock.shortName})"),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 50,
              ),
              Text(
                "Gib den gewünschten ${buyStockProvider.mode == BuyStockMode.buy ? 'Kaufbetrag' : 'Verkaufsbetrag'} ein:",
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(),
                  ),
                  Expanded(
                    flex: Responsive.value<int>(
                      context: context,
                      onMobile: 4,
                      onTablet: 2,
                      onDesktop: 1,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        BuyStockTextField(
                          suffixIcon: "€",
                          controller: buyStockProvider.textEditControllerMoney,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                              RegExp(r'^(\d+)?\.?\d{0,2}'),
                            ),
                          ],
                          hintText: "Betrag",
                          onSubmitted: (value) {
                            buyStockProvider.setStockCount(
                              money: double.tryParse(value) ?? 0,
                            );
                          },
                        ),
                        BuyStockTextField(
                          suffixIcon: buyStockProvider.stock.shortName,
                          controller: buyStockProvider.textEditControllerStock,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                              RegExp(r'[0-9]'),
                            ),
                          ],
                          hintText: "Anzahl",
                          onSubmitted: (value) {
                            buyStockProvider.setMoneyCount(
                              stockCount: int.tryParse(value) ?? 0,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: Container()),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              //TODO get Guthaben from backend
              Text(
                "${buyStockProvider.mode == BuyStockMode.buy ? 'Verfügbares Guthaben: ${portfolioProvider.budget}€' : 'Verfügbare Aktien: ${portfolioProvider.stockCount}'}",
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [0.1, 0.25, 0.5, 0.75]
                    .map(
                      (percentage) => OutlinedButton(
                        child: Text("${percentage * 100}%"),
                        style: OutlinedButton.styleFrom(
                          primary: UiTheme.textColorBlack,
                          padding: const EdgeInsets.symmetric(
                            vertical: 2,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        onPressed: () =>
                            buyStockProvider.mode == BuyStockMode.buy
                                ? buyStockProvider.setStockCount(
                                    money: ((portfolioProvider.budget ?? 0.0) *
                                        percentage),
                                  )
                                : buyStockProvider.setStockCount(
                                    money:
                                        ((portfolioProvider.stockCount ?? 0) *
                                                percentage) *
                                            buyStockProvider.stock.price,
                                  ),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                margin: EdgeInsets.all(15),
                child: RoundedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      barrierColor: Colors.black45,
                      builder: (context) {
                        return DraggableOverview(
                          child: OverviewContent(),
                        );
                      },
                    );
                  },
                  label: Text(
                    buyStockProvider.mode == BuyStockMode.buy
                        ? "Kaufübersicht"
                        : "Verkaufsübersicht",
                    style: theme.textTheme.headline5?.copyWith(
                      color: UiTheme.textColorWhite,
                    ),
                  ),
                  width: double.infinity,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: MainBottomNavigationBar(),
      ),
    );
  }
}
