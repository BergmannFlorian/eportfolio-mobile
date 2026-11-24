import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../data/models/experience.dart';
import '../../data/models/profile.dart';
import '../../data/models/project.dart';
import '../../data/models/skills.dart';
import '../../data/resources.dart';
import '../../data/selectors.dart';
import '../../l10n/generated/app_localizations.dart';
import '../labels.dart';
import '../refresh.dart';
import '../theme/app_theme.dart';
import '../widgets/chrome.dart';
import '../widgets/common.dart';
import '../widgets/project_card.dart';
import '../widgets/resource_view.dart';

/// Featured cards shown per block before the "see all" cell.
const _featuredPerBlock = 3;

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  static const _resources = [
    Resource.profile,
    Resource.skills,
    Resource.projects,
    Resource.experiences,
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileProvider);
    final skills = ref.watch(skillsProvider);
    final projects = ref.watch(projectsProvider);
    final experiences = ref.watch(experiencesProvider);
    return Column(
      children: [
        const BrandHeader(),
        Expanded(
          child: ResourceView(
            values: [profile, skills, projects, experiences],
            onRefresh: () => refreshResources(ref, _resources),
            builder: (context) => _HomeContent(
              profile: profile.requireValue.data,
              skills: skills.requireValue.data,
              projects: projects.requireValue.data,
              experiences: experiences.requireValue.data,
            ),
          ),
        ),
      ],
    );
  }
}

class _HomeContent extends StatelessWidget {
  const _HomeContent({
    required this.profile,
    required this.skills,
    required this.projects,
    required this.experiences,
  });

  final ApiProfile profile;
  final ApiSkills skills;
  final List<ApiProject> projects;
  final List<ApiExperience> experiences;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final l10n = AppLocalizations.of(context);
    final headline = profile.headline.split(' · ');
    final personal = personalProjects(projects);
    final client = clientProjects(projects);
    final experienceById = {for (final e in experiences) e.id: e};

    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 32, 20, 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Kicker(l10n.homeKicker),
              const SizedBox(height: 14),
              TwoLineTitle(
                headline.first,
                headline.length > 1 ? headline.skip(1).join(' · ') : null,
              ),
              const SizedBox(height: 18),
              Text(profile.bio, style: AppText.body(c.fgMuted)),
              const SizedBox(height: 22),
              Row(
                children: [
                  Expanded(
                    child: AppButton(
                      label: l10n.homeContactMe,
                      onPressed: () => openExternal('mailto:${profile.email}'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: AppButton(
                      label: l10n.homeSeeProjects,
                      style: AppButtonStyle.outline,
                      onPressed: () => context.go('/projects'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        if (skills.stack.isNotEmpty)
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.homeStack.toUpperCase(),
                  style: AppText.kicker(c.fgSubtle),
                ),
                const SizedBox(height: 12),
                ChipWrap(skills.stack),
              ],
            ),
          ),
        _FeaturedBlock(
          kicker: l10n.homePersonalKicker,
          line1: l10n.personalTitleLine1,
          line2: l10n.personalTitleLine2,
          projects: featured(personal),
          total: personal.length,
          seeAllLabel: l10n.seeAllPersonal,
          seeAllLocation: '/projects?group=personal',
          metaOf: (p) => personalProjectMeta(l10n, p),
        ),
        _FeaturedBlock(
          kicker: l10n.homeClientKicker,
          line1: l10n.clientTitleLine1,
          line2: l10n.clientTitleLine2,
          projects: featured(client),
          total: client.length,
          seeAllLabel: l10n.seeAllClient,
          seeAllLocation: '/projects?group=client',
          metaOf: (p) => experienceById[p.experienceId]?.organization,
        ),
        _ContactBlock(profile: profile),
      ],
    );
  }
}

class _FeaturedBlock extends StatelessWidget {
  const _FeaturedBlock({
    required this.kicker,
    required this.line1,
    required this.line2,
    required this.projects,
    required this.total,
    required this.seeAllLabel,
    required this.seeAllLocation,
    required this.metaOf,
  });

  final String kicker;
  final String line1;
  final String line2;
  final List<ApiProject> projects;
  final int total;
  final String seeAllLabel;
  final String seeAllLocation;
  final String? Function(ApiProject) metaOf;

  @override
  Widget build(BuildContext context) {
    if (total == 0) return const SizedBox.shrink();
    final c = context.colors;
    final l10n = AppLocalizations.of(context);
    final shown = projects.take(_featuredPerBlock).toList();
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 32, 20, 32),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: c.border)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Kicker(kicker),
          const SizedBox(height: 10),
          TwoLineTitle(line1, line2, size: 28),
          const SizedBox(height: 20),
          BorderedGrid(
            children: [
              for (final (i, project) in shown.indexed)
                ProjectCard(
                  number: i + 1,
                  project: project,
                  meta: metaOf(project),
                  onTap: () => context.go('/projects/${project.id}'),
                ),
              SeeAllCell(
                countLabel: l10n.projectCount(total),
                label: seeAllLabel,
                onTap: () => context.go(seeAllLocation),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ContactBlock extends StatelessWidget {
  const _ContactBlock({required this.profile});

  final ApiProfile profile;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final l10n = AppLocalizations.of(context);
    final rowStyle = AppText.mono(c.inverseFg, size: 13);
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 8, 20, 32),
      padding: const EdgeInsets.fromLTRB(22, 28, 22, 20),
      color: c.inverse,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Kicker(l10n.contactKicker, color: c.inverseSubtle),
          const SizedBox(height: 14),
          TwoLineTitle(
            l10n.contactTitleLine1,
            l10n.contactTitleLine2,
            size: 28,
            color: c.inverseFg,
            secondColor: c.inverseSubtle,
          ),
          const SizedBox(height: 18),
          Container(height: 1, color: c.inverseSubtle),
          LinkRow(
            inverse: true,
            isExternal: true,
            minHeight: 48,
            title: Text(profile.email, style: rowStyle),
            onTap: () => openExternal('mailto:${profile.email}'),
          ),
          for (final social in profile.socials)
            LinkRow(
              inverse: true,
              isExternal: true,
              minHeight: 48,
              title: Text(networkLabel(social.network), style: rowStyle),
              onTap: () => openExternal(social.url),
            ),
        ],
      ),
    );
  }
}
