import 'dart:math';

import 'package:circles_rate/src/aligned_circle.dart';
import 'package:circles_rate/src/assertions/assertion_type.enum.dart';
import 'package:circles_rate/labels.dart';
import 'package:circles_rate/src/labels_builder.dart';
import 'package:flutter/material.dart';

class CirclesBuilder extends StatelessWidget {
  final int? avoidCircleNumber;
  final int numberOfCircles;
  final int? selectedIndex;
  final int indexOffset;
  final bool isReversed;
  final Function(int selectedIndex)? onIndexChanged;
  final Widget Function(int index, int? selectedIndex) indicator;
  final double? indicatorRadius;
  final Labels? labels;

  CirclesBuilder({
    Key? key,
    required this.numberOfCircles,
    required this.indicator,
    this.indicatorRadius,
    this.avoidCircleNumber,
    this.selectedIndex,
    this.onIndexChanged,
    int? indexOffset,
    bool? isReversed,
    this.labels,
  })  : assert(
            numberOfCircles > 0, AssertionType.invalidNumberOfCircles.message),
        indexOffset = calculateIndexOffset(
          numberOfCircles,
          avoidCircleNumber,
          indexOffset,
        ),
        isReversed = isReversed ?? false,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: List.generate(
          numberOfCircles,
          (virtualIndex) {
            int index = transformVirtualIndex(virtualIndex);
            double indicatorAngle = 2 * pi / numberOfCircles * virtualIndex;
            if (avoidCircleNumber != null && avoidCircleNumber == index) {
              if (labels != null) {
                return LabelsBuilder(
                  angle: indicatorAngle,
                  indicatorRadius: indicatorRadius,
                  labels: labels,
                );
              }
              return const SizedBox.shrink();
            }
            return GestureDetector(
              onTap: () => onIndexChanged?.call(index),
              child: AlignedWidget(
                radians: indicatorAngle,
                child: indicator(index, selectedIndex),
              ),
            );
          },
        ),
      ),
    );
  }

  int transformVirtualIndex(int virtualIndex) {
    int index = virtualIndex - indexOffset;
    if (index < 0) index = numberOfCircles + index;
    if (isReversed) index = index == 0 ? 0 : numberOfCircles - index;
    return index;
  }
}

int calculateIndexOffset(
  int numberOfCircles,
  int? avoidCircleNumber,
  int? _indexOffset,
) {
  int indexOffset = _indexOffset ?? 0;
  int removedCircles = avoidCircleNumber == null ? 0 : 1;
  return indexOffset % (numberOfCircles - removedCircles);
}
