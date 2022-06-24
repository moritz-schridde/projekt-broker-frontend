import 'dart:math';

import 'package:flutter/material.dart';
import 'package:projekt_broker_frontend/models/bank_account.dart';
import 'package:projekt_broker_frontend/models/user_info.dart';
import 'package:projekt_broker_frontend/screens/wrapper/wrapper_screen.dart';
import 'package:projekt_broker_frontend/services/backend_service.dart';

class RegisterProvider with ChangeNotifier {
  // deps
  final BackendService backendService;

  late UserInfo userInfo;
  late BankAccount bankAccount;
  late List<GlobalKey<FormState>> formKeys;
  int _index = 0;

  RegisterProvider({
    required this.backendService,
  }) {
    formKeys = [
      GlobalKey<FormState>(),
      GlobalKey<FormState>(),
      GlobalKey<FormState>()
    ];

    bankAccount = BankAccount(
      kontoId: "New KontoId",
      name: "New Name",
      surname: "New Surname",
      taxNumber: "New TaxNumber",
      iban: "New Iban",
      bic: "New Bic",
    );

    userInfo = UserInfo(
      name: "New Name",
      surname: "New Surname",
      email: "New Email",
      phone: "New Phone",
      street: "New Street",
      number: "New Number",
      postalcode: "New Postalcode",
      city: "New City",
      country: "New Country",
      birthDay: "New BirthDay",
      birthMonth: "New BirthMonth",
      birthYear: "New BirthYear",
      bankAccount: bankAccount,
    );
  }

  void updateUserInfo(UserInfo Function(UserInfo) updateUser) {
    userInfo = updateUser(userInfo);
    notifyListeners();
  }

  int get index => _index;

  set index(int index) {
    // dont skip a step
    if (index >= _index) {
      return;
    }
    print(index);
    _index = max(0, index);

    notifyListeners();
  }

  void nextStep(BuildContext context) {
    if (formKeys[index].currentState?.validate() ?? false) {
      print("validated");
      formKeys[index].currentState!.save();
      // print(bankAccount.toJson);
      // print(userInfo.toJson);
      if (index < 2) {
        print("going to next step");
        _index++;
        print("$index is now current");
      } else {
        print("final step done");
        _processRegister(context);
      }
      notifyListeners();
      return;
    }
    print("validation failed");
  }

  void _processRegister(BuildContext context) async {
    print(bankAccount.toJson);
    print(userInfo.toJson);

    // TODO backend call
    print(
        "calling backend with data: ${bankAccount.toJson} and ${userInfo.toJson}");
    await backendService.callBackend(
      requestType: RequestType.POST,
      endpoint: "user",
      body: userInfo.toJson,
    );

    Navigator.pushReplacementNamed(context, WrapperScreen.routeName);
  }
}
