import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:iban_form_field/iban_form_field.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:projekt_broker_frontend/constants/frontend/ui_theme.dart';
import 'package:projekt_broker_frontend/pages/stock_detail/stock_detail_page.dart';
import 'package:projekt_broker_frontend/screens/home/widgets/portfolio_overview_card.dart';
import 'package:projekt_broker_frontend/services/firebase_auth_service.dart';
import 'package:projekt_broker_frontend/widgets/main_bottom_navigation_bar.dart';
import 'package:projekt_broker_frontend/widgets/stock_overview_card.dart';
import 'package:provider/src/provider.dart';

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
  var maskFormatterIBAN = new MaskTextInputFormatter(
      // mask: "#### #### #### #### #### ##",
      // filter: {"X": RegExp('^[A-Z]'), "#": RegExp(r'[0-9]')},
      );
  // Iban? _iban;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrieren'),
      ),
      body: Form(
        child: Stepper(
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
          },
          onStepTapped: (int index) {
            setState(() {
              _index = index;
            });
          },
          steps: <Step>[
            Step(
              title: const Text(
                'Persönliches',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              content: Column(children: [
                TextFormFieldRegister(
                  labelText: "Vorname",
                ),
                TextFormFieldRegister(
                  labelText: "Nachname",
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: DateTimePicker(
                    initialValue: '',
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Geburtsdatum'),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                    locale: const Locale('de', 'DE'),
                    dateLabelText: 'Geburtsdatum',
                    dateMask: 'dd.MM.yyyy',
                    onChanged: (val) => {
                      print(val),
                    },
                    validator: (date) {
                      if (date == null) {
                        return 'Please choose a date';
                      }
                      return null;
                    },
                    onSaved: (val) => print(val),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
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
                    autoValidateMode: AutovalidateMode.disabled,
                    selectorTextStyle: TextStyle(color: Colors.black),
                    formatInput: false,
                    keyboardType: TextInputType.numberWithOptions(
                        signed: true, decimal: true),
                    inputBorder: OutlineInputBorder(),
                    onSaved: (PhoneNumber number) {
                      print('On Saved: $number');
                    },
                    validator: (val) {
                      if (val != null) {
                        return "Bitte ergänzen Sie eine Telefonnummer";
                      }
                      ;
                      return null;
                    },
                    initialValue: PhoneNumber(isoCode: 'DE'),
                  ),
                ),
                TextFormFieldRegister(labelText: "Straße + Hausnr."),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: TextFormField(
                    validator: (value) {
                      RegExp regExp = new RegExp('\d{5}');
                      if (value == null) {
                        return 'Please enter some text';
                      } else if (!regExp.hasMatch(value)) {
                        return 'Please enter a valid PLZ';
                      }
                      return null;
                    },
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
                TextFormFieldRegister(labelText: "Ort"),
                TextFormFieldRegister(labelText: "Land"),
              ]),
            ),
            Step(
              title: Text(
                'Bankverbindung',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              content: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      "Kontoinhaber",
                      style: UiTheme.textTheme.bodyText1,
                    ),
                  ),
                  TextFormFieldRegister(labelText: "Vorname"),
                  TextFormFieldRegister(labelText: "Nachname"),
                  TextFormFieldRegister(
                      labelText: "Steueridentifikationsnummer"),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      "Bankverbindung",
                      style: UiTheme.textTheme.bodyText1,
                    ),
                  ),
                  TextFormFieldRegister(
                      labelText: "IBAN", inputFormatter: maskFormatterIBAN),
                  TextFormFieldRegister(labelText: "BIC"),
                ],
              ),
            ),
            Step(
                title: Text(
                  'Registrierung abschließen',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                content: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 8),
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
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 8),
                      child: CheckboxListTile(
                        value: ischeckedNotification,
                        title: Text(
                            "Ich möchte Neuigkeiten und Angebote per E-Mail erhalten."),
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
  }
}
