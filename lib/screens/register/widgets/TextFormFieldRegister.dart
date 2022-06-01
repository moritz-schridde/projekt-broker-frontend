import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class TextFormFieldRegister extends StatelessWidget {
  final String labelText;
  MaskTextInputFormatter? inputFormatter;
  TextFormFieldRegister({
    required String this.labelText,
    this.inputFormatter,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Bitte füllen Sie dieses Felder aus';
          }
          return null;
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: labelText,
        ),
        inputFormatters: (inputFormatter != null) ? [inputFormatter!] : null,
      ),
    );
  }
}
