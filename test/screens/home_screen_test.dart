import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:millionaire_mindset/models/mindset_principle.dart';
import 'package:millionaire_mindset/screens/home_screen.dart';
import 'package:millionaire_mindset/screens/principle_detail_screen.dart';

void main() {
  const testPrinciples = [
    MindsetPrinciple(
      id: 'discipline-1',
      title: 'Sta vroeg op',
      category: 'discipline',
      shortDescription: 'Begin de dag met een voorsprong.',
      tips: ['Zet je wekker vroeger'],
    ),
    MindsetPrinciple(
      id: 'geld-1',
      title: 'Betaal jezelf eerst',
      category: 'geld',
      shortDescription: 'Zet spaargeld apart voordat je uitgeeft.',
      tips: ['Automatiseer een overboeking'],
    ),
  ];

  Future<List<MindsetPrinciple>> fakeLoader() async => testPrinciples;

  testWidgets('toont een laadindicator terwijl principes worden geladen', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(home: HomeScreen(principlesLoader: fakeLoader)),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('toont principes gegroepeerd per categorie', (tester) async {
    await tester.pumpWidget(
      MaterialApp(home: HomeScreen(principlesLoader: fakeLoader)),
    );
    await tester.pumpAndSettle();

    expect(find.text('discipline'), findsOneWidget);
    expect(find.text('geld'), findsOneWidget);
    expect(find.text('Sta vroeg op'), findsOneWidget);
    expect(find.text('Betaal jezelf eerst'), findsOneWidget);
  });

  testWidgets('navigeert naar het detailscherm bij een tik op een principe', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(home: HomeScreen(principlesLoader: fakeLoader)),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('Sta vroeg op'));
    await tester.pumpAndSettle();

    expect(find.byType(PrincipleDetailScreen), findsOneWidget);
    expect(find.text('Zet je wekker vroeger'), findsOneWidget);
  });
}
