import 'package:flutter/material.dart';

import '../models/mindset_principle.dart';

class PrincipleDetailScreen extends StatelessWidget {
  const PrincipleDetailScreen({super.key, required this.principle});

  final MindsetPrinciple principle;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: Text(principle.title)),
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
