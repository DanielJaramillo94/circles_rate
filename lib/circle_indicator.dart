import 'package:flutter/material.dart';

class CircleIndicator extends StatelessWidget {
  const CircleIndicator({
    Key? key,
    required this.index,
    required this.isSelected,
    this.circleRadious,
    this.borderColor,
    this.backgroundColor,
    this.textColor,
  }) : super(key: key);

  final int index;
  final bool isSelected;
  final double? circleRadious;
  final Color? borderColor;
  final Color? backgroundColor;
  final Color? textColor;

  Color get defaultBackgroundColor => isSelected ? Colors.blue : Colors.white;
  Color get defaultTextColor => isSelected ? Colors.white : Colors.blue;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double _circleRadious = circleRadious ?? constraints.maxWidth / 6;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: _circleRadious,
          width: _circleRadious,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_circleRadious),
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
                fontSize: _circleRadious * 0.35,
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
    required double circleRadious,
    required int circleIndex,
    required bool isSelected,
  }) {
    BoxDecoration unselectedBoxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(circleRadious),
      border: Border.all(
        color: Theme.of(context).primaryColor,
        width: 2,
      ),
    );
    if (!isSelected) return unselectedBoxDecoration;
    if (circleIndex < 4 && isSelected) {
      return BoxDecoration(
        borderRadius: BorderRadius.circular(circleRadious),
        color: Theme.of(context).errorColor,
        border: Border.all(
          color: Theme.of(context).errorColor,
          width: 2,
        ),
      );
    } else if (circleIndex < 7 && isSelected) {
      return BoxDecoration(
        borderRadius: BorderRadius.circular(circleRadious),
        color: const Color(0xFFE57B00),
      );
    } else if (circleIndex < 9 && isSelected) {
      return BoxDecoration(
        borderRadius: BorderRadius.circular(circleRadious),
        color: const Color(0xFFFFC400),
      );
    } else if (circleIndex >= 9 && isSelected) {
      return BoxDecoration(
        borderRadius: BorderRadius.circular(circleRadious),
        color: Theme.of(context).primaryColor,
      );
    } else {
      return unselectedBoxDecoration;
    }
  }
}
