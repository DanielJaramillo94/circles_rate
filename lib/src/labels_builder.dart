import 'dart:math';

import 'package:circles_rate/labels.dart';
import 'package:circles_rate/src/utils.dart';
import 'package:flutter/material.dart';

class LabelsBuilder extends StatelessWidget {
  final double? indicatorRadius;
  final double angle;
  final Labels? labels;

  const LabelsBuilder({
    Key? key,
    this.indicatorRadius,
    required this.angle,
    required this.labels,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      var _indicatorRadius = indicatorRadius ?? constraints.maxWidth / 6;
      var centerDistance = constraints.maxWidth - _indicatorRadius;
      var radiusFactor = centerDistance / constraints.maxWidth;
      var labelAngle = findLabelAngle(
        centerDistance: centerDistance,
        tangentDistance: _indicatorRadius,
      );
      return Stack(
        children: [
          Align(
            alignment: Utils.getFixedAlignment(
              radiusFactor: radiusFactor,
              radians: angle - labelAngle,
            ),
            child: labels?.greatLabel,
          ),
          Align(
            alignment: Utils.getFixedAlignment(
              radiusFactor: radiusFactor,
              radians: angle + labelAngle,
            ),
            child: labels?.lowLabel,
          ),
        ],
      );
    });
  }

  static double findLabelAngle({
    required double centerDistance,
    required double tangentDistance,
  }) {
    double tangentSquared = pow(tangentDistance, 2) as double;
    double centerSquared = pow(centerDistance, 2) as double;
    return acos(1 - (tangentSquared / (2 * centerSquared)));
  }
}
