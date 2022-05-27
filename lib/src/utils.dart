import 'dart:math';

import 'package:flutter/material.dart';

class Utils {
  static Alignment getFixedAlignment({
    required double radians,
    double radiusFactor = 1,
  }) {
    double x = radiusFactor * cos(radians);
    double y = radiusFactor * sin(radians);
    return Alignment(x, y);
  }
}
