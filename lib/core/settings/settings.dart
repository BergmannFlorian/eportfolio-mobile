import 'dart:ui' show Locale, PlatformDispatcher;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart' show ThemeMode;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings.g.dart';

/// Languages the API and the app support. The first one is the fallback.
const supportedLanguages = ['fr', 'en'];

enum LanguagePreference { system, fr, en }

class AppSettings {
  const AppSettings({
    this.language = LanguagePreference.system,
    this.themeMode = ThemeMode.system,
  });

  final LanguagePreference language;
  final ThemeMode themeMode;

  AppSettings copyWith({LanguagePreference? language, ThemeMode? themeMode}) =>
      AppSettings(
        language: language ?? this.language,
        themeMode: themeMode ?? this.themeMode,
      );
}

/// Overridden in `main()` with the instance loaded before `runApp`.
@Riverpod(keepAlive: true)
SharedPreferences sharedPreferences(Ref ref) =>
    throw UnimplementedError('sharedPreferencesProvider must be overridden');

/// User preferences, persisted in shared preferences.
@Riverpod(keepAlive: true)
class Settings extends _$Settings {
  static const _languageKey = 'settings.language';
  static const _themeKey = 'settings.theme';

  SharedPreferences get _prefs => ref.read(sharedPreferencesProvider);

  @override
  AppSettings build() {
    final prefs = ref.watch(sharedPreferencesProvider);
    return AppSettings(
      language: LanguagePreference.values.asNameMap()[prefs.getString(_languageKey)] ??
          LanguagePreference.system,
      themeMode: ThemeMode.values.asNameMap()[prefs.getString(_themeKey)] ??
          ThemeMode.system,
    );
  }

  Future<void> setLanguage(LanguagePreference language) async {
    state = state.copyWith(language: language);
    await _prefs.setString(_languageKey, language.name);
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    state = state.copyWith(themeMode: mode);
    await _prefs.setString(_themeKey, mode.name);
  }
}

/// The device locale. The app widget updates it when the system locale changes.
@Riverpod(keepAlive: true)
class SystemLocale extends _$SystemLocale {
  @override
  Locale build() => PlatformDispatcher.instance.locale;

  void update(Locale locale) => state = locale;
}

/// Resolves a language preference to an API language code (`fr` or `en`).
String resolveLanguage(LanguagePreference preference, Locale systemLocale) {
  return switch (preference) {
    LanguagePreference.fr => 'fr',
    LanguagePreference.en => 'en',
    LanguagePreference.system =>
      supportedLanguages.contains(systemLocale.languageCode)
          ? systemLocale.languageCode
          : supportedLanguages.first,
  };
}

/// The language used for the UI and passed to the API as `?lang=`.
@Riverpod(keepAlive: true)
String appLanguage(Ref ref) {
  final preference = ref.watch(settingsProvider.select((s) => s.language));
  return resolveLanguage(preference, ref.watch(systemLocaleProvider));
}

/// When the app last fetched data successfully from the API.
@Riverpod(keepAlive: true)
class LastSync extends _$LastSync {
  static const _key = 'sync.last';

  @override
  DateTime? build() {
    final raw = ref.watch(sharedPreferencesProvider).getString(_key);
    return raw == null ? null : DateTime.tryParse(raw)?.toLocal();
  }

  Future<void> mark(DateTime at) async {
    if (state != null && !at.isAfter(state!)) return;
    state = at;
    await ref
        .read(sharedPreferencesProvider)
        .setString(_key, at.toUtc().toIso8601String());
  }
}
