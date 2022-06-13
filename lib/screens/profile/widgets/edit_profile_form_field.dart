import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class EditProfileFormField extends StatelessWidget {
  String labelText = "";
  String initialValue = "";
  MaskTextInputFormatter? inputFormatter;
  EditProfileFormField({
    required this.labelText,
    required this.initialValue,
    this.inputFormatter,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: theme.textTheme.bodyText1,
        border: InputBorder.none,
      ),
      initialValue: initialValue,
      cursorHeight: 0.5,
      style: theme.textTheme.bodyText2!.copyWith(height: 2),
      validator: (value) {
        if (labelText == "Postleitzahl") {
          RegExp regExp = RegExp('\\d{5}');
          if (value == null || value.isEmpty) {
            return 'Bitte füllen Sie dieses Feld aus!';
          } else if (!regExp.hasMatch(value)) {
            return 'Bitte tragen Sie eine valide, fünfstellige Postleitzahl ein!';
          }
          return null;
        } else {
          if (value == null || value.isEmpty) {
            return 'Bitte füllen Sie dieses Feld aus!';
          }
          return null;
        }
      },
      inputFormatters: (inputFormatter != null) ? [inputFormatter!] : null,
    );
  }
}
