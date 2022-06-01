import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projekt_broker_frontend/constants/frontend/ui_theme.dart';
import 'package:projekt_broker_frontend/provider/portfolio_provider.dart';
import 'package:projekt_broker_frontend/screens/home/widgets/portfolio_overview_bottom_sheet_content.dart';
import 'package:projekt_broker_frontend/widgets/draggable_overview.dart';
import 'package:provider/provider.dart';

class PortfolioOverviewButton extends StatelessWidget {
  const PortfolioOverviewButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Consumer<PortfolioProvider>(
        builder: (context, portfolioProvider, _) {
      List<List<String>> buttonContentPayIn = [
        ["Betrag", "30€"],
        ["Guthaben nach Einzahlung", "${portfolioProvider.budget! + 30}€"],
      ];
      List<List<String>> buttonContentPayOut = [
        ["Betrag", "30€"],
        ["Verfügbares Guthaben", "${portfolioProvider.budget}€"],
        ["Guthaben nach Abbuchung", "${portfolioProvider.budget! - 30}€"],
      ];
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
                      return DraggableOverview(
                        header: "Einzahlen",
                        inizialSize: (400 / MediaQuery.of(context).size.height),
                        child: PortfolioOverviewBottomSheetContent(
                          contentList: buttonContentPayIn,
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
                      return DraggableOverview(
                        header: "Abbuchen",
                        inizialSize: (400 / MediaQuery.of(context).size.height),
                        child: PortfolioOverviewBottomSheetContent(
                          contentList: buttonContentPayOut,
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
