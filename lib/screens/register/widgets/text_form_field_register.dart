import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class TextFormFieldRegister extends StatelessWidget {
  final String labelText;
  final Function(String?) onSaved;
  String? initialValue;
  MaskTextInputFormatter? inputFormatter;
  TextFormFieldRegister({
    required this.labelText,
    this.inputFormatter,
    required this.onSaved,
    this.initialValue,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: TextFormField(
        validator: (value) {
          if (value == null) {
            return 'Bitte füllen Sie dieses Feld aus!';
          }
          return null;
        },
        initialValue: initialValue,
        onSaved: onSaved,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: labelText,
        ),
        inputFormatters: (inputFormatter != null) ? [inputFormatter!] : null,
      ),
    );
  }
}
