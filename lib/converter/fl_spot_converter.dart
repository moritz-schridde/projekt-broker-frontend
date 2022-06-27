import 'dart:convert';
import 'dart:typed_data';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FlSpotConverter implements JsonConverter<FlSpot, Map<String, dynamic>> {
  const FlSpotConverter();

  @override
  FlSpot fromJson(Map<String, dynamic> json) {
    return FlSpot(
      // DateTime.fromMillisecondsSinceEpoch(json['x'] as int),
      json['x'] as double,
      json['y'] as double,
    );
  }

  @override
  Map<String, dynamic> toJson(FlSpot flSpot) {
    return {
      "x": flSpot.x,
      "y": flSpot.y,
    };
  }
}
