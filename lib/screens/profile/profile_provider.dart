import 'package:flutter/cupertino.dart';

class ProfileProvider with ChangeNotifier {
  final double premiumPrice = 3.00;
  bool premium;
  late String premiumButtonLabel;
  late String premiumOverviewText;

  ProfileProvider({required this.premium}) {
    init();
  }

  void init() {
    premiumButtonLabel = premium ? "kündigen" : "kaufen";
    premiumOverviewText = premium
        ? "Ich möchte mein Premium-Abonnement bei Trade Empire kündigen."
        : "Ich stimme zu, dass Trade Empire die monatlichen Kosten von meinem verknüpften Konto per SEPA-Lastschriftverfahren abbucht.";
  }

  set setPremiumStatus(bool value) {
    premium = value;
    init();
    notifyListeners();
  }
}
