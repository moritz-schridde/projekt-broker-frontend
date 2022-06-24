import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:projekt_broker_frontend/constants/frontend/ui_assets.dart';
import 'package:projekt_broker_frontend/services/firebase_auth_service.dart';

class AuthScreen extends StatelessWidget {
  static const routeName = "/auth";
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Theme(
      data: theme.copyWith(
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(
              const EdgeInsets.all(24),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            foregroundColor:
                MaterialStateProperty.all<Color>(theme.primaryColor),
          ),
        ),
      ),
      child: SignInScreen(
        providerConfigs: FirebaseAuthService.providerConfigurations,
        headerBuilder: (context, constraints, shrinkOffset) =>
            buildHeader(constraints, theme),
        sideBuilder: (context, constraints) => buildHeader(constraints, theme),
      ),
    );
  }

  Widget buildHeader(BoxConstraints constraints, ThemeData theme) {
    return ConstrainedBox(
      constraints: constraints,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: Image.asset(
              "${UiAssets.basePathImg}/logo.png",
              height: constraints.maxHeight * 0.9,
            ),
          ),
          SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: "T",
                      style: theme.textTheme.headline1!.copyWith(
                        color: theme.primaryColor,
                      ),
                    ),
                    TextSpan(
                      text: "rade",
                      style: theme.textTheme.headline1,
                    )
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: "E",
                      style: theme.textTheme.headline1!.copyWith(
                        color: theme.primaryColor,
                      ),
                    ),
                    TextSpan(
                      text: "mpire",
                      style: theme.textTheme.headline1,
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
