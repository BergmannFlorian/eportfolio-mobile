import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../data/models/experience.dart';
import '../../data/models/project.dart';
import '../../data/resources.dart';
import '../../l10n/generated/app_localizations.dart';
import '../format.dart';
import '../refresh.dart';
import '../theme/app_theme.dart';
import '../widgets/chrome.dart';
import '../widgets/common.dart';
import '../widgets/resource_view.dart';
import 'not_found.dart';
import 'projects_screen.dart';

class ProjectScreen extends ConsumerWidget {
  const ProjectScreen({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projects = ref.watch(projectsProvider);
    final experiences = ref.watch(experiencesProvider);
    final l10n = AppLocalizations.of(context);
    return Column(
      children: [
        BackHeader(label: l10n.tabProjects, fallbackLocation: '/projects'),
        Expanded(
          child: ResourceView(
            values: [projects, experiences],
            onRefresh: () => refreshResources(ref, [
              Resource.projects,
              Resource.experiences,
            ]),
            builder: (context) {
              final project = projects.requireValue.data
                  .where((p) => p.id == id)
                  .firstOrNull;
              if (project == null) return const NotFoundView();
              final experience = experiences.requireValue.data
                  .where((e) => e.id == project.experienceId)
                  .firstOrNull;
              return _ProjectContent(project: project, experience: experience);
            },
          ),
        ),
      ],
    );
  }
}

class _ProjectContent extends StatelessWidget {
  const _ProjectContent({required this.project, required this.experience});

  final ApiProject project;
  final ApiExperience? experience;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final l10n = AppLocalizations.of(context);
    final p = project;
    final kicker = p.isPersonal
        ? l10n.projectPersonalKicker(twoDigits(p.position))
        : experience?.organization ?? experience?.title;

    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 28, 20, 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (kicker != null) ...[
                Kicker(kicker),
                const SizedBox(height: 14),
              ],
              TwoLineTitle(p.name, null),
              ProjectBadges(project: p, topSpacing: 14),
              for (final paragraph in p.tasks) ...[
                const SizedBox(height: 14),
                Text(paragraph, style: AppText.body(c.fgMuted)),
              ],
              if (p.url case final url?) ...[
                const SizedBox(height: 22),
                AppButton(
                  label: '${l10n.visitWebsite} ↗',
                  onPressed: () => openExternal(url),
                ),
              ],
            ],
          ),
        ),
        if (p.details.isNotEmpty)
          Section(
            label: l10n.sectionHighlights,
            child: NumberedList(p.details, topBorder: true),
          ),
        if (p.skills.isNotEmpty)
          Section(label: l10n.sectionTech, child: ChipWrap(p.skills)),
        if (p.snippet case final snippet?)
          Section(label: l10n.sectionUsage, child: _Snippet(snippet)),
        Section(
          label: l10n.sectionContext,
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: c.borderStrong)),
            ),
            child: experience == null
                ? LinkRow(
                    title: Text(
                      l10n.personalProject,
                      style: AppText.body(c.fgStrong),
                    ),
                  )
                : LinkRow(
                    title: Text(
                      experience!.title,
                      style: AppText.heading(c.fgStrong, size: 17),
                    ),
                    subtitle: Text(
                      [
                        ?experience!.organization,
                        shortPeriod(experience!, l10n),
                      ].join(' · '),
                      style: AppText.mono(c.fgSubtle, size: 11),
                    ),
                    onTap: () => context.go('/journey/${experience!.id}'),
                  ),
          ),
        ),
      ],
    );
  }
}

/// Inverse code block with a copy button.
class _Snippet extends StatefulWidget {
  const _Snippet(this.command);

  final String command;

  @override
  State<_Snippet> createState() => _SnippetState();
}

class _SnippetState extends State<_Snippet> {
  bool _copied = false;
  Timer? _reset;

  Future<void> _copy() async {
    await Clipboard.setData(ClipboardData(text: widget.command));
    if (!mounted) return;
    setState(() => _copied = true);
    _reset?.cancel();
    _reset = Timer(const Duration(seconds: 2), () {
      if (mounted) setState(() => _copied = false);
    });
  }

  @override
  void dispose() {
    _reset?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final l10n = AppLocalizations.of(context);
    return Container(
      color: c.inverse,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(14),
                child: SelectableText.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: r'$ ',
                        style: TextStyle(color: c.inverseSubtle),
                      ),
                      TextSpan(text: widget.command),
                    ],
                  ),
                  style: AppText.mono(c.inverseFg, size: 13),
                ),
              ),
            ),
            Container(width: 1, color: c.inverseSubtle),
            Pressable(
              onTap: _copy,
              semanticLabel: l10n.copyCommand,
              builder: (context, pressed) => Container(
                width: 76,
                alignment: Alignment.center,
                color: pressed ? c.accent : null,
                child: Text(
                  (_copied ? l10n.copied : l10n.copy).toUpperCase(),
                  style: AppText.mono(
                    pressed ? c.accentFg : c.inverseFg,
                    size: 11,
                    letterSpacing: 0.6,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
