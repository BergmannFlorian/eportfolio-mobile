import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';
import 'core/settings/settings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _registerFontLicenses();
  final prefs = await SharedPreferences.getInstance();
  runApp(
    ProviderScope(
      overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
      // Failures are surfaced to the user with a retry button instead.
      retry: (_, _) => null,
      child: const PortfolioApp(),
    ),
  );
}

/// The bundled fonts are under the SIL Open Font License, which must ship
/// with them: they appear in Settings › Licenses.
void _registerFontLicenses() {
  const fonts = {
    'Inter': 'assets/fonts/OFL-Inter.txt',
    'JetBrains Mono': 'assets/fonts/OFL-JetBrainsMono.txt',
    'Questrial': 'assets/fonts/OFL-Questrial.txt',
  };
  LicenseRegistry.addLicense(() async* {
    for (final MapEntry(key: name, value: path) in fonts.entries) {
      yield LicenseEntryWithLineBreaks([name], await rootBundle.loadString(path));
    }
  });
}
