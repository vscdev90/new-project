import 'package:flutter_test/flutter_test.dart';
import 'package:millionaire_mindset/data/favorites_store.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() {
    // Vervangt het echte platform-kanaal door een in-memory implementatie,
    // zodat SharedPreferences ook in een widget-testomgeving werkt.
    SharedPreferences.setMockInitialValues({});
  });

  test('loadFavoriteIds geeft een lege set terug zonder opgeslagen data', () async {
    final store = SharedPreferencesFavoritesStore();

    expect(await store.loadFavoriteIds(), isEmpty);
  });

  test('setFavorite(true) voegt een id toe, setFavorite(false) verwijdert het weer', () async {
    final store = SharedPreferencesFavoritesStore();

    await store.setFavorite('discipline-1', true);
    expect(await store.loadFavoriteIds(), {'discipline-1'});

    await store.setFavorite('geld-1', true);
    expect(await store.loadFavoriteIds(), {'discipline-1', 'geld-1'});

    await store.setFavorite('discipline-1', false);
    expect(await store.loadFavoriteIds(), {'geld-1'});
  });

  test('favorieten blijven bewaard tussen store-instanties', () async {
    await SharedPreferencesFavoritesStore().setFavorite('geld-1', true);

    final freshStore = SharedPreferencesFavoritesStore();
    expect(await freshStore.loadFavoriteIds(), {'geld-1'});
  });
}
