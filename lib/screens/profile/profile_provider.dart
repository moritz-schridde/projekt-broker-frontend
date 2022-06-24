import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:projekt_broker_frontend/models/bank_account.dart';
import 'package:projekt_broker_frontend/models/user_info.dart';

import '../../provider/user_info_provider.dart';

class ProfileProvider with ChangeNotifier {
  final double premiumPrice = 9.99;
  bool premium;
  bool premiumCheckBox = true;
  late String premiumButtonLabel;
  late String premiumOverviewText;
  late UserInfo userInfo;
  late BankAccount bankAccount;

  // deps
  final UserInfoProvider userInfoProvider;

  ProfileProvider({
    required this.premium,
    required this.userInfoProvider,
  }) {
    init();
  }

  void init() {
    premiumButtonLabel = premium ? "kündigen" : "kaufen";
    premiumOverviewText = premium
        ? "Ich möchte mein Premium-Abonnement bei Trade Empire kündigen."
        : "Ich stimme zu, dass Trade Empire die monatlichen Kosten von meinem verknüpften Konto per SEPA-Lastschriftverfahren abbucht.";
    // userInfo = context.read<UserInfo>();
  }

  set setPremiumStatus(bool value) {
    premium = value;
    init();
    notifyListeners();
  }
}
