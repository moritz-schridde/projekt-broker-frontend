import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:projekt_broker_frontend/screens/profile/widgets/edit_profile_form_field.dart';
import 'package:projekt_broker_frontend/widgets/rounded_button.dart';

class ProfileChangePersoenlicheDaten extends StatelessWidget {
  ProfileChangePersoenlicheDaten({Key? key}) : super(key: key);

  var maskFormatterPlz = MaskTextInputFormatter(
    mask: "#####",
    filter: {
      "#": RegExp(r'[0-9]'),
    },
  );

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
    final theme = Theme.of(context);
    return SimpleDialog(
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          "Persönliche Daten",
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
                    labelText: "Straße + Hausnummer",
                    initialValue: "Musterstraße 1"),
                EditProfileFormField(
                    labelText: "Postleitzahl",
                    initialValue: "12345",
                    inputFormatter: maskFormatterPlz),
                EditProfileFormField(
                    labelText: "Stadt", initialValue: "Musterstadt"),
                EditProfileFormField(
                    labelText: "Land", initialValue: "Musterland"),
                EditProfileFormField(
                    labelText: "Staatsangehörigkeit",
                    initialValue: "Deutschland"),
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
