import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:projekt_broker_frontend/widgets/rounded_button.dart';

import 'edit_profile_form_field.dart';

class ProfileChangeKontoDepot extends StatelessWidget {
  ProfileChangeKontoDepot({Key? key}) : super(key: key);

  var maskFormatterIBAN = MaskTextInputFormatter(
    mask: "XX## #### #### #### #### ##",
    filter: {"#": RegExp(r'[0-9]'), "X": RegExp(r'[A-Z]')},
  );

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
    final theme = Theme.of(context);
    return SimpleDialog(
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          "Konto & Depot",
          style: theme.textTheme.headline6!.copyWith(color: theme.primaryColor),
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
                  initialValue: "DE00 0000 0000 0000 0000 00",
                  inputFormatter: maskFormatterIBAN,
                ),
                EditProfileFormField(
                    labelText: "Verknüpftes Konto Kontoinhaber Vorname",
                    initialValue: "Max"),
                EditProfileFormField(
                    labelText: "Verknüpftes Konto Kontoinhaber Nachname",
                    initialValue: "Mustermann"),
                EditProfileFormField(
                    labelText: "Verknüpftes Konto BIC", initialValue: "XYZ"),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: RoundedButton(
                      onPressed: () => print("speichern"),
                      label: Text("Änderungen übernehmen")),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
