import 'package:shared_preferences/shared_preferences.dart';

/// Persists which principles the user has marked as favorite.
abstract class FavoritesStore {
  Future<Set<String>> loadFavoriteIds();
  Future<void> setFavorite(String id, bool isFavorite);
}

/// [FavoritesStore] backed by [SharedPreferences], stored as a string list
/// of principle ids under [_favoritesKey].
class SharedPreferencesFavoritesStore implements FavoritesStore {
  static const String _favoritesKey = 'favorite_principle_ids';

  @override
  Future<Set<String>> loadFavoriteIds() async {
    final prefs = await SharedPreferences.getInstance();
    return (prefs.getStringList(_favoritesKey) ?? const []).toSet();
  }

  @override
  Future<void> setFavorite(String id, bool isFavorite) async {
    final prefs = await SharedPreferences.getInstance();
    final ids = (prefs.getStringList(_favoritesKey) ?? const []).toSet();
    if (isFavorite) {
      ids.add(id);
    } else {
      ids.remove(id);
    }
    await prefs.setStringList(_favoritesKey, ids.toList());
  }
}
