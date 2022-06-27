import 'package:flutter/material.dart';

import '../../../constants/frontend/ui_theme.dart';

class ProfileLabeledText extends StatelessWidget {
  String label = "";
  String value = "";
  ProfileLabeledText({Key? key, required this.label, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            label,
            style: theme.textTheme.bodyText1,
          ),
          Text(
            value,
            style: theme.textTheme.bodyText2,
          ),
        ]));
  }
}
