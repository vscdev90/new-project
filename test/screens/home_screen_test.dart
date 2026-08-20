import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:millionaire_mindset/data/favorites_store.dart';
import 'package:millionaire_mindset/models/mindset_principle.dart';
import 'package:millionaire_mindset/screens/home_screen.dart';
import 'package:millionaire_mindset/screens/principle_detail_screen.dart';

/// In-memory [FavoritesStore] voor tests, zonder afhankelijkheid van het
/// echte SharedPreferences-platformkanaal.
class InMemoryFavoritesStore implements FavoritesStore {
  final Set<String> ids = {};

  @override
  Future<Set<String>> loadFavoriteIds() async => Set.of(ids);

  @override
  Future<void> setFavorite(String id, bool isFavorite) async {
    if (isFavorite) {
      ids.add(id);
    } else {
      ids.remove(id);
    }
  }
}

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

  // 1 januari 2026 (dag 1 van het jaar): tipOfTheDay kiest index 1 % 2 = 1,
  // dus principles[1] ('Betaal jezelf eerst'). Vastgezet zodat de tip niet
  // per testrun verandert en tests deterministisch blijven.
  DateTime fixedNow() => DateTime(2026, 1, 1);

  Widget buildApp({FavoritesStore? favoritesStore}) {
    return MaterialApp(
      home: HomeScreen(
        principlesLoader: fakeLoader,
        favoritesStore: favoritesStore ?? InMemoryFavoritesStore(),
        now: fixedNow,
      ),
    );
  }

  testWidgets('toont een laadindicator terwijl principes worden geladen', (
    tester,
  ) async {
    await tester.pumpWidget(buildApp());

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('toont principes gegroepeerd per categorie', (tester) async {
    await tester.pumpWidget(buildApp());
    await tester.pumpAndSettle();

    expect(find.text('discipline'), findsOneWidget);
    expect(find.text('geld'), findsOneWidget);
    expect(find.text('Sta vroeg op'), findsOneWidget);
    // 'Betaal jezelf eerst' is met de vaste testdatum ook de tip van de dag,
    // dus die tekst staat zowel in de tipkaart als in de gegroepeerde lijst.
    expect(find.text('Betaal jezelf eerst'), findsNWidgets(2));
  });

  testWidgets('toont een tip van de dag uit de geladen principes', (
    tester,
  ) async {
    await tester.pumpWidget(buildApp());
    await tester.pumpAndSettle();

    expect(find.text('Tip van de dag'), findsOneWidget);
  });

  testWidgets('navigeert naar het detailscherm bij een tik op een principe', (
    tester,
  ) async {
    await tester.pumpWidget(buildApp());
    await tester.pumpAndSettle();

    await tester.tap(find.text('Sta vroeg op'));
    await tester.pumpAndSettle();

    expect(find.byType(PrincipleDetailScreen), findsOneWidget);
    expect(find.text('Zet je wekker vroeger'), findsOneWidget);
  });

  testWidgets('filtert principes op zoekterm (titel of categorie)', (
    tester,
  ) async {
    await tester.pumpWidget(buildApp());
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), 'geld');
    await tester.pumpAndSettle();

    expect(find.text('Betaal jezelf eerst'), findsOneWidget);
    expect(find.text('Sta vroeg op'), findsNothing);
  });

  testWidgets('tikken op het hart-icoon markeert/demarkeert een favoriet', (
    tester,
  ) async {
    final favoritesStore = InMemoryFavoritesStore();
    await tester.pumpWidget(buildApp(favoritesStore: favoritesStore));
    await tester.pumpAndSettle();

    final favoriteButton = find.byIcon(Icons.favorite_border).first;
    await tester.tap(favoriteButton);
    await tester.pumpAndSettle();

    expect(favoritesStore.ids, contains('discipline-1'));
    expect(find.byIcon(Icons.favorite), findsOneWidget);
  });
}
