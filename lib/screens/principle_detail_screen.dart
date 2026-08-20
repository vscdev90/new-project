import 'package:flutter/material.dart';

import '../models/mindset_principle.dart';

class PrincipleDetailScreen extends StatefulWidget {
  const PrincipleDetailScreen({
    super.key,
    required this.principle,
    this.isFavorite = false,
    this.onFavoriteToggled = _defaultOnFavoriteToggled,
  });

  final MindsetPrinciple principle;
  final bool isFavorite;
  final VoidCallback onFavoriteToggled;

  static void _defaultOnFavoriteToggled() {}

  @override
  State<PrincipleDetailScreen> createState() => _PrincipleDetailScreenState();
}

class _PrincipleDetailScreenState extends State<PrincipleDetailScreen> {
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.isFavorite;
  }

  void _toggleFavorite() {
    setState(() => _isFavorite = !_isFavorite);
    widget.onFavoriteToggled();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final principle = widget.principle;

    return Scaffold(
      appBar: AppBar(
        title: Text(principle.title),
        actions: [
          IconButton(
            icon: Icon(_isFavorite ? Icons.favorite : Icons.favorite_border),
            tooltip: _isFavorite
                ? 'Verwijderen uit favorieten'
                : 'Toevoegen aan favorieten',
            onPressed: _toggleFavorite,
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(principle.category, style: textTheme.labelLarge),
          const SizedBox(height: 8),
          Text(principle.shortDescription, style: textTheme.bodyLarge),
          const SizedBox(height: 16),
          Text(
            'Tips',
            style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          for (final tip in principle.tips)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('•  '),
                  Expanded(child: Text(tip)),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
