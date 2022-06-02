import 'package:flutter/cupertino.dart';
import 'package:projekt_broker_frontend/provider/portfolio_provider.dart';

enum BuyType { buyIn, buyOut }

class PortfolioOverviewBottomSheetContentProvider with ChangeNotifier {
  PortfolioProvider portfolioProvider;
  BuyType type;

  late TextEditingController textEditingController;
  late String label;

  PortfolioOverviewBottomSheetContentProvider({
    required this.portfolioProvider,
    required this.type,
  }) {
    init();
  }

  void init() {
    textEditingController = TextEditingController();
    label = type == BuyType.buyIn ? "Einzahlen" : "Abbuchen";
  }

  List<List<String>> get buttonContent => [
        ["Betrag", "30€"],
        if (type == BuyType.buyIn)
          [
            "Guthaben nach Einzahlung",
            "${portfolioProvider.budget! + (double.tryParse(textEditingController.text) ?? 0)}€"
          ],
        if (type == BuyType.buyOut) ...[
          ["Verfügbares Guthaben", "${portfolioProvider.budget}€"],
          [
            "Guthaben nach Abbuchung",
            "${portfolioProvider.budget! - (double.tryParse(textEditingController.text) ?? 0)}€"
          ],
        ]
      ];

  set setBudgetLabel(String value) {
    textEditingController.text = value;
    notifyListeners();
  }

  void setNewPortfolioBudget() {
    //TODO Backend call
    notifyListeners();
  }
}
