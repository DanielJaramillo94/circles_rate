import 'package:circles_rate/src/utils.dart';
import 'package:flutter/material.dart';

class AlignedWidget extends StatelessWidget {
  final double radians;
  final Widget child;

  const AlignedWidget({
    Key? key,
    required this.radians,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Utils.getFixedAlignment(radians: radians),
      child: child,
    );
  }
}
