import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:millionaire_mindset/data/mindset_principles_repository.dart';

void main() {
  group('parseMindsetPrinciples', () {
    test('parseert een geldige JSON-lijst naar MindsetPrinciple-objecten', () {
      const jsonString = '''
      [
        {
          "id": "test-1",
          "title": "Test titel",
          "category": "discipline",
          "shortDescription": "Korte omschrijving",
          "tips": ["Tip 1", "Tip 2"]
        }
      ]
      ''';

      final principles = parseMindsetPrinciples(jsonString);

      expect(principles, hasLength(1));
      expect(principles.first.id, 'test-1');
      expect(principles.first.category, 'discipline');
      expect(principles.first.tips, ['Tip 1', 'Tip 2']);
    });

    test('geeft een lege lijst terug voor een lege JSON-array', () {
      expect(parseMindsetPrinciples('[]'), isEmpty);
    });

    test('gooit een fout bij een ontbrekend verplicht veld', () {
      const invalidJson = '[{"id": "x", "title": "Titel"}]';

      expect(
        () => parseMindsetPrinciples(invalidJson),
        throwsA(isA<TypeError>()),
      );
    });
  });

  group('assets/data/mindset_principles.json', () {
    final file = File('assets/data/mindset_principles.json');

    test('bestaat en bevat geldige JSON', () {
      expect(file.existsSync(), isTrue);
      expect(() => jsonDecode(file.readAsStringSync()), returnsNormally);
    });

    test('bevat tussen de 20 en 30 principes, verdeeld over meerdere categorieën', () {
      final principles = parseMindsetPrinciples(file.readAsStringSync());

      expect(principles.length, inInclusiveRange(20, 30));

      final categories = principles.map((p) => p.category).toSet();
      expect(categories.length, greaterThanOrEqualTo(3));
    });

    test('heeft unieke ids', () {
      final principles = parseMindsetPrinciples(file.readAsStringSync());
      final ids = principles.map((p) => p.id).toSet();

      expect(ids.length, principles.length);
    });

    test('elk principe heeft een niet-lege titel en minstens 1 tip', () {
      final principles = parseMindsetPrinciples(file.readAsStringSync());

      for (final principle in principles) {
        expect(principle.title, isNotEmpty, reason: principle.id);
        expect(principle.shortDescription, isNotEmpty, reason: principle.id);
        expect(principle.tips, isNotEmpty, reason: principle.id);
      }
    });
  });
}
