import 'dart:math';

import 'package:flutter/material.dart';

class Utils {
  static Alignment getFixedAlignment({
    required double radians,
    double radiousFactor = 1,
  }) {
    double x = radiousFactor * cos(radians);
    double y = radiousFactor * sin(radians);
    return Alignment(x, y);
  }
}
