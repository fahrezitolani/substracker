// This is a basic Flutter widget test.

import 'package:flutter_test/flutter_test.dart';

import 'package:substracker/main.dart';

void main() {
  testWidgets('App builds without crashing', (WidgetTester tester) async {
    await tester.pumpWidget(const SubstrackerApp());
    // Verify splash screen renders with the app name
    expect(find.text('Substracker'), findsOneWidget);
  });
}
