import 'package:circles_rate/circle_indicator.dart';
import 'package:circles_rate/circles_rate.dart';
import 'package:circles_rate/labels.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  final int numberOfCircles = 12;
  final int? avoidCircleNumber = 3;

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
              avoidCircleNumber: 11,
              indexOffset: 1,
              labels: Labels(
                greatLabel: const Text(
                  'A lot! ',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black38,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                lowLabel: const Text(
                  "Meh...",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black38,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              indicator: (index, selectedIndex) {
                bool isSelected = index == selectedIndex;
                return CircleIndicator(
                  index: index,
                  isSelected: isSelected,
                  borderColor: getBorderColor(
                    index: index,
                    isSelected: isSelected,
                  ),
                  backgroundColor: getBackgroundColor(
                    index: index,
                    isSelected: isSelected,
                  ),
                  textColor: getTextColor(
                    index: index,
                    isSelected: isSelected,
                  ),
                );
              },
              centerWidgetBuilder: (_, selectedIndex) {
                return Image.asset(
                  getAsset(index: selectedIndex),
                  width: 120,
                  fit: BoxFit.contain,
                  filterQuality: FilterQuality.medium,
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  String getAsset({required int? index}) {
    if (index == null) return 'assets/images/dash_watching.png';
    if (index < 2) {
      return 'assets/images/dash_angry.png';
    }
    if (index < 4) {
      return 'assets/images/dash_meh.png';
    }
    if (index < 7) {
      return 'assets/images/dash_goofy.png';
    }
    if (index < 9) {
      return 'assets/images/dash_smiley.png';
    }
    if (index < 10) {
      return 'assets/images/dash_star.png';
    }
    return 'assets/images/dash_in_love.png';
  }

  Color getBackgroundColor({
    required int index,
    required bool isSelected,
  }) {
    if (!isSelected) return Colors.white;
    if (index < 2) {
      return Colors.red;
    }
    if (index < 4) {
      return const Color.fromARGB(255, 255, 145, 0);
    }
    if (index < 7) {
      return Colors.yellow[600]!;
    }
    if (index < 9) {
      return Colors.green[300]!;
    }
    return Colors.blue;
  }

  Color getBorderColor({
    required int index,
    required bool isSelected,
  }) {
    if (!isSelected) return Colors.blue;
    return getBackgroundColor(
      index: index,
      isSelected: isSelected,
    );
  }

  Color getTextColor({
    required int index,
    required bool isSelected,
  }) {
    return isSelected ? Colors.white : Colors.blue;
  }
}
