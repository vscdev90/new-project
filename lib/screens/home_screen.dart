import 'package:flutter/material.dart';

import '../data/mindset_principles_repository.dart';
import '../models/mindset_principle.dart';
import 'principle_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key, Future<List<MindsetPrinciple>> Function()? principlesLoader})
      : principlesLoader = principlesLoader ?? loadMindsetPrinciples;

  final Future<List<MindsetPrinciple>> Function() principlesLoader;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final Future<List<MindsetPrinciple>> _principlesFuture;

  @override
  void initState() {
    super.initState();
    _principlesFuture = widget.principlesLoader();
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

          final grouped = _groupByCategory(snapshot.data ?? const []);
          final categories = grouped.keys.toList()..sort();

          return ListView(
            children: [
              for (final category in categories) ...[
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
                  child: Text(
                    category,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                for (final principle in grouped[category]!)
                  ListTile(
                    title: Text(principle.title),
                    subtitle: Text(principle.shortDescription),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) =>
                              PrincipleDetailScreen(principle: principle),
                        ),
                      );
                    },
                  ),
              ],
            ],
          );
        },
      ),
    );
  }
}
