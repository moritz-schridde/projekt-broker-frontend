import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class IconConverter implements JsonConverter<IconData, String> {
  const IconConverter();

  static final _translation = <int, IconData>{
    0: MdiIcons.chartBar,
    1: Icons.keyboard,
    2: MdiIcons.rocketLaunch,
    3: Icons.flash_on,
    4: Icons.local_gas_station,
    5: MdiIcons.leaf,
    6: MdiIcons.bank,
    7: MdiIcons.tractor,
    8: MdiIcons.bottleSodaClassicOutline,
    9: MdiIcons.anvil,
    10: Icons.shopping_cart,
    11: MdiIcons.pill,
    12: MdiIcons.tank,
    13: MdiIcons.shipWheel,
    14: MdiIcons.officeBuilding,
    15: Icons.movie,
    16: MdiIcons.watch,
    17: Icons.phone_android_outlined,
    18: Icons.lock_outline_rounded,
  };

  @override
  IconData fromJson(String json) {
    final index = int.tryParse(json) ?? 0;
    return _translation[index] ?? (_translation[0]!);
  }

  @override
  @deprecated
  String toJson(IconData iconData) {
    // print("looking for: ${iconData.toString()}");
    // print("#####");
    // return _translation.entries
    //     .firstWhere((e) {
    //       print(e.value.toString());
    //       return e.value.toString() == iconData.toString();
    //     })
    //     .key
    //     .toString();
    return _translation[0].toString();
  }
}
