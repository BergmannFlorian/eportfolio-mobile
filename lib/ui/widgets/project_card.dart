import 'package:material_ui/material_ui.dart';

import '../../data/models/project.dart';
import '../../l10n/generated/app_localizations.dart';
import '../labels.dart';
import '../theme/app_theme.dart';
import 'common.dart';

/// Grid card: number, ↗ when the project has a URL, name, meta and chips.
/// Switches to the inverse palette while pressed.
class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,
    required this.number,
    required this.project,
    required this.onTap,
    this.meta,
    this.maxChips = 0,
    this.minHeight = 148,
  });

  final int number;
  final ApiProject project;
  final VoidCallback onTap;
  final String? meta;
  final int maxChips;
  final double minHeight;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final l10n = AppLocalizations.of(context);
    final chips = project.skills.take(maxChips).toList();
    return Pressable(
      onTap: onTap,
      isLink: true,
      semanticLabel: [project.name, ?meta].join(', '),
      builder: (context, pressed) {
        final strong = pressed ? c.inverseFg : c.fgStrong;
        final subtle = pressed ? c.inverseSubtle : c.fgSubtle;
        return Container(
          constraints: BoxConstraints(minHeight: minHeight),
          color: pressed ? c.inverse : c.surface,
          padding: const EdgeInsets.all(14),
          child: ExcludeSemantics(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(twoDigits(number), style: AppText.mono(subtle)),
                    const Spacer(),
                    if (project.url != null)
                      Semantics(
                        label: l10n.externalLink,
                        child: Text('↗', style: AppText.mono(strong)),
                      ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(project.name, style: AppText.heading(strong, size: 18)),
                if (meta != null) ...[
                  const SizedBox(height: 10),
                  Text(
                    meta!.toUpperCase(),
                    style: AppText.mono(subtle, size: 10, letterSpacing: 0.6),
                  ),
                ],
                if (chips.isNotEmpty) ...[
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 4,
                    runSpacing: 4,
                    children: [
                      for (final chip in chips)
                        TechChip(
                          chip,
                          small: true,
                          textColor: pressed ? c.inverseFg : null,
                          borderColor: pressed ? c.inverseSubtle : null,
                        ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}

/// Last cell of a featured grid: inverse "see all" link.
class SeeAllCell extends StatelessWidget {
  const SeeAllCell({
    super.key,
    required this.countLabel,
    required this.label,
    required this.onTap,
  });

  final String countLabel;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Pressable(
      onTap: onTap,
      isLink: true,
      semanticLabel: label,
      builder: (context, pressed) => Container(
        constraints: const BoxConstraints(minHeight: 148),
        color: pressed ? c.accent : c.inverse,
        padding: const EdgeInsets.all(14),
        child: ExcludeSemantics(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                countLabel,
                style: AppText.mono(pressed ? c.accentFg : c.inverseSubtle),
              ),
              const SizedBox(height: 16),
              Text(
                label,
                style: AppText.heading(
                  pressed ? c.accentFg : c.inverseFg,
                  size: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// "Website · 2026" for personal projects.
String? personalProjectMeta(AppLocalizations l10n, ApiProject p) {
  final parts = [
    if (p.kind case final kind?) projectKindLabel(l10n, kind),
    if (p.year case final year?) '$year',
  ];
  return parts.isEmpty ? null : parts.join(' · ');
}
