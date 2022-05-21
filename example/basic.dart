import 'dart:ui';

import 'package:circles_rate/circle_indicator.dart';
import 'package:circles_rate/circles_rate.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  final int numberOfCircles = 8;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Circles rate package demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: SafeArea(
          minimum: const EdgeInsets.only(top: 100.0),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: CirclesRate(
              numberOfCircles: numberOfCircles,
              indicator: (index, selectedIndex) {
                bool isSelected = index == selectedIndex;
                return CircleIndicator(
                  index: index,
                  isSelected: isSelected,
                  borderColor: getBorderColor(
                    index: index,
                    numberOfCircles: numberOfCircles,
                    isSelected: isSelected,
                  ),
                  backgroundColor: getBackgroundColor(
                    index: index,
                    numberOfCircles: numberOfCircles,
                    isSelected: isSelected,
                  ),
                  textColor: getTextColor(
                    index: index,
                    isSelected: isSelected,
                  ),
                );
              },
              centerWidgetBuilder: (_, selectedIndex) {
                if (selectedIndex == null) {
                  return const Text(
                    'Nope',
                    style: TextStyle(
                      fontSize: 60,
                      color: Colors.black54,
                    ),
                  );
                }
                return Text(
                  selectedIndex.toString(),
                  style: const TextStyle(
                    fontSize: 70,
                    color: Colors.black54,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Color getBackgroundColor({
    required int index,
    required int numberOfCircles,
    required bool isSelected,
  }) {
    if (!isSelected) return Colors.white;
    var blackness = lerpDouble(220, 80, 1 / numberOfCircles * index)!.toInt();
    return Color.fromARGB(255, blackness, blackness, blackness);
  }

  Color getBorderColor({
    required int index,
    required int numberOfCircles,
    required bool isSelected,
  }) {
    if (!isSelected) return Colors.black54;
    return getBackgroundColor(
      index: index,
      numberOfCircles: numberOfCircles,
      isSelected: isSelected,
    );
  }

  Color getTextColor({
    required int index,
    required bool isSelected,
  }) {
    return isSelected ? Colors.white : Colors.black54;
  }
}
