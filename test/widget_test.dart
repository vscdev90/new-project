import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:millionaire_mindset/main.dart';

void main() {
  setUp(() {
    // HomeScreen laadt favorieten via het echte SharedPreferences-kanaal;
    // zonder mock gooit dat een MissingPluginException in de testomgeving.
    SharedPreferences.setMockInitialValues({});
  });

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
