import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projekt_broker_frontend/constants/frontend/ui_theme.dart';

class MainTopNavigationBar extends StatelessWidget {
  final String title;

  const MainTopNavigationBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppBar(
      primary: true,
      title: Text(
        title,
        style: theme.textTheme.headline4?.copyWith(
          color: UiTheme.primaryColor,
        ),
      ),
      elevation: 0,
      backgroundColor: theme.scaffoldBackgroundColor,
      leading: Navigator.of(context).canPop()
          ? CupertinoNavigationBarBackButton(
              color: UiTheme.primaryColor,
            )
          : null,
    );
  }
}
