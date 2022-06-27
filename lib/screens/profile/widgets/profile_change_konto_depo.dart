import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:projekt_broker_frontend/models/user_info.dart';
import 'package:projekt_broker_frontend/widgets/rounded_button.dart';
import 'package:provider/provider.dart';

import '../../../provider/user_info_provider.dart';
import 'edit_profile_form_field.dart';

class ProfileChangeKontoDepot extends StatelessWidget {
  ProfileChangeKontoDepot({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  var maskFormatterIBAN = MaskTextInputFormatter(
    mask: "XX## #### #### #### #### ##",
    filter: {"#": RegExp(r'[0-9]'), "X": RegExp(r'[A-Z]')},
  );

  saveChanges(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      print("validated");
      _formKey.currentState!.save();
      Navigator.pop(context);
      return;
    }
    print("validation failed");
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Consumer<UserInfoProvider>(
      builder: (context, userInfoProvider, child) => SimpleDialog(
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            "Konto & Depot",
            style:
                theme.textTheme.headline6!.copyWith(color: theme.primaryColor),
          ),
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          )
        ]),
        children: [
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                children: [
                  EditProfileFormField(
                    labelText: "Verknüpftes Konto IBAN",
                    initialValue:
                        userInfoProvider.userInfo?.bankAccount?.iban ?? "N/A",
                    inputFormatter: maskFormatterIBAN,
                    onSaved: (value) => userInfoProvider
                        .updateUserInfo((p0) => p0.copyWith.name(value ?? "")),
                  ),
                  EditProfileFormField(
                    labelText: "Verknüpftes Konto Kontoinhaber Vorname",
                    initialValue:
                        userInfoProvider.userInfo?.bankAccount?.name ?? "N/A",
                    onSaved: (value) => userInfoProvider
                        .updateUserInfo((p0) => p0.copyWith.name(value ?? "")),
                  ),
                  EditProfileFormField(
                    labelText: "Verknüpftes Konto Kontoinhaber Nachname",
                    initialValue:
                        userInfoProvider.userInfo?.bankAccount?.surname ??
                            "N/A",
                    onSaved: (value) => userInfoProvider
                        .updateUserInfo((p0) => p0.copyWith.name(value ?? "")),
                  ),
                  EditProfileFormField(
                    labelText: "Verknüpftes Konto BIC",
                    initialValue:
                        userInfoProvider.userInfo?.bankAccount?.bic ?? "N/A",
                    onSaved: (value) => userInfoProvider
                        .updateUserInfo((p0) => p0.copyWith.name(value ?? "")),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: RoundedButton(
                        onPressed: () => saveChanges(context),
                        label: Text("Änderungen übernehmen")),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
