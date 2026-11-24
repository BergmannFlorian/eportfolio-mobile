import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../data/models/experience.dart';
import '../../data/models/project.dart';
import '../../data/resources.dart';
import '../../data/selectors.dart';
import '../../l10n/generated/app_localizations.dart';
import '../format.dart';
import '../labels.dart';
import '../refresh.dart';
import '../theme/app_theme.dart';
import '../widgets/chrome.dart';
import '../widgets/common.dart';
import '../widgets/resource_view.dart';
import 'not_found.dart';

class ExperienceScreen extends ConsumerWidget {
  const ExperienceScreen({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final experiences = ref.watch(experiencesProvider);
    final projects = ref.watch(projectsProvider);
    final l10n = AppLocalizations.of(context);
    return Column(
      children: [
        BackHeader(label: l10n.tabJourney, fallbackLocation: '/journey'),
        Expanded(
          child: ResourceView(
            values: [experiences, projects],
            onRefresh: () => refreshResources(ref, [
              Resource.experiences,
              Resource.projects,
            ]),
            builder: (context) {
              final experience = experiences.requireValue.data
                  .where((e) => e.id == id)
                  .firstOrNull;
              if (experience == null) return const NotFoundView();
              return _ExperienceContent(
                experience: experience,
                projects: linkedProjects(
                  experience,
                  projects.requireValue.data,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _ExperienceContent extends StatelessWidget {
  const _ExperienceContent({required this.experience, required this.projects});

  final ApiExperience experience;
  final List<ApiProject> projects;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final l10n = AppLocalizations.of(context);
    final e = experience;
    final second = e.organization ?? e.degree;
    final degreeLine = e.organization != null ? e.degree : null;

    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 28, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Kicker(experienceKindLabel(l10n, e.kind)),
              const SizedBox(height: 12),
              TwoLineTitle(e.title, second, size: 32),
              if (degreeLine != null) ...[
                const SizedBox(height: 10),
                Text(degreeLine, style: AppText.body(c.fgMuted)),
              ],
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 28),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: c.borderStrong),
              bottom: BorderSide(color: c.border),
            ),
          ),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: _Meta(
                    label: l10n.labelPeriod,
                    value: longPeriod(e, l10n),
                  ),
                ),
                Container(width: 1, color: c.border),
                Expanded(
                  child: _Meta(
                    label: l10n.labelDuration,
                    value: duration(e, l10n),
                    leftPadding: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (e.tasks.isNotEmpty)
          Section(label: l10n.sectionTasks, child: NumberedList(e.tasks)),
        if (e.skills.isNotEmpty)
          Section(
            label: '${l10n.sectionTech} · ${e.skills.length}',
            child: ChipWrap(e.skills),
          ),
        if (projects.isNotEmpty)
          Section(
            label: '${l10n.sectionLinkedProjects} · ${projects.length}',
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: c.borderStrong)),
              ),
              child: Column(
                children: [
                  for (final (i, p) in projects.indexed)
                    LinkRow(
                      minHeight: 56,
                      leading: SizedBox(
                        width: 20,
                        child: Text(
                          twoDigits(i + 1),
                          style: AppText.mono(c.fgSubtle),
                        ),
                      ),
                      title: Text(
                        p.name,
                        style: AppText.heading(c.fgStrong, size: 17),
                      ),
                      subtitle: p.tasks.isEmpty
                          ? null
                          : Text(
                              p.tasks.first,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppText.body(c.fgSubtle, size: 13),
                            ),
                      onTap: () => context.go('/projects/${p.id}'),
                    ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

class _Meta extends StatelessWidget {
  const _Meta({required this.label, required this.value, this.leftPadding = 0});

  final String label;
  final String value;
  final double leftPadding;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Padding(
      padding: EdgeInsets.fromLTRB(leftPadding, 12, 12, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label.toUpperCase(),
            style: AppText.mono(c.fgSubtle, size: 11, letterSpacing: 0.8),
          ),
          const SizedBox(height: 6),
          Text(value, style: AppText.body(c.fgStrong, size: 14)),
        ],
      ),
    );
  }
}
