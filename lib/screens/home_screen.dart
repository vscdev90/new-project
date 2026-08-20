import 'package:flutter/material.dart';

import '../data/favorites_store.dart';
import '../data/mindset_principles_repository.dart';
import '../logic/principle_selection.dart';
import '../models/mindset_principle.dart';
import '../widgets/responsive_content.dart';
import 'principle_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    super.key,
    Future<List<MindsetPrinciple>> Function()? principlesLoader,
    FavoritesStore? favoritesStore,
    DateTime Function()? now,
  })  : principlesLoader = principlesLoader ?? loadMindsetPrinciples,
        favoritesStore = favoritesStore ?? SharedPreferencesFavoritesStore(),
        now = now ?? DateTime.now;

  final Future<List<MindsetPrinciple>> Function() principlesLoader;
  final FavoritesStore favoritesStore;
  final DateTime Function() now;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final Future<List<MindsetPrinciple>> _principlesFuture;
  Set<String> _favoriteIds = {};
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _principlesFuture = widget.principlesLoader();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    final ids = await widget.favoritesStore.loadFavoriteIds();
    if (!mounted) return;
    setState(() => _favoriteIds = ids);
  }

  Future<void> _toggleFavorite(String id) async {
    final isFavorite = !_favoriteIds.contains(id);
    setState(() {
      _favoriteIds = isFavorite
          ? {..._favoriteIds, id}
          : ({..._favoriteIds}..remove(id));
    });
    await widget.favoritesStore.setFavorite(id, isFavorite);
  }

  void _openDetail(MindsetPrinciple principle) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => PrincipleDetailScreen(
          principle: principle,
          isFavorite: _favoriteIds.contains(principle.id),
          onFavoriteToggled: () => _toggleFavorite(principle.id),
        ),
      ),
    );
  }

  Map<String, List<MindsetPrinciple>> _groupByCategory(
    List<MindsetPrinciple> principles,
  ) {
    final grouped = <String, List<MindsetPrinciple>>{};
    for (final principle in principles) {
      grouped.putIfAbsent(principle.category, () => []).add(principle);
    }
    return grouped;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('The Millionaire Mindset')),
      body: FutureBuilder<List<MindsetPrinciple>>(
        future: _principlesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Kon principes niet laden: ${snapshot.error}'),
            );
          }

          final allPrinciples = snapshot.data ?? const [];
          final tip = tipOfTheDay(allPrinciples, widget.now());
          final visiblePrinciples = filterPrinciples(
            allPrinciples,
            _searchQuery,
          );
          final grouped = _groupByCategory(visiblePrinciples);
          final categories = grouped.keys.toList()..sort();

          return ResponsiveContent(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'Zoek op titel of categorie',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) =>
                        setState(() => _searchQuery = value),
                  ),
                ),
                if (tip != null && _searchQuery.trim().isEmpty)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: Card(
                      child: ListTile(
                        leading: const Icon(Icons.wb_sunny_outlined),
                        title: const Text('Tip van de dag'),
                        subtitle: Text(tip.title),
                        onTap: () => _openDetail(tip),
                      ),
                    ),
                  ),
                Expanded(
                  child: categories.isEmpty
                      ? const Center(
                          child: Text('Geen principes gevonden.'),
                        )
                      : ListView(
                          children: [
                            for (final category in categories) ...[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                  16,
                                  8,
                                  16,
                                  4,
                                ),
                                child: Text(
                                  category,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                              for (final principle in grouped[category]!)
                                ListTile(
                                  title: Text(principle.title),
                                  subtitle: Text(
                                    principle.shortDescription,
                                  ),
                                  trailing: IconButton(
                                    icon: Icon(
                                      _favoriteIds.contains(principle.id)
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                    ),
                                    tooltip:
                                        _favoriteIds.contains(principle.id)
                                            ? 'Verwijderen uit favorieten'
                                            : 'Toevoegen aan favorieten',
                                    onPressed: () =>
                                        _toggleFavorite(principle.id),
                                  ),
                                  onTap: () => _openDetail(principle),
                                ),
                            ],
                          ],
                        ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
