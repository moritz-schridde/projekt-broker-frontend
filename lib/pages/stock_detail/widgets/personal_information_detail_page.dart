import 'package:flutter/material.dart';
import 'package:projekt_broker_frontend/constants/frontend/ui_theme.dart';

class PersonalInformationDetail extends StatelessWidget {
  const PersonalInformationDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.symmetric(
            horizontal: BorderSide(
              color: UiTheme.lightTheme.secondaryHeaderColor,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  "Performance",
                  style: UiTheme.textTheme.headline6,
                ),
                Text(
                  "+0,031%",
                  style: UiTheme.textTheme.bodyText2,
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "Im Besitz",
                  style: UiTheme.textTheme.headline6,
                ),
                Text(
                  "2,3",
                  style: UiTheme.textTheme.bodyText2,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
