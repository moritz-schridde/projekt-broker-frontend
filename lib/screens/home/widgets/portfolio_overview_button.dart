import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projekt_broker_frontend/constants/frontend/ui_theme.dart';
import 'package:projekt_broker_frontend/provider/portfolio_provider.dart';
import 'package:projekt_broker_frontend/screens/home/widgets/portfolio_overview_bottom_sheet_content.dart';
import 'package:projekt_broker_frontend/screens/home/widgets/portfolio_overview_bottom_sheet_content_provider.dart';
import 'package:projekt_broker_frontend/widgets/draggable_overview.dart';
import 'package:provider/provider.dart';

class PortfolioOverviewButton extends StatelessWidget {
  const PortfolioOverviewButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Consumer<PortfolioProvider>(
        builder: (context, portfolioProvider, _) {
      return Column(
        children: [
          Expanded(
            child: Container(),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 50),
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 0,
                  blurRadius: 2,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  child: Column(
                    children: [
                      Icon(Icons.file_upload_outlined),
                      Text("Einzahlen"),
                    ],
                  ),
                  // TODO Einzahlen
                  onPressed: () => showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    barrierColor: Colors.black45,
                    builder: (context) {
                      return ChangeNotifierProvider<
                          PortfolioOverviewBottomSheetContentProvider>(
                        create: (context) =>
                            PortfolioOverviewBottomSheetContentProvider(
                          portfolioProvider: portfolioProvider,
                          type: BuyType.buyIn,
                        ),
                        child: DraggableOverview(
                          header: "Einzahlen",
                          inizialSize:
                              (300 / MediaQuery.of(context).size.height),
                          child: PortfolioOverviewBottomSheetContent(),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: UiTheme.primaryColorScheme.primary,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                TextButton(
                  child: Column(
                    children: [
                      Icon(Icons.file_download_outlined),
                      Text("Abbuchen"),
                    ],
                  ),
                  onPressed: () => showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    barrierColor: Colors.black45,
                    builder: (context) {
                      return ChangeNotifierProvider<
                          PortfolioOverviewBottomSheetContentProvider>(
                        create: (context) =>
                            PortfolioOverviewBottomSheetContentProvider(
                          portfolioProvider: portfolioProvider,
                          type: BuyType.buyOut,
                        ),
                        child: DraggableOverview(
                          header: "Abbuchen",
                          inizialSize:
                              (350 / MediaQuery.of(context).size.height),
                          child: PortfolioOverviewBottomSheetContent(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
