import 'package:flutter/material.dart';

class ResultWidget extends StatelessWidget {
  const ResultWidget({
    Key? key,
    required this.currentIndex,
    required this.numberOfCircles,
    required this.avoidedCircle,
  }) : super(key: key);

  final int? currentIndex;
  final int numberOfCircles;
  final bool avoidedCircle;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double radius = constraints.maxWidth / 4;
        return Container(
          width: radius,
          height: radius,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(constraints.maxWidth),
            color: getColor(),
          ),
        );
      },
    );
  }

  Color getColor() {
    if (currentIndex == null) return Colors.transparent;
    int _numberOfCircles =
        avoidedCircle ? numberOfCircles - 1 : numberOfCircles;
    double opacity = 1 / _numberOfCircles * (currentIndex! + 1);
    return Colors.black.withOpacity(opacity);
  }
}
