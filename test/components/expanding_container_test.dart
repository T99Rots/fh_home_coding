// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:fh_home_coding/components/button.dart';
import 'package:fh_home_coding/components/expanding_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ExpandingContainer', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: ExpandingContainer(
          builder: (context, toggleOpened, animation, expanded) {
            return CustomButton(
              text: expanded? const Text('Close container'): const Text('Open container'),
              onPressed: toggleOpened
            );
          },
          child: const Text('Content'),
        ),
      ),
    ));

    // Verify the content isn't rendered when the container is not expanded yet
    expect(find.text('Open container'), findsOneWidget);
    expect(find.text('Close container'), findsNothing);
    expect(find.text('Content'), findsNothing);

    // Tap the "Open container" button
    await tester.tap(find.text('Open container'));
    await tester.pumpAndSettle();

    // Verify that the content is now rendered
    expect(find.text('Open container'), findsNothing);
    expect(find.text('Close container'), findsOneWidget);
    expect(find.text('Content'), findsOneWidget);
  });
}
