import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:projekt_broker_frontend/widgets/rounded_button.dart';

class ProfileChangeKontaktdaten extends StatelessWidget {
  const ProfileChangeKontaktdaten({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
    final theme = Theme.of(context);
    return AlertDialog(
      title: Row(children: [
        Text(
          "Kontaktdaten",
          style: theme.textTheme.headline6!.copyWith(color: theme.primaryColor),
        ),
        IconButton(
          icon: Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        )
      ]),
      content: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: "Vorname",
                labelStyle: theme.textTheme.bodyText1,
                border: InputBorder.none,
              ),
              initialValue: "Max",
              cursorHeight: 0.5,
              style: theme.textTheme.bodyText2!.copyWith(height: 2),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Nachname",
                labelStyle: theme.textTheme.bodyText1,
                border: InputBorder.none,
              ),
              initialValue: "Mustermann",
              cursorHeight: 0.5,
              style: theme.textTheme.bodyText2!.copyWith(height: 2),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Telefonnummer",
                labelStyle: theme.textTheme.bodyText1,
                border: InputBorder.none,
              ),
              initialValue: "0123456789",
              cursorHeight: 0.5,
              style: theme.textTheme.bodyText2!.copyWith(height: 2),
            )
          ],
        ),
      ),
      actions: [
        RoundedButton(onPressed: () => print("speichern"), label: Text("Änderungen übernehmen")),
      ],
    );
  }
}
