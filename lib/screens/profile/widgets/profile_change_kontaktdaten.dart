import 'package:flutter/material.dart';
import 'package:projekt_broker_frontend/provider/user_info_provider.dart';
import 'package:projekt_broker_frontend/screens/profile/widgets/edit_profile_form_field.dart';
import 'package:projekt_broker_frontend/widgets/rounded_button.dart';
import 'package:provider/provider.dart';

class ProfileChangeKontaktdaten extends StatelessWidget {
  const ProfileChangeKontaktdaten({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
    final theme = Theme.of(context);
    return Consumer<UserInfoProvider>(
      builder: (context, userInfoProvider, child) => SimpleDialog(
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            "Kontaktdaten",
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
                    labelText: "Vorname",
                    initialValue: userInfoProvider.userInfo?.name ?? "N/A",
                  ),
                  EditProfileFormField(
                      labelText: "Nachname",
                      initialValue:
                          userInfoProvider.userInfo?.surname ?? "N/A"),
                  EditProfileFormField(
                      labelText: "Telefonnummer",
                      initialValue: userInfoProvider.userInfo?.phone ?? "N/A"),
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
      ),
    );
  }
}
