import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:millionaire_mindset/main.dart';

void main() {
  testWidgets('HomePage toont de app-titel', (WidgetTester tester) async {
    await tester.pumpWidget(const MillionaireMindsetApp());

    expect(find.text('The Millionaire Mindset'), findsOneWidget);
    expect(find.byType(Scaffold), findsOneWidget);
  });
}
