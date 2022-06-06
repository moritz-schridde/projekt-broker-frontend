import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_picker/country_picker.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:projekt_broker_frontend/constants/frontend/ui_theme.dart';
import 'package:projekt_broker_frontend/models/bank_account.dart';
import 'package:projekt_broker_frontend/models/user_info.dart';
import 'package:projekt_broker_frontend/screens/register/register_provider.dart';
import 'package:projekt_broker_frontend/services/firebase_auth_service.dart';
import 'package:projekt_broker_frontend/widgets/main_bottom_navigation_bar.dart';
import 'package:provider/provider.dart';

import 'widgets/TextFormFieldRegister.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = "/register";
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  int _index = 0;
  bool ischeckedGeschaeftsbed = false;
  bool ischeckedNotification = false;
  String countryValue = "";

  processRegister() {
    if (_formKey.currentState!.validate()) {
      print("register validated");
    } else {
      print("register");
    }
  }

  final _formKey = GlobalKey<FormState>();

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

    // return Consumer<RegisterProvider>(builder: (context, registerProvider, _) {
    //   final userInfo = registerProvider.userInfo;
    TextStyle headingStyle = TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrieren'),
      ),
      body: Form(
        key: _formKey,
        child: Stepper(
          controlsBuilder: (context, ControlsDetails controls) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  if (_index != 0)
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
                    child: Text(_index == 2 ? "Abschicken" : "Weiter"),
                  ),
                ],
              ),
            );
          },
          currentStep: _index,
          onStepCancel: () {
            if (_index > 0) {
              setState(() {
                _index -= 1;
              });
            }
          },
          onStepContinue: () {
            if (_index <= 1) {
              setState(() {
                _index += 1;
              });
            }
            if (_index == 2) {
              processRegister();
            }
          },
          onStepTapped: (int index) {
            setState(() {
              _index = index;
            });
          },
          steps: <Step>[
            Step(
              isActive: _index == 0,
              state: _index > 1 ? StepState.complete : StepState.indexed,
              title: Text(
                'Persönliches',
                style: headingStyle,
              ),
              content: Column(
                children: [
                  TextFormFieldRegister(
                    labelText: "Vorname",
                    // onSaved: (value) =>
                    //     registerProvider.updateUserInfo((p0) => p0.copyWith.name(value!)),
                  ),
                  TextFormFieldRegister(
                    labelText: "Nachname",
                    // onSaved: (value) =>
                    //     registerProvider.updateUserInfo((p0) => p0.copyWith.surname(value!)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: DateTimePicker(
                      initialValue: '',
                      decoration:
                          InputDecoration(border: OutlineInputBorder(), labelText: 'Geburtsdatum'),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                      locale: const Locale('de', 'DE'),
                      dateLabelText: 'Geburtsdatum',
                      dateMask: 'dd.MM.yyyy',
                      onChanged: (val) => {
                        print(val),
                      },
                      validator: (date) {
                        if (date == null || date.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      // onSaved: (value) {
                      //   registerProvider.updateUserInfo((p0) => p0.copyWith.birthDay(value!));
                      //},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: InternationalPhoneNumberInput(
                      onInputChanged: (PhoneNumber number) {
                        print(number.phoneNumber);
                      },
                      onInputValidated: (bool value) {
                        print(value);
                      },
                      selectorConfig: SelectorConfig(
                        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                      ),
                      ignoreBlank: false,
                      hintText: "Telefonnummer",
                      autoValidateMode: AutovalidateMode.disabled,
                      selectorTextStyle: TextStyle(color: Colors.black),
                      formatInput: false,
                      keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
                      inputBorder: OutlineInputBorder(),
                      // onSaved: (value) => registerProvider
                      //     .updateUserInfo((p0) => p0.copyWith.phone(value.phoneNumber!)),
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      initialValue: PhoneNumber(isoCode: 'DE'),
                    ),
                  ),
                  TextFormFieldRegister(
                    labelText: "Straße + Hausnr.",
                    // onSaved: (value) =>
                    //     registerProvider.updateUserInfo((p0) => p0.copyWith.street(value!)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: TextFormField(
                      validator: (value) {
                        RegExp regExp = new RegExp('\d{5}');
                        if (value == null || value.isEmpty) {
                          return 'Bitte füllen Sie dieses Feld aus';
                        } else if (!regExp.hasMatch(value)) {
                          return 'Bitte tragen Sie eine valide, fünfstellige Postleitzahl ein';
                        }
                        return null;
                      },
                      // onSaved: (value) =>
                      //     registerProvider.updateUserInfo((p0) => p0.copyWith.postalcode(value!)),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'PLZ',
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(5),
                      ], // Only numbers can be entered
                    ),
                  ),
                  TextFormFieldRegister(
                    labelText: "Ort",
                    // onSaved: (value) =>
                    //     registerProvider.updateUserInfo((p0) => p0.copyWith.city(value!)),
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
                      // onChanged: (value) =>
                      //     registerProvider.updateUserInfo((p0) => p0.copyWith.country(value.name!)),
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
            Step(
              title: Text(
                'Bankverbindung',
                style: headingStyle,
              ),
              isActive: _index == 1,
              content: Column(
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

                    //initialValue: registerProvider.userInfo.name,
                    // onSaved: (value) =>
                    // registerProvider.updateBankAccount((p0) => p0.copyWith.name(value!)),
                  ),
                  TextFormFieldRegister(
                    labelText: "Nachname",
                    //initialValue: registerProvider.userInfo.name,
                    // onSaved: (value) =>
                    // registerProvider.updateBankAccount((p0) => p0.copyWith.surname(value!)),
                  ),
                  TextFormFieldRegister(
                    labelText: "Steueridentifikationsnummer",
                    inputFormatter: maskFormatterSteuerId,
                    // onSaved: (value) =>
                    // registerProvider.updateBankAccount((p0) => p0.copyWith.taxNumber(value!)),
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
                    // onSaved: (value) =>
                    // registerProvider.updateBankAccount((p0) => p0.copyWith.iban(value!)),
                  ),
                  TextFormFieldRegister(
                    labelText: "BIC",
                    // onSaved: (value) =>
                    // registerProvider.updateBankAccount((p0) => p0.copyWith.bic(value!)),
                  ),
                ],
              ),
            ),
            Step(
                title: Text(
                  'Registrierung abschließen',
                  style: headingStyle,
                ),
                isActive: _index == 2,
                content: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                      child: CheckboxListTile(
                        value: ischeckedGeschaeftsbed,
                        activeColor: UiTheme.primaryColor,
                        title: Text(
                            "Ich habe die allgemeinen Geschäftsbedingungen und Datenschutzrichtlinien zur Kenntnis genommen und stimme diesen zu. *"),
                        onChanged: (bool? value) {
                          setState(() {
                            ischeckedGeschaeftsbed = value!;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                      child: CheckboxListTile(
                        value: ischeckedNotification,
                        title: Text("Ich möchte Neuigkeiten und Angebote per E-Mail erhalten."),
                        onChanged: (bool? value) {
                          setState(() {
                            ischeckedNotification = value!;
                          });
                        },
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
      bottomNavigationBar: MainBottomNavigationBar(),
    );
    //   });
  }
}
