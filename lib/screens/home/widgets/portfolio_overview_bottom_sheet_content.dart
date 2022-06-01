import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projekt_broker_frontend/constants/frontend/ui_theme.dart';

class PortfolioOverviewBottomSheetContent extends StatelessWidget {
  List<List<String>> contentList;

  PortfolioOverviewBottomSheetContent({
    Key? key,
    required this.contentList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(
        left: 18.0,
      ),
      child: Column(
        children: [
          ...contentList
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
                    contentList.last == item
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
  }
}
