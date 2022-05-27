import 'package:circles_rate/src/circles_builder.dart';
import 'package:circles_rate/labels.dart';
import 'package:flutter/material.dart';

class CirclesRate extends StatefulWidget {
  const CirclesRate({
    Key? key,
    required this.numberOfCircles,
    this.centerWidgetBuilder,
    this.avoidCircleNumber,
    this.onIndexChanged,
    this.indexOffset,
    this.isReversed,
    this.indicator,
    this.indicatorRadius,
    this.labels,
  }) : super(key: key);

  /// Index of the circle that will not be displayed. It is mandatory if
  /// [labels] is not null.
  final int? avoidCircleNumber;

  /// Number of circles to display.
  final int numberOfCircles;

  /// The first circle is the one placed at 0 radians if this is null or zero.
  final int? indexOffset;

  /// Indicator widgets are displayed counterclockwise if true.
  final bool? isReversed;

  /// This triggers when user select new indicator widget.
  final Function(int selectedIndex)? onIndexChanged;

  /// Widget that is displayed at the center of indicator widgets.
  final Widget? Function(BuildContext context, int? index)? centerWidgetBuilder;

  //TODO: remove nullable (affect tests)
  /// Widget that is displayed at the indicator for the user to change the rate.
  final Widget Function(int index, int? selectedIndex)? indicator;

  /// Distance from the center to the leftmost side of the indicator widget.
  /// This is the radius in case the indicator widget is a circle.
  final double? indicatorRadius;

  final Labels? labels;

  @override
  _CirclesRateState createState() => _CirclesRateState();
}

class _CirclesRateState extends State<CirclesRate> {
  int? currentIndex;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        children: [
          CirclesBuilder(
            numberOfCircles: widget.numberOfCircles,
            indicator: widget.indicator!,
            indicatorRadius: widget.indicatorRadius,
            avoidCircleNumber: widget.avoidCircleNumber,
            labels: widget.labels,
            selectedIndex: currentIndex,
            indexOffset: widget.indexOffset,
            isReversed: widget.isReversed,
            onIndexChanged: (selectedIndex) => setState(() {
              if (selectedIndex == currentIndex) {
                currentIndex = null;
                return;
              }
              currentIndex = selectedIndex;
              widget.onIndexChanged?.call(selectedIndex);
            }),
          ),
          if (widget.centerWidgetBuilder != null)
            Center(
              child: widget.centerWidgetBuilder?.call(context, currentIndex),
            ),
        ],
      ),
    );
  }
}
