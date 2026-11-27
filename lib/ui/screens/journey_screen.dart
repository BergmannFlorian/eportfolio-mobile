import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../data/models/experience.dart';
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
import '../widgets/resource_view.dart';
import '../widgets/segmented.dart';

class JourneyScreen extends ConsumerStatefulWidget {
  const JourneyScreen({super.key});

  @override
  ConsumerState<JourneyScreen> createState() => _JourneyScreenState();
}

class _JourneyScreenState extends ConsumerState<JourneyScreen> {
  /// `null` shows every experience.
  ExperienceKind? _filter;

  @override
  Widget build(BuildContext context) {
    final experiences = ref.watch(experiencesProvider);
    final l10n = AppLocalizations.of(context);
    return Column(
      children: [
        const BrandHeader(),
        Expanded(
          child: ResourceView(
            values: [experiences],
            onRefresh: () => refreshResources(ref, [Resource.experiences]),
            builder: (context) {
              final items = sortedExperiences(
                experiences.requireValue.data,
              ).where((e) => _filter == null || e.kind == _filter).toList();
              return ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: [
                  ScreenTitle(
                    kicker: l10n.journeyKicker,
                    line1: l10n.journeyTitleLine1,
                    line2: l10n.journeyTitleLine2,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
                    child: SegmentedFilter<ExperienceKind?>(
                      semanticLabel: l10n.filterLabel,
                      selected: _filter,
                      onChanged: (value) => setState(() => _filter = value),
                      options: [
                        (null, l10n.filterAll),
                        (ExperienceKind.job, l10n.filterJobs),
                        (ExperienceKind.education, l10n.filterEducation),
                      ],
                    ),
                  ),
                  for (final (i, e) in items.indexed)
                    _TimelineItem(experience: e, isLast: i == items.length - 1),
                  const SizedBox(height: 32),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

class _TimelineItem extends StatelessWidget {
  const _TimelineItem({required this.experience, required this.isLast});

  final ApiExperience experience;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final l10n = AppLocalizations.of(context);
    final e = experience;
    final subtitle = experienceSubtitle(e);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              width: 9,
              child: Column(
                children: [
                  const SizedBox(height: 22),
                  Container(
                    width: 9,
                    height: 9,
                    decoration: BoxDecoration(
                      color: e.kind == ExperienceKind.job
                          ? c.borderStrong
                          : c.bg,
                      border: Border.all(color: c.borderStrong),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: 1,
                      color: isLast ? Colors.transparent : c.border,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Pressable(
                isLink: true,
                onTap: () => context.go('/journey/${e.id}'),
                builder: (context, pressed) => Container(
                  padding: const EdgeInsets.fromLTRB(0, 16, 0, 18),
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: c.border)),
                  ),
                  child: Opacity(
                    opacity: pressed ? 0.6 : 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                shortPeriod(e, l10n),
                                style: AppText.mono(c.fgSubtle),
                              ),
                            ),
                            MonoBadge(experienceKindLabel(l10n, e.kind)),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    e.title,
                                    style: AppText.heading(c.fgStrong),
                                  ),
                                  if (subtitle != null) ...[
                                    const SizedBox(height: 4),
                                    Text(
                                      subtitle,
                                      style: AppText.body(c.fgMuted, size: 14),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                            const SizedBox(width: 12),
                            // Fixed-size box: safe inside IntrinsicHeight.
                            OrgLogo(
                              path: e.organizationLogo,
                              name: e.organization ?? e.title,
                            ),
                          ],
                        ),
                      ],
                    ),
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
