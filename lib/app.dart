import 'package:cupertino_ui/cupertino_ui.dart' show GlobalCupertinoLocalizations;
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart'
    show GlobalWidgetsLocalizations;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import 'core/settings/settings.dart';
import 'l10n/generated/app_localizations.dart';
import 'ui/router.dart';
import 'ui/theme/app_theme.dart';

class PortfolioApp extends ConsumerStatefulWidget {
  const PortfolioApp({super.key});

  @override
  ConsumerState<PortfolioApp> createState() => _PortfolioAppState();
}

class _PortfolioAppState extends ConsumerState<PortfolioApp>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  /// Follows system language changes while the app runs.
  @override
  void didChangeLocales(List<Locale>? locales) {
    if (locales != null && locales.isNotEmpty) {
      ref.read(systemLocaleProvider.notifier).update(locales.first);
    }
  }

  @override
  Widget build(BuildContext context) {
    final language = ref.watch(appLanguageProvider);
    final themeMode = ref.watch(settingsProvider.select((s) => s.themeMode));
    return MaterialApp.router(
      routerConfig: ref.watch(routerProvider),
      onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: themeMode,
      locale: Locale(language),
      supportedLocales: AppLocalizations.supportedLocales,
      // Not AppLocalizations.localizationsDelegates: gen-l10n still lists the
      // deprecated flutter_localizations delegates, while Material and
      // Cupertino now ship theirs in material_ui and cupertino_ui.
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      builder: (context, child) {
        final theme = Theme.of(context);
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: AppTheme.overlayStyle(
            theme.brightness,
            theme.scaffoldBackgroundColor,
          ),
          child: child!,
        );
      },
    );
  }
}
