import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ez_shaddi/main.dart';

void main() {
  testWidgets('Login screen shows welcome text and login button', (WidgetTester tester) async {
    await tester.pumpWidget(const EzShaddiApp());

    expect(find.textContaining('EZ SHADDI', findRichText: true), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);
  });

  testWidgets('Logging in navigates to the marketplace home screen', (WidgetTester tester) async {
    await tester.pumpWidget(const EzShaddiApp());

    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();

    expect(find.text('Pearl Continental Banquet Hall'), findsOneWidget);
  });

  testWidgets('Tapping a vendor card opens its profile and Add to Cart works', (WidgetTester tester) async {
    await tester.pumpWidget(const EzShaddiApp());

    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Pearl Continental Banquet Hall'));
    await tester.pumpAndSettle();

    expect(find.text('Add to Cart'), findsOneWidget);

    await tester.tap(find.text('Add to Cart'));
    await tester.pump();

    expect(find.textContaining('added to cart'), findsOneWidget);
  });

  testWidgets('Added vendor appears in cart with correct total', (WidgetTester tester) async {
    await tester.pumpWidget(const EzShaddiApp());

    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Pearl Continental Banquet Hall'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Add to Cart'));
    await tester.pumpAndSettle();

    await tester.pageBack();
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.shopping_cart));
    await tester.pumpAndSettle();

    expect(find.text('Pearl Continental Banquet Hall'), findsOneWidget);
    expect(find.textContaining('850000'), findsWidgets);
  });

  testWidgets('Checkout posts spend into the budget tracker', (WidgetTester tester) async {
    await tester.pumpWidget(const EzShaddiApp());

    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Photographer'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Lens & Light Studios'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Add to Cart'));
    await tester.pumpAndSettle();

    await tester.pageBack();
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.shopping_cart));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Proceed To Checkout'));
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.pie_chart));
    await tester.pumpAndSettle();

    expect(find.textContaining('180000'), findsWidgets);
  });
}
