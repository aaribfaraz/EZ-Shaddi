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
}
