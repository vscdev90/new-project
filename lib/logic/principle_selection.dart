import '../models/mindset_principle.dart';

/// Filters [principles] by [query] matching against title or category
/// (case-insensitive substring match). An empty/blank query returns the
/// full list unfiltered.
List<MindsetPrinciple> filterPrinciples(
  List<MindsetPrinciple> principles,
  String query,
) {
  final normalizedQuery = query.trim().toLowerCase();
  if (normalizedQuery.isEmpty) {
    return principles;
  }

  return principles
      .where(
        (principle) =>
            principle.title.toLowerCase().contains(normalizedQuery) ||
            principle.category.toLowerCase().contains(normalizedQuery),
      )
      .toList();
}

/// Picks a "tip of the day" from [principles]: the same principle is
/// returned for every call on the same calendar day, deterministically
/// based on the day of the year, so it changes daily without needing any
/// stored state. Returns null if [principles] is empty.
MindsetPrinciple? tipOfTheDay(
  List<MindsetPrinciple> principles,
  DateTime date,
) {
  if (principles.isEmpty) {
    return null;
  }

  final index = _dayOfYear(date) % principles.length;
  return principles[index];
}

int _dayOfYear(DateTime date) {
  final startOfYear = DateTime(date.year, 1, 1);
  return DateTime(date.year, date.month, date.day)
          .difference(startOfYear)
          .inDays +
      1;
}
