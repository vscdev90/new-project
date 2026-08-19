import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:millionaire_mindset/models/mindset_principle.dart';
import 'package:millionaire_mindset/screens/principle_detail_screen.dart';

void main() {
  const principle = MindsetPrinciple(
    id: 'discipline-1',
    title: 'Sta vroeg op',
    category: 'discipline',
    shortDescription: 'Begin de dag met een voorsprong.',
    tips: ['Zet je wekker vroeger', 'Vermijd de snoozeknop'],
  );

  testWidgets('toont titel, categorie, omschrijving en alle tips', (
    tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(home: PrincipleDetailScreen(principle: principle)),
    );

    expect(find.text('Sta vroeg op'), findsOneWidget);
    expect(find.text('discipline'), findsOneWidget);
    expect(find.text('Begin de dag met een voorsprong.'), findsOneWidget);
    expect(find.text('Zet je wekker vroeger'), findsOneWidget);
    expect(find.text('Vermijd de snoozeknop'), findsOneWidget);
  });
}
