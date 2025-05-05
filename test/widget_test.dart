import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_project/app/app.dart';

void main() {
  group("Calculator View Test", () {
    testWidgets("Calculator UI Elements Present", (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      expect(find.byKey(const Key("Result")), findsOneWidget);
      expect(find.byKey(const Key("displayOne")), findsOneWidget);
      expect(find.byKey(const Key("displayTwo")), findsOneWidget);
      expect(find.byIcon(CupertinoIcons.add), findsOneWidget);
      expect(find.byIcon(CupertinoIcons.minus), findsOneWidget);
      expect(find.byIcon(CupertinoIcons.multiply), findsOneWidget);
      expect(find.byIcon(CupertinoIcons.divide), findsOneWidget);
    });

    testWidgets("Calculator Operation Test", (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      await tester.enterText(find.byKey(const Key("displayOne")), "20");
      await tester.enterText(find.byKey(const Key("displayTwo")), "10");

      await tester.tap(find.byIcon(CupertinoIcons.add));
      await tester.pump();
      expect(find.text("30"), findsOneWidget);

      await tester.tap(find.byIcon(CupertinoIcons.minus));
      await tester.pump();
      expect(find.text("10"), findsNWidgets(2));

      await tester.tap(find.byIcon(CupertinoIcons.multiply));
      await tester.pump();
      expect(find.text("200"), findsOneWidget);

      await tester.tap(find.byIcon(CupertinoIcons.divide));
      await tester.pump();
      expect(find.text("2.0"), findsOneWidget);
    });
  });
}
