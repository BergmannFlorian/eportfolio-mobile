import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../l10n/generated/app_localizations.dart';
import '../theme/app_theme.dart';
import 'common.dart';
import 'line_icon.dart';

/// Top bar of the tab screens: monogram, name and settings button.
class BrandHeader extends StatelessWidget {
  const BrandHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final l10n = AppLocalizations.of(context);
    return _HeaderFrame(
      padding: const EdgeInsets.only(left: 20, right: 8),
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: c.borderStrong),
            ),
            child: ExcludeSemantics(
              child: Text(
                'FB',
                style: AppText.mono(
                  c.fgStrong,
                  size: 11,
                  weight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              l10n.appTitle,
              style: AppText.heading(c.fgStrong, size: 17),
            ),
          ),
          Pressable(
            onTap: () => context.push('/settings'),
            semanticLabel: l10n.settingsTooltip,
            builder: (context, pressed) => SizedBox(
              width: 48,
              height: 48,
              child: Center(
                child: LineIcon(
                  LineIconKind.settings,
                  color: pressed ? c.accent : c.fgStrong,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Top bar of pushed screens: back arrow and the parent screen's name.
class BackHeader extends StatelessWidget {
  const BackHeader({super.key, required this.label, this.fallbackLocation});

  final String label;

  /// Where to go when there is nothing to pop (deep link).
  final String? fallbackLocation;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final l10n = AppLocalizations.of(context);
    return _HeaderFrame(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          Pressable(
            onTap: () {
              if (context.canPop()) {
                context.pop();
              } else {
                context.go(fallbackLocation ?? '/');
              }
            },
            semanticLabel: '${l10n.back} · $label',
            builder: (context, pressed) => Container(
              height: 48,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  LineIcon(
                    LineIconKind.back,
                    size: 18,
                    color: pressed ? c.accent : c.fgStrong,
                  ),
                  const SizedBox(width: 8),
                  ExcludeSemantics(
                    child: Text(
                      label,
                      style: AppText.mono(pressed ? c.accent : c.fgStrong, size: 13),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderFrame extends StatelessWidget {
  const _HeaderFrame({required this.child, required this.padding});

  final Widget child;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: c.bg,
        border: Border(bottom: BorderSide(color: c.border)),
      ),
      child: SafeArea(
        bottom: false,
        child: Container(height: 56, padding: padding, child: child),
      ),
    );
  }
}

/// Bottom navigation: 4 tabs, accent bar on top of the active one.
class AppTabBar extends StatelessWidget {
  const AppTabBar({
    super.key,
    required this.currentIndex,
    required this.onSelect,
  });

  final int currentIndex;
  final ValueChanged<int> onSelect;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final l10n = AppLocalizations.of(context);
    final tabs = [
      (LineIconKind.home, l10n.tabHome),
      (LineIconKind.journey, l10n.tabJourney),
      (LineIconKind.projects, l10n.tabProjects),
      (LineIconKind.profile, l10n.tabProfile),
    ];
    return DecoratedBox(
      decoration: BoxDecoration(
        color: c.bg,
        border: Border(top: BorderSide(color: c.border)),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 62,
          child: Row(
            children: [
              for (final (i, (icon, label)) in tabs.indexed)
                Expanded(
                  child: _TabItem(
                    icon: icon,
                    label: label,
                    selected: i == currentIndex,
                    onTap: () => onSelect(i),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TabItem extends StatelessWidget {
  const _TabItem({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final LineIconKind icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Semantics(
      selected: selected,
      child: Pressable(
        onTap: onTap,
        builder: (context, pressed) {
          final color = selected || pressed ? c.fgStrong : c.fgSubtle;
          return DecoratedBox(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: selected ? c.accent : Colors.transparent,
                  width: 2,
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LineIcon(icon, color: color),
                const SizedBox(height: 4),
                Text(
                  label,
                  style: AppText.body(
                    color,
                    size: 11,
                    weight: selected ? FontWeight.w600 : FontWeight.w500,
                  ).copyWith(height: 1.2),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
