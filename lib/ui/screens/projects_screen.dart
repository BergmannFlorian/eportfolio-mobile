import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

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
import '../widgets/media_image.dart';
import '../widgets/project_card.dart';
import '../widgets/resource_view.dart';

enum ProjectGroupTab { personal, client }

/// Two swipeable pages, personal and client projects, behind sub-tabs.
class ProjectsScreen extends ConsumerStatefulWidget {
  const ProjectsScreen({super.key, this.group = ProjectGroupTab.personal});

  /// Page to show, from the `?group=` query parameter.
  final ProjectGroupTab group;

  @override
  ConsumerState<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends ConsumerState<ProjectsScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabs = TabController(
    length: ProjectGroupTab.values.length,
    vsync: this,
    initialIndex: widget.group.index,
  )..addListener(() => setState(() {}));

  @override
  void didUpdateWidget(ProjectsScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.group != oldWidget.group) _tabs.animateTo(widget.group.index);
  }

  @override
  void dispose() {
    _tabs.dispose();
    super.dispose();
  }

  Future<void> _refresh() =>
      refreshResources(ref, [Resource.projects, Resource.experiences]);

  @override
  Widget build(BuildContext context) {
    final projects = ref.watch(projectsProvider);
    final experiences = ref.watch(experiencesProvider);
    final l10n = AppLocalizations.of(context);
    return Column(
      children: [
        const BrandHeader(),
        Expanded(
          child: ResourceView(
            values: [projects, experiences],
            onRefresh: _refresh,
            pullToRefresh: false,
            builder: (context) {
              final all = projects.requireValue.data;
              final personal = personalProjects(all);
              final groups = clientProjectGroups(
                all,
                experiences.requireValue.data,
              );
              final clientCount = groups.fold(
                0,
                (sum, g) => sum + g.projects.length,
              );
              return Column(
                children: [
                  _SubTabs(
                    controller: _tabs,
                    semanticLabel: l10n.projectGroupsLabel,
                    labels: [
                      (l10n.tabPersonal, personal.length),
                      (l10n.tabClient, clientCount),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabs,
                      children: [
                        PullToRefresh(
                          onRefresh: _refresh,
                          child: _PersonalPage(projects: personal),
                        ),
                        PullToRefresh(
                          onRefresh: _refresh,
                          child: _ClientPage(groups: groups),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

class _SubTabs extends StatelessWidget {
  const _SubTabs({
    required this.controller,
    required this.labels,
    required this.semanticLabel,
  });

  final TabController controller;
  final List<(String, int)> labels;
  final String semanticLabel;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Semantics(
      label: semanticLabel,
      container: true,
      child: Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: c.border)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (final (i, (label, count)) in labels.indexed)
              Expanded(
                child: Semantics(
                  selected: controller.index == i,
                  inMutuallyExclusiveGroup: true,
                  child: Pressable(
                    onTap: () => controller.animateTo(i),
                    builder: (context, pressed) {
                      final on = controller.index == i;
                      return Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: on ? c.accent : Colors.transparent,
                              width: 2,
                            ),
                          ),
                        ),
                        child: Text.rich(
                          TextSpan(
                            text: label.toUpperCase(),
                            children: [
                              TextSpan(
                                text: '  $count',
                                style: TextStyle(color: c.fgSubtle),
                              ),
                            ],
                          ),
                          style: AppText.mono(
                            on || pressed ? c.fgStrong : c.fgSubtle,
                            letterSpacing: 0.7,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _PersonalPage extends StatelessWidget {
  const _PersonalPage({required this.projects});

  final List<ApiProject> projects;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final l10n = AppLocalizations.of(context);
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      children: [
        ScreenTitle(
          kicker: l10n.projectsKicker,
          line1: l10n.personalTitleLine1,
          line2: l10n.personalTitleLine2,
          padding: const EdgeInsets.fromLTRB(20, 28, 20, 20),
        ),
        if (projects.isEmpty)
          _Empty(text: l10n.noProjects)
        else
          Container(
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 32),
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: c.borderStrong)),
            ),
            child: Column(
              children: [
                for (final (i, p) in projects.indexed)
                  _PersonalProjectRow(number: i + 1, project: p),
              ],
            ),
          ),
      ],
    );
  }
}

class _PersonalProjectRow extends StatelessWidget {
  const _PersonalProjectRow({required this.number, required this.project});

  final int number;
  final ApiProject project;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final p = project;
    return Pressable(
      isLink: true,
      semanticLabel: p.name,
      onTap: () => context.go('/projects/${p.id}'),
      builder: (context, pressed) => Container(
        padding: const EdgeInsets.fromLTRB(0, 18, 0, 20),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: c.border)),
        ),
        child: Opacity(
          opacity: pressed ? 0.6 : 1,
          child: ExcludeSemantics(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(twoDigits(number), style: AppText.mono(c.fgSubtle)),
                    const Spacer(),
                    if (p.url != null)
                      Text('↗', style: AppText.mono(c.fgStrong)),
                  ],
                ),
                if (p.image != null) ...[
                  const SizedBox(height: 12),
                  ProjectImage(project: p),
                ],
                const SizedBox(height: 10),
                Text(p.name, style: AppText.heading(c.fgStrong, size: 22)),
                ProjectBadges(project: p, topSpacing: 10),
                if (p.tasks.isNotEmpty) ...[
                  const SizedBox(height: 10),
                  Text(
                    p.tasks.first,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: AppText.body(c.fgMuted, size: 14),
                  ),
                ],
                if (p.skills.isNotEmpty) ...[
                  const SizedBox(height: 10),
                  ChipWrap(p.skills, small: true),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// The project image in its 16:10 frame, grayscale like on the website.
/// Renders nothing when the project has no image.
class ProjectImage extends StatelessWidget {
  const ProjectImage({super.key, required this.project});

  final ApiProject project;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    if (project.image == null) return const SizedBox.shrink();
    return AspectRatio(
      aspectRatio: 16 / 10,
      child: DecoratedBox(
        position: DecorationPosition.foreground,
        decoration: BoxDecoration(border: Border.all(color: c.border)),
        child: MediaImage(
          path: project.image,
          grayscale: true,
          semanticLabel: project.imageAlt,
          fallback: ColoredBox(color: c.surface),
        ),
      ),
    );
  }
}

/// Kind, status, year and hosting badges; each only when set.
class ProjectBadges extends StatelessWidget {
  const ProjectBadges({super.key, required this.project, this.topSpacing = 0});

  final ApiProject project;
  final double topSpacing;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final p = project;
    final badges = [
      if (p.kind case final kind?)
        MonoBadge(projectKindLabel(l10n, kind), style: BadgeStyle.filled),
      if (p.status case final status?)
        MonoBadge(
          projectStatusLabel(l10n, status),
          style: BadgeStyle.outlined,
          dot: status == ProjectStatus.online,
        ),
      if (p.year case final year?) MonoBadge('$year'),
      if (p.hosting case final hosting?) MonoBadge(hosting),
    ];
    if (badges.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: EdgeInsets.only(top: topSpacing),
      child: Wrap(spacing: 6, runSpacing: 6, children: badges),
    );
  }
}

class _ClientPage extends StatelessWidget {
  const _ClientPage({required this.groups});

  final List<ProjectGroup> groups;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    var number = 0;
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      children: [
        ScreenTitle(
          kicker: l10n.projectsKicker,
          line1: l10n.clientTitleLine1,
          line2: l10n.clientTitleLine2,
          padding: const EdgeInsets.fromLTRB(20, 28, 20, 20),
        ),
        if (groups.isEmpty) _Empty(text: l10n.noProjects),
        for (final group in groups)
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _GroupHeader(group: group),
                const SizedBox(height: 10),
                BorderedGrid(
                  children: [
                    for (final p in group.projects)
                      ProjectCard(
                        number: ++number,
                        project: p,
                        maxChips: 2,
                        minHeight: 136,
                        onTap: () => context.go('/projects/${p.id}'),
                      ),
                  ],
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class _GroupHeader extends StatelessWidget {
  const _GroupHeader({required this.group});

  final ProjectGroup group;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final l10n = AppLocalizations.of(context);
    final e = group.experience;
    final title = e == null ? group.experienceId : (e.organization ?? e.title);
    final meta = e == null
        ? null
        : '${experienceKindLabel(l10n, e.kind)} · ${shortPeriod(e, l10n)}';
    return LinkRow(
      minHeight: 48,
      leading: e == null
          ? null
          : OrgLogo(path: e.organizationLogo, name: title, size: 36),
      title: Text(title, style: AppText.heading(c.fgStrong)),
      subtitle: meta == null
          ? null
          : Text(meta, style: AppText.mono(c.fgSubtle, size: 11)),
      onTap: e == null ? null : () => context.go('/journey/${e.id}'),
    );
  }
}

class _Empty extends StatelessWidget {
  const _Empty({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
      child: Text(text, style: AppText.body(context.colors.fgSubtle)),
    );
  }
}
