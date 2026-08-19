import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:millionaire_mindset/main.dart';

void main() {
  testWidgets('app toont de titel en laadt de principes-asset', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MillionaireMindsetApp());
    // Laat de echte asset-Future (rootBundle) resolven voordat de test
    // eindigt, anders blijft er een pending setState() na dispose hangen.
    await tester.pumpAndSettle();

    expect(find.text('The Millionaire Mindset'), findsOneWidget);
    expect(find.byType(Scaffold), findsOneWidget);
  });
}
