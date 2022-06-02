import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projekt_broker_frontend/constants/frontend/ui_theme.dart';
import 'package:projekt_broker_frontend/screens/home/widgets/portfolio_overview_bottom_sheet_content_provider.dart';
import 'package:projekt_broker_frontend/widgets/rounded_button.dart';
import 'package:provider/provider.dart';

class PortfolioOverviewBottomSheetContent extends StatelessWidget {
  PortfolioOverviewBottomSheetContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Consumer<PortfolioOverviewBottomSheetContentProvider>(
      builder: (context, portfolioOverviewBottomSheetContentProvider, _) {
        return Padding(
          padding: const EdgeInsets.only(
            left: 18.0,
          ),
          child: Column(
            children: [
              ...List<Widget>.generate(
                portfolioOverviewBottomSheetContentProvider
                    .buttonContent.length,
                (index) => Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 18.0,
                        top: 10.0,
                        bottom: 10.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            portfolioOverviewBottomSheetContentProvider
                                .buttonContent[index][0]
                                .toString(),
                            style: theme.textTheme.bodyText1,
                          ),
                          index == 0
                              ? Container(
                                  width: 50,
                                  child: TextField(
                                    controller:
                                        portfolioOverviewBottomSheetContentProvider
                                            .textEditingController,
                                    textAlign: TextAlign.start,
                                    keyboardType:
                                        TextInputType.numberWithOptions(
                                            decimal: true),
                                    decoration: InputDecoration(
                                      hintText: "10,95",
                                      suffixText: "€",
                                      isDense: true,
                                      border: InputBorder.none,
                                      contentPadding: const EdgeInsets.all(0.0),
                                    ),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                        RegExp(r'^(\d+)?\.?\d{0,2}'),
                                      ),
                                    ],
                                    onSubmitted: (value) {
                                      portfolioOverviewBottomSheetContentProvider
                                          .setBudgetLabel = value;
                                    },
                                  ),
                                )
                              : Text(
                                  portfolioOverviewBottomSheetContentProvider
                                      .buttonContent[index][1]
                                      .toString(),
                                  style: theme.textTheme.bodyText1,
                                ),
                        ],
                      ),
                    ),
                    (portfolioOverviewBottomSheetContentProvider
                                    .buttonContent.length -
                                1) ==
                            index
                        ? Container()
                        : Padding(
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
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 20.0,
                ),
                child: RoundedButton(
                  width: double.infinity,
                  onPressed: () {
                    portfolioOverviewBottomSheetContentProvider
                                .textEditingController.text ==
                            ""
                        ? showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text(
                                "Bitte gib einen Wert ein!",
                              ),
                              titlePadding: const EdgeInsets.all(15.0),
                              alignment: Alignment.center,
                              actionsAlignment: MainAxisAlignment.center,
                              actions: [
                                RoundedButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  label: Text(
                                    "Ok",
                                    style: theme.textTheme.headline5?.copyWith(
                                      color: UiTheme.textColorWhite,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        : (() {
                            portfolioOverviewBottomSheetContentProvider
                                .setNewPortfolioBudget();
                            Navigator.of(context).pop();
                          }).call();
                  },
                  label: Text(
                    portfolioOverviewBottomSheetContentProvider.label,
                    style: theme.textTheme.headline5?.copyWith(
                      color: UiTheme.textColorWhite,
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
