import 'dart:math';

import 'package:circles_rate/labels.dart';
import 'package:circles_rate/src/utils.dart';
import 'package:flutter/material.dart';

class LabelsBuilder extends StatelessWidget {
  final double? indicatorRadious;
  final double angle;
  final Labels? labels;

  const LabelsBuilder({
    Key? key,
    this.indicatorRadious,
    required this.angle,
    required this.labels,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      var _indicatorRadious = indicatorRadious ?? constraints.maxWidth / 6;
      var centerDistance = constraints.maxWidth - _indicatorRadious;
      var radiousFactor = centerDistance / constraints.maxWidth;
      var labelAngle = findLabelAngle(
        centerDistance: centerDistance,
        tangentDistance: _indicatorRadious,
      );
      return Stack(
        children: [
          Align(
            alignment: Utils.getFixedAlignment(
              radiousFactor: radiousFactor,
              radians: angle - labelAngle,
            ),
            child: labels?.greatLabel,
          ),
          Align(
            alignment: Utils.getFixedAlignment(
              radiousFactor: radiousFactor,
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
