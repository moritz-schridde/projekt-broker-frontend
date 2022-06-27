import 'dart:html';
import 'package:flutter/material.dart';

import 'dart:typed_data';

import 'package:flutter/services.dart';

class UiAssets with ChangeNotifier {
  static bool initialized = false;

  static String get basePath =>
      window.location.hostname == 'localhost' ? "" : "assets";

  static String get basePathImg => "${basePath != '' ? '$basePath/' : ''}img";

  static init(BuildContext context) async {
    if (initialized) return;

    initialized = true;
  }
}
