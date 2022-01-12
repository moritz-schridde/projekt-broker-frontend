import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  static const routeName = "/loading";
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
