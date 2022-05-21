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
    this.indicatorRadious,
    this.labels,
  }) : super(key: key);

  final int? avoidCircleNumber;
  final int numberOfCircles;
  final int? indexOffset;
  final bool? isReversed;
  final Function(int selectedIndex)? onIndexChanged;
  final Widget? Function(BuildContext context, int? index)? centerWidgetBuilder;
  //TODO: remove nullable (affect tests)
  final Widget Function(int index, int? selectedIndex)? indicator;
  final double? indicatorRadious;
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
            indicatorRadious: widget.indicatorRadious,
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
