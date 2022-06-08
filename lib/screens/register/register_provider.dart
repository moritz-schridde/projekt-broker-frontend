import 'dart:math';

import 'package:flutter/material.dart';
import 'package:projekt_broker_frontend/models/bank_account.dart';
import 'package:projekt_broker_frontend/models/user_info.dart';

class RegisterProvider with ChangeNotifier {
  late UserInfo userInfo;
  late BankAccount bankAccount;
  late List<GlobalKey<FormState>> formKeys;
  int _index = 0;

  RegisterProvider() {
    formKeys = [GlobalKey<FormState>(), GlobalKey<FormState>(), GlobalKey<FormState>()];

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
    );
    bankAccount = BankAccount(
      kontoId: "New KontoId",
      name: "New Name",
      surname: "New Surname",
      taxNumber: "New TaxNumber",
      iban: "New Iban",
      bic: "New Bic",
    );
  }

  void updateUserInfo(UserInfo Function(UserInfo) updateUser) {
    userInfo = updateUser(userInfo);
    notifyListeners();
  }

  void updateBankAccount(BankAccount Function(BankAccount) updateBankAccount) {
    bankAccount = updateBankAccount(bankAccount);
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

  void nextStep() {
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
        _processRegister();
      }
      notifyListeners();
      return;
    }
    print("validation failed");
  }

  void _processRegister() {
    print(bankAccount.toJson);
    print(userInfo.toJson);

    // TODO backend call
    print("should call backend with data: ${bankAccount.toJson} and ${userInfo.toJson}");
  }
}
