import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

import '../models/mindset_principle.dart';

const String mindsetPrinciplesAssetPath =
    'assets/data/mindset_principles.json';

/// Parses a JSON string (a list of principle objects) into
/// [MindsetPrinciple] instances. Kept separate from [loadMindsetPrinciples]
/// so it can be unit tested without needing the Flutter asset bundle.
List<MindsetPrinciple> parseMindsetPrinciples(String jsonString) {
  final decoded = jsonDecode(jsonString) as List<dynamic>;
  return decoded
      .map((entry) => MindsetPrinciple.fromJson(entry as Map<String, dynamic>))
      .toList();
}

/// Loads and parses the bundled mindset-principles dataset.
Future<List<MindsetPrinciple>> loadMindsetPrinciples() async {
  final jsonString = await rootBundle.loadString(mindsetPrinciplesAssetPath);
  return parseMindsetPrinciples(jsonString);
}
