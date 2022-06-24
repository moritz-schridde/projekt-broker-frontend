import 'package:flutter/cupertino.dart';
import 'package:projekt_broker_frontend/provider/portfolio_provider.dart';
import 'package:projekt_broker_frontend/services/backend_service.dart';

enum BuyType { buyIn, buyOut }

class PortfolioOverviewBottomSheetContentProvider with ChangeNotifier {
  // deps
  BackendService backendService;
  PortfolioProvider portfolioProvider;

  // option
  BuyType type;

  // state
  late TextEditingController textEditingController;
  late String label;

  PortfolioOverviewBottomSheetContentProvider({
    required this.backendService,
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

  Future setNewPortfolioBudget() async {
    //TODO Backend call
    await backendService.callBackend(
      requestType: RequestType.POST,
      endpoint: "user/bank/${type == BuyType.buyIn ? "deposit" : "withdraw"}",
      body: {
        "amount": double.tryParse(textEditingController.text) ?? 0,
      },
    );
    portfolioProvider.clearCache(notify: true);
    notifyListeners();
  }
}
