import 'package:checkbox_formfield/checkbox_list_tile_formfield.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:projekt_broker_frontend/constants/frontend/ui_theme.dart';
import 'package:projekt_broker_frontend/services/firebase_auth_service.dart';
import 'package:projekt_broker_frontend/widgets/main_bottom_navigation_bar.dart';
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
  String countryValue = "";

  var maskFormatterIBAN = new MaskTextInputFormatter(
    mask: "XX## #### #### #### #### ##",
    filter: {"#": RegExp(r'[0-9]'), "X": RegExp(r'[A-Z]')},
  );
  var maskFormatterSteuerId = new MaskTextInputFormatter(
    mask: "## ### ### ###",
    filter: {"#": RegExp(r'[0-9]')},
  );

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

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
              content: Column(
                children: [
                  TextFormFieldRegister(
                    labelText: "Vorname *",
                  ),
                  TextFormFieldRegister(
                    labelText: "Nachname *",
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: DateTimePicker(
                      initialValue: '',
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Geburtsdatum *'),
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
                          return 'Bitte füllen Sie dieses Feld aus!';
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
                      hintText: "Telefonnummer *",
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
                        if (val == null || val.isEmpty) {
                          return 'Bitte füllen Sie dieses Feld aus!';
                        }
                        return null;
                      },
                      initialValue: PhoneNumber(isoCode: 'DE'),
                    ),
                  ),
                  TextFormFieldRegister(labelText: "Straße + Hausnr. *"),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: TextFormField(
                      validator: (value) {
                        RegExp regExp = new RegExp('\d{5}');
                        if (value == null || value.isEmpty) {
                          return 'Bitte füllen Sie dieses Feld aus!';
                        } else if (!regExp.hasMatch(value)) {
                          return 'Bitte tragen Sie eine valide, fünfstellige Postleitzahl ein!';
                        }
                        return null;
                      },
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
                  TextFormFieldRegister(labelText: "Ort *"),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    padding: EdgeInsets.symmetric(vertical: 4),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(4)),
                    child: CountryCodePicker(
                      onChanged: ((value) =>
                          countryValue = value.toCountryStringOnly()),
                      // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                      initialSelection: 'DE',
                      favorite: ['+49', 'DE'],
                      // optional. Shows only country name and flag
                      showCountryOnly: true,
                      // optional. Shows only country name and flag when popup is closed.
                      showOnlyCountryWhenClosed: true,
                      // optional. aligns the flag and the Text left
                      alignLeft: true,
                    ),
                  ),
                ],
              ),
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
                      style: theme.textTheme.bodyText1,
                    ),
                  ),
                  TextFormFieldRegister(labelText: "Vorname *"),
                  TextFormFieldRegister(labelText: "Nachname *"),
                  TextFormFieldRegister(
                    labelText: "Steueridentifikationsnummer",
                    inputFormatter: maskFormatterSteuerId,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      "Bankverbindung",
                      style: theme.textTheme.bodyText1,
                    ),
                  ),
                  TextFormFieldRegister(
                      labelText: "IBAN *", inputFormatter: maskFormatterIBAN),
                  TextFormFieldRegister(labelText: "BIC *"),
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
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 8),
                      child: CheckboxListTileFormField(
                        activeColor: UiTheme.primaryColor,
                        title: Text(
                            "Ich möchte Neuigkeiten und Angebote per E-Mail erhalten."),
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
