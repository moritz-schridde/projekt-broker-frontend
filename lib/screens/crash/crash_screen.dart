import 'package:flutter/material.dart';

class CrashScreen extends StatelessWidget {
  static const routeName = "/crash";
  const CrashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Upps, Something went wrong!",
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
    );
  }
}
