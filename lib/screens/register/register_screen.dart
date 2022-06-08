import 'package:checkbox_formfield/checkbox_list_tile_formfield.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:projekt_broker_frontend/constants/frontend/ui_theme.dart';
import 'package:projekt_broker_frontend/models/bank_account.dart';
import 'package:projekt_broker_frontend/models/user_info.dart';
import 'package:projekt_broker_frontend/widgets/main_bottom_navigation_bar.dart';
import 'package:provider/provider.dart';
import 'register_provider.dart';
import 'widgets/text_form_field_register.dart';

class RegisterScreen extends StatelessWidget {
  static const routeName = "/register";

  var maskFormatterIBAN = MaskTextInputFormatter(
    mask: "XX## #### #### #### #### ##",
    filter: {"#": RegExp(r'[0-9]'), "X": RegExp(r'[A-Z]')},
  );
  var maskFormatterSteuerId = MaskTextInputFormatter(
    mask: "## ### ### ###",
    filter: {"#": RegExp(r'[0-9]')},
  );

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    TextStyle headingStyle = TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrieren'),
      ),
      body: Consumer<RegisterProvider>(
        builder: (context, registerProvider, _) {
          final userInfo = registerProvider.userInfo;
          return Stepper(
            controlsBuilder: (context, ControlsDetails controls) => Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  if (registerProvider.index != 0)
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: theme.backgroundColor,
                      ),
                      onPressed: controls.onStepCancel,
                      child: Text(
                        "Zurück",
                        style: TextStyle(color: theme.primaryColor),
                      ),
                    ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: UiTheme.primaryColor,
                    ),
                    onPressed: controls.onStepContinue,
                    child: Text(registerProvider.index == 2 ? "Abschicken" : "Weiter"),
                  ),
                ],
              ),
            ),
            currentStep: registerProvider.index,
            onStepCancel: () {
              registerProvider.index = registerProvider.index - 1;
            },
            onStepContinue: () {
              print("onStepContinue");
              registerProvider.nextStep();
            },
            onStepTapped: (int index) {
              registerProvider.index = index;
            },
            steps: <Step>[
              Step(
                isActive: registerProvider.index >= 0,
                state: registerProvider.index > 0 ? StepState.complete : StepState.indexed,
                title: Text(
                  'Persönliches',
                  style: headingStyle,
                ),
                content: Form(
                  key: registerProvider.formKeys[0],
                  child: Column(
                    children: [
                      TextFormFieldRegister(
                        labelText: "Vorname *",
                        onSaved: (value) =>
                            registerProvider.updateUserInfo((p0) => p0.copyWith.name(value ?? "")),
                      ),
                      TextFormFieldRegister(
                        labelText: "Nachname *",
                        onSaved: (value) => registerProvider
                            .updateUserInfo((p0) => p0.copyWith.surname(value ?? "")),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        child: DateTimePicker(
                          initialValue: '',
                          decoration: InputDecoration(
                              border: OutlineInputBorder(), labelText: 'Geburtsdatum *'),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                          locale: const Locale('de', 'DE'),
                          dateLabelText: 'Geburtsdatum',
                          dateMask: 'dd.MM.yyyy',
                          onChanged: (val) => {},
                          validator: (date) {
                            if (date == null || date.isEmpty) {
                              return 'Bitte füllen Sie dieses Feld aus!';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            final date = DateTime.tryParse(value ?? "") ?? DateTime.now();
                            registerProvider.updateUserInfo(
                              (p0) => p0.copyWith(
                                birthDay: date.day.toString(),
                                birthMonth: date.month.toString(),
                                birthYear: date.year.toString(),
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        child: InternationalPhoneNumberInput(
                          onInputChanged: (PhoneNumber number) {},
                          onInputValidated: (bool value) {},
                          selectorConfig: SelectorConfig(
                            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                          ),
                          ignoreBlank: false,
                          hintText: "Telefonnummer *",
                          autoValidateMode: AutovalidateMode.disabled,
                          selectorTextStyle: TextStyle(color: Colors.black),
                          formatInput: false,
                          keyboardType:
                              TextInputType.numberWithOptions(signed: true, decimal: true),
                          inputBorder: OutlineInputBorder(),
                          onSaved: (value) => registerProvider
                              .updateUserInfo((p0) => p0.copyWith.phone(value.phoneNumber ?? "")),
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Bitte füllen Sie dieses Feld aus!';
                            }
                            return null;
                          },
                          initialValue: PhoneNumber(isoCode: 'DE'),
                        ),
                      ),
                      TextFormFieldRegister(
                        labelText: "Straße + Hausnr. *",
                        onSaved: (value) => registerProvider
                            .updateUserInfo((p0) => p0.copyWith.street(value ?? "")),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        child: TextFormField(
                          validator: (value) {
                            RegExp regExp = RegExp('\\d{5}');
                            if (value == null || value.isEmpty) {
                              return 'Bitte füllen Sie dieses Feld aus!';
                            } else if (!regExp.hasMatch(value)) {
                              return 'Bitte tragen Sie eine valide, fünfstellige Postleitzahl ein!';
                            }
                            return null;
                          },
                          onSaved: (value) => registerProvider
                              .updateUserInfo((p0) => p0.copyWith.postalcode(value!)),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'PLZ *',
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(5),
                          ], // Only numbers can be entered
                        ),
                      ),
                      TextFormFieldRegister(
                        labelText: "Ort *",
                        onSaved: (value) =>
                            registerProvider.updateUserInfo((p0) => p0.copyWith.city(value ?? "")),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        padding: EdgeInsets.symmetric(vertical: 4),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(4)),
                        child: CountryCodePicker(
                          onChanged: (value) => registerProvider
                              .updateUserInfo((p0) => p0.copyWith.country(value.name ?? "")),
                          initialSelection: 'DE',
                          favorite: ['+49', 'DE'],
                          showCountryOnly: true,
                          showOnlyCountryWhenClosed: true,
                          alignLeft: true,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Step(
                title: Text(
                  'Bankverbindung',
                  style: headingStyle,
                ),
                isActive: registerProvider.index >= 1,
                state: registerProvider.index > 1 ? StepState.complete : StepState.indexed,
                content: Form(
                  key: registerProvider.formKeys[1],
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          "Kontoinhaber",
                          style: theme.textTheme.bodyText1,
                        ),
                      ),
                      TextFormFieldRegister(
                        labelText: "Vorname",
                        // initialValue: registerProvider.userInfo.name,
                        onSaved: (value) => registerProvider
                            .updateBankAccount((p0) => p0.copyWith.name(value ?? "")),
                      ),
                      TextFormFieldRegister(
                        labelText: "Nachname",
                        // initialValue: registerProvider.userInfo.name,
                        onSaved: (value) => registerProvider
                            .updateBankAccount((p0) => p0.copyWith.surname(value ?? "")),
                      ),
                      TextFormFieldRegister(
                        labelText: "Steueridentifikationsnummer",
                        inputFormatter: maskFormatterSteuerId,
                        onSaved: (value) => registerProvider
                            .updateBankAccount((p0) => p0.copyWith.taxNumber(value ?? "")),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          "Bankverbindung",
                          style: theme.textTheme.bodyText1,
                        ),
                      ),
                      TextFormFieldRegister(
                        labelText: "IBAN",
                        inputFormatter: maskFormatterIBAN,
                        onSaved: (value) => registerProvider
                            .updateBankAccount((p0) => p0.copyWith.iban(value ?? "")),
                      ),
                      TextFormFieldRegister(
                        labelText: "BIC",
                        onSaved: (value) => registerProvider
                            .updateBankAccount((p0) => p0.copyWith.bic(value ?? "")),
                      ),
                    ],
                  ),
                ),
              ),
              Step(
                title: Text(
                  'Registrierung abschließen',
                  style: headingStyle,
                ),
                isActive: registerProvider.index == 2,
                content: Form(
                  key: registerProvider.formKeys[2],
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        child: CheckboxListTileFormField(
                          activeColor: UiTheme.primaryColor,
                          title: Text(
                              "Ich habe die allgemeinen Geschäftsbedingungen und Datenschutzrichtlinien zur Kenntnis genommen und stimme diesen zu. *"),
                          validator: (value) {
                            if (value == false) {
                              return 'Bitte bestätigen Sie die Geschäftsbedingungen und Datenschutzrichtlinien!';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        child: CheckboxListTileFormField(
                          activeColor: UiTheme.primaryColor,
                          title: Text("Ich möchte Neuigkeiten und Angebote per E-Mail erhalten."),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
