import 'package:flutter/material.dart';

class CircleIndicator extends StatelessWidget {
  const CircleIndicator({
    Key? key,
    required this.index,
    required this.isSelected,
    this.circleRadius,
    this.borderColor,
    this.backgroundColor,
    this.textColor,
  }) : super(key: key);

  /// Index of the circle.
  final int index;

  /// Whether this circle is selected or not.
  final bool isSelected;
  final double? circleRadius;
  final Color? borderColor;
  final Color? backgroundColor;
  final Color? textColor;

  Color get defaultBackgroundColor => isSelected ? Colors.blue : Colors.white;
  Color get defaultTextColor => isSelected ? Colors.white : Colors.blue;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double _circleRadius = circleRadius ?? constraints.maxWidth / 6;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: _circleRadius,
          width: _circleRadius,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_circleRadius),
            color: backgroundColor ?? defaultBackgroundColor,
            border: Border.all(
              color: borderColor ?? Colors.blue,
              width: 2,
            ),
          ),
          child: Center(
            child: Text(
              index.toString(),
              style: TextStyle(
                fontSize: _circleRadius * 0.35,
                color: textColor ?? defaultTextColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }

  BoxDecoration getSelectedCircleDecoration(
    BuildContext context, {
    required double circleRadius,
    required int circleIndex,
    required bool isSelected,
  }) {
    BoxDecoration unselectedBoxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(circleRadius),
      border: Border.all(
        color: Theme.of(context).primaryColor,
        width: 2,
      ),
    );
    if (!isSelected) return unselectedBoxDecoration;
    if (circleIndex < 4 && isSelected) {
      return BoxDecoration(
        borderRadius: BorderRadius.circular(circleRadius),
        color: Theme.of(context).errorColor,
        border: Border.all(
          color: Theme.of(context).errorColor,
          width: 2,
        ),
      );
    } else if (circleIndex < 7 && isSelected) {
      return BoxDecoration(
        borderRadius: BorderRadius.circular(circleRadius),
        color: const Color(0xFFE57B00),
      );
    } else if (circleIndex < 9 && isSelected) {
      return BoxDecoration(
        borderRadius: BorderRadius.circular(circleRadius),
        color: const Color(0xFFFFC400),
      );
    } else if (circleIndex >= 9 && isSelected) {
      return BoxDecoration(
        borderRadius: BorderRadius.circular(circleRadius),
        color: Theme.of(context).primaryColor,
      );
    } else {
      return unselectedBoxDecoration;
    }
  }
}
