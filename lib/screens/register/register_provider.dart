import 'package:flutter/material.dart';
import 'package:projekt_broker_frontend/models/bank_account.dart';
import 'package:projekt_broker_frontend/models/user_info.dart';

class RegisterProvider with ChangeNotifier {
  late UserInfo userInfo;
  late BankAccount bankAccount;

  RegisterProvider(userInfo, bankAccount) {
    this.userInfo = userInfo ??
        UserInfo(
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
    this.bankAccount = bankAccount ??
        BankAccount(
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
}
