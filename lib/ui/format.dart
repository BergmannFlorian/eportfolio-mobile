import 'package:intl/intl.dart';

import '../data/models/experience.dart';
import '../l10n/generated/app_localizations.dart';

/// `12.2021`
String monthYear(DateTime date) => DateFormat('MM.yyyy').format(date);

/// `14.03.2025`
String dayMonthYear(DateTime date) => DateFormat('dd.MM.yyyy').format(date);

/// `12.2021 — 07.2024`, or `since 12.2021` when ongoing.
String shortPeriod(ApiExperience e, AppLocalizations l10n) {
  final end = e.end;
  return end == null
      ? l10n.periodSince(monthYear(e.start))
      : '${monthYear(e.start)} — ${monthYear(end)}';
}

/// `déc. 2021 – juil. 2024` in the UI language.
String longPeriod(ApiExperience e, AppLocalizations l10n) {
  final format = DateFormat.yMMM(l10n.localeName);
  final end = e.end;
  return '${format.format(e.start)} – ${end == null ? l10n.periodToday : format.format(end)}';
}

/// Number of calendar months covered, both ends included (min. 1).
int monthsBetween(DateTime start, DateTime end) {
  final months = (end.year - start.year) * 12 + end.month - start.month + 1;
  return months < 1 ? 1 : months;
}

/// `2 ans 8 mois`, counted up to today when ongoing.
String duration(ApiExperience e, AppLocalizations l10n, {DateTime? now}) {
  final total = monthsBetween(e.start, e.end ?? now ?? DateTime.now());
  final years = total ~/ 12;
  final months = total % 12;
  return [
    if (years > 0) l10n.durationYears(years),
    if (months > 0) l10n.durationMonths(months),
  ].join(' ');
}

/// The API sends `\r\n` in some fields: keep plain `\n` line breaks.
String normalizeNewlines(String text) =>
    text.replaceAll('\r\n', '\n').replaceAll('\r', '\n').trim();
