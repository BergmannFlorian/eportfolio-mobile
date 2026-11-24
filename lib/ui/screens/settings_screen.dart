import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_ui/material_ui.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../core/settings/settings.dart';
import '../../l10n/generated/app_localizations.dart';
import '../refresh.dart';
import '../theme/app_theme.dart';
import '../widgets/chrome.dart';
import '../widgets/common.dart';

const _websiteUrl = 'https://bergmann-florian.ch';

final _packageInfoProvider = FutureProvider<PackageInfo>(
  (ref) => PackageInfo.fromPlatform(),
);

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  bool _refreshing = false;

  Future<void> _refreshAll() async {
    setState(() => _refreshing = true);
    try {
      await refreshResources(ref);
    } finally {
      if (mounted) setState(() => _refreshing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final l10n = AppLocalizations.of(context);
    final settings = ref.watch(settingsProvider);
    final notifier = ref.read(settingsProvider.notifier);
    final systemLanguage = resolveLanguage(
      LanguagePreference.system,
      ref.watch(systemLocaleProvider),
    );
    final lastSync = ref.watch(lastSyncProvider);
    final version = ref.watch(_packageInfoProvider).value;
    final rowStyle = AppText.body(c.fgStrong);
    final hintStyle = AppText.mono(c.fgSubtle);

    return Scaffold(
      body: Column(
        children: [
          BackHeader(label: l10n.back),
          Expanded(
            child: ListView(
              // The header already handles the status bar inset.
              padding: EdgeInsets.only(
                bottom: MediaQuery.paddingOf(context).bottom,
              ),
              children: [
                ScreenTitle(
                  kicker: l10n.settingsKicker,
                  line1: l10n.settingsTitleLine1,
                  line2: l10n.settingsTitleLine2,
                  padding: const EdgeInsets.fromLTRB(20, 28, 20, 28),
                ),
                Section(
                  label: l10n.sectionLanguage,
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 28),
                  child: _RadioGroup<LanguagePreference>(
                    selected: settings.language,
                    onChanged: notifier.setLanguage,
                    options: [
                      (
                        LanguagePreference.system,
                        l10n.languageSystem,
                        systemLanguage.toUpperCase(),
                      ),
                      (LanguagePreference.fr, 'Français', 'FR'),
                      (LanguagePreference.en, 'English', 'EN'),
                    ],
                  ),
                ),
                Section(
                  label: l10n.sectionTheme,
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 28),
                  child: _RadioGroup<ThemeMode>(
                    selected: settings.themeMode,
                    onChanged: notifier.setThemeMode,
                    options: [
                      (ThemeMode.system, l10n.themeSystem, null),
                      (ThemeMode.light, l10n.themeLight, null),
                      (ThemeMode.dark, l10n.themeDark, null),
                    ],
                  ),
                ),
                Section(
                  label: l10n.sectionData,
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 28),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(height: 1, color: c.borderStrong),
                      LinkRow(
                        title: Text(l10n.lastSync, style: rowStyle),
                        trailing: Text(
                          lastSync == null
                              ? l10n.never
                              : DateFormat('dd.MM.yyyy · HH:mm').format(lastSync),
                          style: hintStyle,
                        ),
                      ),
                      const SizedBox(height: 12),
                      AppButton(
                        label: _refreshing ? l10n.refreshing : l10n.refreshNow,
                        style: AppButtonStyle.outline,
                        onPressed: _refreshing ? null : _refreshAll,
                      ),
                    ],
                  ),
                ),
                Section(
                  label: l10n.sectionAbout,
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 36),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(height: 1, color: c.borderStrong),
                      LinkRow(
                        title: Text(l10n.version, style: rowStyle),
                        trailing: Text(
                          version == null
                              ? ''
                              : '${version.version} (${version.buildNumber})',
                          style: hintStyle,
                        ),
                      ),
                      LinkRow(
                        isExternal: true,
                        title: Text(l10n.website, style: rowStyle),
                        subtitle: Text('bergmann-florian.ch', style: hintStyle),
                        onTap: () => openExternal(_websiteUrl),
                      ),
                      LinkRow(
                        title: Text(l10n.licenses, style: rowStyle),
                        onTap: () => showLicensePage(
                          context: context,
                          applicationName: l10n.appTitle,
                          applicationVersion: version?.version,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _RadioGroup<T> extends StatelessWidget {
  const _RadioGroup({
    required this.options,
    required this.selected,
    required this.onChanged,
  });

  final List<(T, String, String?)> options;
  final T selected;
  final ValueChanged<T> onChanged;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: c.borderStrong)),
      ),
      child: Column(
        children: [
          for (final (value, label, hint) in options)
            Semantics(
              checked: value == selected,
              inMutuallyExclusiveGroup: true,
              child: Pressable(
                onTap: () => onChanged(value),
                semanticLabel: label,
                builder: (context, pressed) {
                  final on = value == selected;
                  return Container(
                    constraints: const BoxConstraints(minHeight: 56),
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: c.border)),
                    ),
                    child: ExcludeSemantics(
                      child: Row(
                        children: [
                          Container(
                            width: 16,
                            height: 16,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(color: c.borderStrong),
                            ),
                            child: Container(
                              width: 8,
                              height: 8,
                              color: on
                                  ? c.accent
                                  : (pressed ? c.border : Colors.transparent),
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Text(label, style: AppText.body(c.fgStrong)),
                          ),
                          if (hint != null)
                            Text(hint, style: AppText.mono(c.fgSubtle)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
