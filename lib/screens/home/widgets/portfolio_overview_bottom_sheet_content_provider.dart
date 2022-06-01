import 'package:flutter/cupertino.dart';
import 'package:projekt_broker_frontend/provider/portfolio_provider.dart';

enum BuyType { buyIn, buyOut }

class PortfolioOverviewBottomSheetContentProvider with ChangeNotifier {
  PortfolioProvider portfolioProvider;
  late TextEditingController textEditingController;

  late List<List<String>> buttonContent;
  BuyType type;

  PortfolioOverviewBottomSheetContentProvider({
    required this.portfolioProvider,
    required this.type,
  }) {
    init();
  }

  void init() {
    buttonContent = [
      ["Betrag", "30€"],
      if (type == BuyType.buyIn)
        ["Guthaben nach Einzahlung", "${portfolioProvider.budget! + 30}€"],
      if (type == BuyType.buyOut) ...[
        ["Verfügbares Guthaben", "${portfolioProvider.budget}€"],
        ["Guthaben nach Abbuchung", "${portfolioProvider.budget! - 30}€"],
      ]
    ];
    textEditingController = TextEditingController(text: "00,00");
  }
}
