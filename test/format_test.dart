import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:portfolio/core/settings/settings.dart';
import 'package:portfolio/data/models/experience.dart';
import 'package:portfolio/l10n/generated/app_localizations.dart';
import 'package:portfolio/ui/format.dart';
import 'package:material_ui/material_ui.dart' show Locale;

void main() {
  final fr = lookupAppLocalizations(const Locale('fr'));
  final en = lookupAppLocalizations(const Locale('en'));

  setUpAll(() => initializeDateFormatting());

  final iomedia = ApiExperience(
    id: 'job',
    kind: ExperienceKind.job,
    title: 'Web developer',
    start: DateTime(2021, 12, 1),
    end: DateTime(2024, 7, 31),
  );

  test('months are counted inclusively', () {
    expect(monthsBetween(DateTime(2021, 12), DateTime(2024, 7)), 32);
    expect(monthsBetween(DateTime(2024, 1), DateTime(2024, 1)), 1);
  });

  test('duration in both languages', () {
    expect(duration(iomedia, fr), '2 ans 8 mois');
    expect(duration(iomedia, en), '2 years 8 months');
  });

  test('ongoing experience counts up to now', () {
    final ongoing = iomedia.copyWith(end: null);
    expect(shortPeriod(ongoing, fr), 'depuis 12.2021');
    expect(duration(ongoing, en, now: DateTime(2022, 1, 15)), '2 months');
  });

  test('short period', () {
    expect(shortPeriod(iomedia, fr), '12.2021 — 07.2024');
  });

  test('normalizes CRLF line breaks', () {
    expect(normalizeNewlines('A\r\n(b)\r\n'), 'A\n(b)');
  });

  test('language resolution falls back to French', () {
    expect(resolveLanguage(LanguagePreference.system, const Locale('de')), 'fr');
    expect(resolveLanguage(LanguagePreference.system, const Locale('en', 'GB')), 'en');
    expect(resolveLanguage(LanguagePreference.en, const Locale('fr')), 'en');
  });
}
