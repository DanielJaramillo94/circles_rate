import 'package:circles_rate/circles_rate.dart';
import 'package:circles_rate/src/aligned_circle.dart';
import 'package:circles_rate/src/assertions/assertion_type.enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
      'Throw AssertionType.invalidNumberOfCircles if numberOfCircles == 0',
      (WidgetTester tester) async {
    int numberOfCircles = 0;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CirclesRate(numberOfCircles: numberOfCircles),
        ),
      ),
    );

    final assertion = tester.takeException();
    expect(assertion, isAssertionError);

    final assertionMessage = (assertion as AssertionError).message;
    expect(assertionMessage, AssertionType.invalidNumberOfCircles.message);
  });

  testWidgets(
      'Check correct rendered number of circles if numberOfCircles == 10',
      (WidgetTester tester) async {
    int numberOfCircles = 10;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CirclesRate(numberOfCircles: numberOfCircles),
        ),
      ),
    );

    Iterable<Widget> allWidgets = tester.allWidgets;

    expect(find.byType(CirclesRate), findsOneWidget);
    List<AlignedWidget> alignedCircles =
        allWidgets.whereType<AlignedWidget>().toList();
    expect(alignedCircles.length, numberOfCircles);
  });

  testWidgets(
      'Check correct rendered number of circles if numberOfCircles == 1',
      (WidgetTester tester) async {
    int numberOfCircles = 1;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CirclesRate(numberOfCircles: numberOfCircles),
        ),
      ),
    );

    Iterable<Widget> allWidgets = tester.allWidgets;

    expect(find.byType(CirclesRate), findsOneWidget);
    List<AlignedWidget> alignedCircles =
        allWidgets.whereType<AlignedWidget>().toList();
    expect(alignedCircles.length, numberOfCircles);
  });
  testWidgets(
      'Check correct rendered number of circles and its order if numberOfCircles == 5',
      (WidgetTester tester) async {
    int numberOfCircles = 5;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CirclesRate(numberOfCircles: numberOfCircles),
        ),
      ),
    );

    Iterable<Widget> allWidgets = tester.allWidgets;

    expect(find.byType(CirclesRate), findsOneWidget);
    List<AlignedWidget> alignedCircles =
        allWidgets.whereType<AlignedWidget>().toList();
    expect(alignedCircles.length, numberOfCircles);
    List<String?> circlesOrder =
        allWidgets.whereType<Text>().map((e) => e.data).toList();
    expect(circlesOrder, ['0', '1', '2', '3', '4']);
  });

  testWidgets(
      'Check correct rendered number of circles and its order with isReversed == true if numberOfCircles == 6',
      (WidgetTester tester) async {
    int numberOfCircles = 6;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CirclesRate(
            numberOfCircles: numberOfCircles,
            isReversed: true,
          ),
        ),
      ),
    );

    Iterable<Widget> allWidgets = tester.allWidgets;

    expect(find.byType(CirclesRate), findsOneWidget);
    List<AlignedWidget> alignedCircles =
        allWidgets.whereType<AlignedWidget>().toList();
    expect(alignedCircles.length, numberOfCircles);
    List<String?> circlesOrder =
        allWidgets.whereType<Text>().map((e) => e.data).toList();
    expect(circlesOrder, ['0', '5', '4', '3', '2', '1']);
  });

  testWidgets(
      'Check correct rendered number of circles and its order with numberOfCircles == 5 and indexOffset == 2',
      (WidgetTester tester) async {
    int numberOfCircles = 5;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CirclesRate(
            numberOfCircles: numberOfCircles,
            indexOffset: 2,
          ),
        ),
      ),
    );

    Iterable<Widget> allWidgets = tester.allWidgets;

    expect(find.byType(CirclesRate), findsOneWidget);
    List<AlignedWidget> alignedCircles =
        allWidgets.whereType<AlignedWidget>().toList();
    expect(alignedCircles.length, numberOfCircles);
    List<String?> circlesOrder =
        allWidgets.whereType<Text>().map((e) => e.data).toList();
    expect(circlesOrder, ['3', '4', '0', '1', '2']);
  });

  testWidgets(
      'Check correct rendered number of circles and its order with numberOfCircles == 4, indexOffset == 2 and isReversed == true',
      (WidgetTester tester) async {
    int numberOfCircles = 4;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CirclesRate(
            numberOfCircles: numberOfCircles,
            indexOffset: 2,
            isReversed: true,
          ),
        ),
      ),
    );

    Iterable<Widget> allWidgets = tester.allWidgets;

    expect(find.byType(CirclesRate), findsOneWidget);
    List<AlignedWidget> alignedCircles =
        allWidgets.whereType<AlignedWidget>().toList();
    expect(alignedCircles.length, numberOfCircles);
    List<String?> circlesOrder =
        allWidgets.whereType<Text>().map((e) => e.data).toList();
    expect(circlesOrder, ['2', '1', '0', '3']);
  });

  testWidgets(
      'Check correct rendered number of circles and its order with numberOfCircles == 5 and avoidCircleNumber == 2',
      (WidgetTester tester) async {
    int numberOfCircles = 6;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CirclesRate(
            numberOfCircles: numberOfCircles,
            avoidCircleNumber: 2,
          ),
        ),
      ),
    );

    Iterable<Widget> allWidgets = tester.allWidgets;

    expect(find.byType(CirclesRate), findsOneWidget);
    List<AlignedWidget> alignedCircles =
        allWidgets.whereType<AlignedWidget>().toList();
    expect(alignedCircles.length, numberOfCircles - 1);
    List<String?> circlesOrder =
        allWidgets.whereType<Text>().map((e) => e.data).toList();
    expect(circlesOrder, ['0', '1', '3', '4', '5']);
  });

  testWidgets(
      'Check correct rendered number of circles and its order with numberOfCircles == 6, isReversed == true and avoidCircleNumber == 3',
      (WidgetTester tester) async {
    int numberOfCircles = 6;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CirclesRate(
            numberOfCircles: numberOfCircles,
            isReversed: true,
            avoidCircleNumber: 3,
          ),
        ),
      ),
    );

    Iterable<Widget> allWidgets = tester.allWidgets;

    expect(find.byType(CirclesRate), findsOneWidget);
    List<AlignedWidget> alignedCircles =
        allWidgets.whereType<AlignedWidget>().toList();
    expect(alignedCircles.length, numberOfCircles - 1);
    List<String?> circlesOrder =
        allWidgets.whereType<Text>().map((e) => e.data).toList();
    expect(circlesOrder, ['0', '5', '4', '2', '1']);
  });

  testWidgets(
      'Expected widget returned by centerWidgetBuilder with numberOfCircles == 6',
      (WidgetTester tester) async {
    int numberOfCircles = 6;
    const valueKey = ValueKey('centerTextWidget');

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CirclesRate(
            numberOfCircles: numberOfCircles,
            centerWidgetBuilder: (context, currentIndex) {
              return Text(
                currentIndex.toString(),
                key: valueKey,
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 45,
                ),
              );
            },
          ),
        ),
      ),
    );

    var alignedCirclesElements = find.byType(AlignedWidget).evaluate().toList();
    expect(alignedCirclesElements.length, numberOfCircles);
    var finder = find.descendant(
      of: find.byType(AlignedWidget),
      matching: find.byType(Center),
    );

    Text centerTextWidget;

    centerTextWidget = find.byKey(valueKey).evaluate().first.widget as Text;
    expect(centerTextWidget.data, 'null');

    await tester.tap(finder.at(4));
    await tester.pump();
    centerTextWidget = find.byKey(valueKey).evaluate().first.widget as Text;
    expect(centerTextWidget.data, '4');

    await tester.tap(finder.at(0));
    await tester.pump();
    centerTextWidget = find.byKey(valueKey).evaluate().first.widget as Text;
    expect(centerTextWidget.data, '0');

    await tester.tap(finder.at(0));
    await tester.pump();
    centerTextWidget = find.byKey(valueKey).evaluate().first.widget as Text;
    expect(centerTextWidget.data, 'null');
  });
}
