import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projekt_broker_frontend/constants/frontend/ui_theme.dart';
import 'package:projekt_broker_frontend/screens/home/widgets/portfolio_overview_bottom_sheet_content_provider.dart';
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
            ...portfolioOverviewBottomSheetContentProvider.buttonContent
                .map(
                  (item) => Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 18.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              item[0].toString(),
                              style: theme.textTheme.bodyText1,
                            ),
                            portfolioOverviewBottomSheetContentProvider
                                        .buttonContent.first ==
                                    item
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
                                        suffixText: "€",
                                        isDense: true,
                                        border: InputBorder.none,
                                        contentPadding:
                                            const EdgeInsets.all(0.0),
                                      ),
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                          RegExp(r'^(\d+)?\.?\d{0,2}'),
                                        ),
                                      ],

                                      //TODO set value in Provider
                                      onSubmitted: (value) {},
                                    ),
                                  )
                                : Text(
                                    item[1].toString(),
                                    style: theme.textTheme.bodyText1,
                                  ),
                          ],
                        ),
                      ),
                      portfolioOverviewBottomSheetContentProvider
                                  .buttonContent.last ==
                              item
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
                )
                .toList()
          ],
        ),
      );
    });
  }
}
