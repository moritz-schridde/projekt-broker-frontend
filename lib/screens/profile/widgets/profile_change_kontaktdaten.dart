import 'package:flutter/material.dart';
import 'package:projekt_broker_frontend/models/user_info.dart';
import 'package:projekt_broker_frontend/provider/user_info_provider.dart';
import 'package:projekt_broker_frontend/screens/profile/widgets/edit_profile_form_field.dart';
import 'package:projekt_broker_frontend/widgets/rounded_button.dart';
import 'package:provider/provider.dart';

class ProfileChangeKontaktdaten extends StatelessWidget {
  ProfileChangeKontaktdaten({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  saveChanges(
    BuildContext context,
  ) {
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
                    onSaved: (value) => userInfoProvider
                        .updateUserInfo((p0) => p0.copyWith.name(value ?? "")),
                  ),
                  EditProfileFormField(
                    labelText: "Nachname",
                    initialValue: userInfoProvider.userInfo?.surname ?? "N/A",
                    onSaved: (value) => userInfoProvider.updateUserInfo(
                        (p0) => p0.copyWith.surname(value ?? "")),
                  ),
                  EditProfileFormField(
                    labelText: "Telefonnummer",
                    initialValue: userInfoProvider.userInfo?.phone ?? "N/A",
                    onSaved: (value) => userInfoProvider
                        .updateUserInfo((p0) => p0.copyWith.phone(value ?? "")),
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
