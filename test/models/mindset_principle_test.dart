import 'package:flutter_test/flutter_test.dart';
import 'package:millionaire_mindset/models/mindset_principle.dart';

void main() {
  test('fromJson/toJson zijn elkaars inverse', () {
    const json = {
      'id': 'discipline-1',
      'title': 'Sta vroeg op',
      'category': 'discipline',
      'shortDescription': 'Begin de dag met een voorsprong.',
      'tips': ['Zet je wekker 30 minuten vroeger', 'Vermijd de snoozeknop'],
    };

    final principle = MindsetPrinciple.fromJson(json);

    expect(principle.id, 'discipline-1');
    expect(principle.title, 'Sta vroeg op');
    expect(principle.category, 'discipline');
    expect(principle.tips, hasLength(2));
    expect(principle.toJson(), json);
  });

  test('gooit een fout als een verplicht veld ontbreekt', () {
    const invalidJson = {'id': 'x', 'title': 'Titel'};

    expect(
      () => MindsetPrinciple.fromJson(invalidJson),
      throwsA(isA<TypeError>()),
    );
  });
}
