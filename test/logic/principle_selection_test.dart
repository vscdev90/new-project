import 'package:flutter_test/flutter_test.dart';
import 'package:millionaire_mindset/logic/principle_selection.dart';
import 'package:millionaire_mindset/models/mindset_principle.dart';

void main() {
  const principles = [
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

  group('filterPrinciples', () {
    test('geeft alle principes terug bij een lege query', () {
      expect(filterPrinciples(principles, ''), principles);
      expect(filterPrinciples(principles, '   '), principles);
    });

    test('filtert op titel, hoofdletterongevoelig', () {
      final result = filterPrinciples(principles, 'VROEG');
      expect(result, hasLength(1));
      expect(result.first.id, 'discipline-1');
    });

    test('filtert op categorie', () {
      final result = filterPrinciples(principles, 'geld');
      expect(result, hasLength(1));
      expect(result.first.id, 'geld-1');
    });

    test('geeft een lege lijst terug zonder match', () {
      expect(filterPrinciples(principles, 'onvindbaar'), isEmpty);
    });
  });

  group('tipOfTheDay', () {
    test('geeft null terug voor een lege lijst', () {
      expect(tipOfTheDay(const [], DateTime(2026, 1, 1)), isNull);
    });

    test('is deterministisch voor dezelfde dag', () {
      final date = DateTime(2026, 3, 15);
      final first = tipOfTheDay(principles, date);
      final second = tipOfTheDay(principles, date);

      expect(first, isNotNull);
      expect(first!.id, second!.id);
    });

    test('geeft een principe uit de lijst terug', () {
      final tip = tipOfTheDay(principles, DateTime(2026, 6, 1));

      expect(principles.map((p) => p.id), contains(tip!.id));
    });
  });
}
