import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:projekt_broker_frontend/constants/frontend/ui_theme.dart';
import 'package:projekt_broker_frontend/pages/stock_detail/stock_detail_page.dart';
import 'package:projekt_broker_frontend/screens/home/widgets/portfolio_overview_card.dart';
import 'package:projekt_broker_frontend/services/firebase_auth_service.dart';
import 'package:projekt_broker_frontend/widgets/main_bottom_navigation_bar.dart';
import 'package:projekt_broker_frontend/widgets/stock_overview_card.dart';
import 'package:provider/src/provider.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrieren'),
      ),
      body: Stepper(
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
            title: const Text('Persönliches'),
            content: Column(children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Vorname',
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nachname',
                ),
              ),
              DateTimePicker(
                initialValue: '',
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Geburtsdatum'),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
                dateLabelText: 'Geburtsdatum',
                dateMask: 'dd.MM.yyyy',
                onChanged: (val) => print(val),
                validator: (val) {
                  print(val);
                  return null;
                },
                onSaved: (val) => print(val),
              ),
              InternationalPhoneNumberInput(
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
                initialValue: PhoneNumber(isoCode: 'DE'),
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Straße + Hausnr.',
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'PLZ',
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Ort',
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Land',
                ),
              ),
            ]),
          ),
          Step(
            title: Text('Bankverbindung'),
            content: Column(
              children: [
                Text("Kontoinhaber"),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Vorname',
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nachname',
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Steueridentifikationsnummer',
                  ),
                ),
                Text(
                  "Bankverbindung",
                  style: TextStyle(),
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'IBAN',
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'BIC',
                  ),
                ),
              ],
            ),
          ),
          Step(
              title: Text('Registrierung abschließen'),
              content: Column(
                children: [
                  CheckboxListTile(
                    value: ischeckedGeschaeftsbed,
                    title: Text(
                        "Ich habe die allgemeinen Geschäftsbedingungen und Datenschutzrichtlinien zur Kenntnis genommen und stimme diesen zu."),
                    onChanged: (bool? value) {
                      setState(() {
                        ischeckedGeschaeftsbed = value!;
                      });
                    },
                  ),
                  CheckboxListTile(
                    value: ischeckedNotification,
                    title: Text(
                        "Ich möchte Neuigkeiten und Angebote per E-Mail erhalten."),
                    onChanged: (bool? value) {
                      setState(() {
                        ischeckedNotification = value!;
                      });
                    },
                  )
                ],
              ))
        ],
      ),
      bottomNavigationBar: MainBottomNavigationBar(),
    );
  }
}
