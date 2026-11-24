import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../data/models/certificate.dart';
import '../../data/models/profile.dart';
import '../../data/models/skills.dart';
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

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileProvider);
    final skills = ref.watch(skillsProvider);
    final certificates = ref.watch(certificatesProvider);
    return Column(
      children: [
        const BrandHeader(),
        Expanded(
          child: ResourceView(
            values: [profile, skills, certificates],
            onRefresh: () => refreshResources(ref, [
              Resource.profile,
              Resource.skills,
              Resource.certificates,
            ]),
            builder: (context) => _ProfileContent(
              profile: profile.requireValue.data,
              skills: skills.requireValue.data,
              certificates: certificates.requireValue.data,
            ),
          ),
        ),
      ],
    );
  }
}

class _ProfileContent extends StatelessWidget {
  const _ProfileContent({
    required this.profile,
    required this.skills,
    required this.certificates,
  });

  final ApiProfile profile;
  final ApiSkills skills;
  final List<ApiCertificate> certificates;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final l10n = AppLocalizations.of(context);
    final p = profile;
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 32, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Kicker(l10n.profileKicker),
              const SizedBox(height: 14),
              Semantics(
                header: true,
                child: Text(p.name, style: AppText.display(c.fgStrong)),
              ),
              const SizedBox(height: 6),
              Text(
                normalizeNewlines(p.title),
                style: AppText.display(c.fgSubtle, size: 22),
              ),
              const SizedBox(height: 16),
              Text(p.about, style: AppText.body(c.fgMuted)),
            ],
          ),
        ),
        if (p.facts.isNotEmpty)
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
            child: BorderedGrid(
              children: [
                for (final fact in p.facts)
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          fact.label.toUpperCase(),
                          style: AppText.mono(
                            c.fgSubtle,
                            size: 10,
                            letterSpacing: 0.8,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(fact.value, style: AppText.body(c.fgStrong, size: 14)),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        if (skills.categories.isNotEmpty)
          Section(
            label: l10n.sectionSkills,
            child: _Skills(categories: skills.categories),
          ),
        if (certificates.isNotEmpty)
          Section(
            label: l10n.sectionCertificates,
            child: _TopBorder(
              child: Column(
                children: [
                  for (final cert in certificates)
                    LinkRow(
                      minHeight: 64,
                      isExternal: true,
                      title: Text(cert.title, style: AppText.body(c.fgStrong)),
                      subtitle: Text(
                        dayMonthYear(cert.date),
                        style: AppText.mono(c.fgSubtle),
                      ),
                      onTap: cert.url == null
                          ? null
                          : () => openExternal(cert.url!),
                    ),
                ],
              ),
            ),
          ),
        if (p.languages.isNotEmpty)
          Section(
            label: l10n.sectionLanguages,
            child: Column(
              children: [
                for (final language in p.languages)
                  _LanguageBar(language: language),
              ],
            ),
          ),
        if (p.hobbies.isNotEmpty)
          Section(
            label: l10n.sectionHobbies,
            child: BorderedGrid(
              children: [
                for (final (i, hobby) in p.hobbies.indexed)
                  Container(
                    color: c.surface,
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(twoDigits(i + 1), style: AppText.mono(c.fgSubtle)),
                        const SizedBox(height: 6),
                        Text(hobby.name, style: AppText.heading(c.fgStrong, size: 17)),
                        const SizedBox(height: 4),
                        Text(hobby.reason, style: AppText.body(c.fgMuted, size: 13)),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        Section(
          label: l10n.sectionContact,
          child: _TopBorder(
            child: Column(
              children: [
                LinkRow(
                  isExternal: true,
                  title: Text(p.email, style: AppText.mono(c.fgStrong, size: 13)),
                  onTap: () => openExternal('mailto:${p.email}'),
                ),
                for (final social in p.socials)
                  LinkRow(
                    isExternal: true,
                    title: Text(
                      networkLabel(social.network),
                      style: AppText.mono(c.fgStrong, size: 13),
                    ),
                    onTap: () => openExternal(social.url),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _TopBorder extends StatelessWidget {
  const _TopBorder({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) => DecoratedBox(
    decoration: BoxDecoration(
      border: Border(top: BorderSide(color: context.colors.borderStrong)),
    ),
    child: child,
  );
}

class _Skills extends StatelessWidget {
  const _Skills({required this.categories});

  final List<SkillCategory> categories;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final l10n = AppLocalizations.of(context);
    final hasPersonalOnly = categories.any(
      (cat) => cat.skills.any((s) => s.personalOnly),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Wrap(
          spacing: 14,
          runSpacing: 8,
          children: [
            for (final level in SkillLevel.values)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 12,
                    height: 12,
                    child: _SkillChipFrame(level: level),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    skillLevelLabel(l10n, level),
                    style: AppText.mono(c.fgSubtle, size: 11),
                  ),
                ],
              ),
            if (hasPersonalOnly)
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: '* ', style: TextStyle(color: c.accent)),
                    TextSpan(text: l10n.personalOnlyLegend),
                  ],
                ),
                style: AppText.mono(c.fgSubtle, size: 11),
              ),
          ],
        ),
        for (final category in categories)
          Container(
            margin: const EdgeInsets.only(top: 14),
            padding: const EdgeInsets.only(top: 14),
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: c.border)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(category.name, style: AppText.heading(c.fgStrong, size: 18)),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: [
                    for (final skill in sortedSkills(category.skills))
                      _SkillChip(skill: skill),
                  ],
                ),
              ],
            ),
          ),
      ],
    );
  }
}

/// Recency drives the chip style: filled (top), solid (mid), dashed (bottom).
class _SkillChip extends StatelessWidget {
  const _SkillChip({required this.skill});

  final Skill skill;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final l10n = AppLocalizations.of(context);
    final (fg, border, bg, dashed) = switch (skill.level) {
      SkillLevel.top => (c.inverseFg, c.inverse, c.inverse, false),
      SkillLevel.mid => (c.fg, c.borderStrong, null, false),
      SkillLevel.bottom => (c.fgSubtle, c.fgSubtle, null, true),
    };
    final semantics = [
      skill.name,
      skillLevelLabel(l10n, skill.level),
      if (skill.personalOnly) l10n.personalOnlyLegend,
    ].join(', ');
    return Semantics(
      label: semantics,
      excludeSemantics: true,
      child: TechChip(
        skill.name,
        textColor: fg,
        borderColor: border,
        background: bg,
        dashed: dashed,
        suffix: skill.personalOnly
            ? TextSpan(
                text: '*',
                style: TextStyle(
                  color: skill.level == SkillLevel.top ? c.inverseFg : c.accent,
                ),
              )
            : null,
      ),
    );
  }
}

class _SkillChipFrame extends StatelessWidget {
  const _SkillChipFrame({required this.level});

  final SkillLevel level;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return switch (level) {
      SkillLevel.top => ColoredBox(color: c.borderStrong),
      SkillLevel.mid => DecoratedBox(
        decoration: BoxDecoration(border: Border.all(color: c.borderStrong)),
      ),
      SkillLevel.bottom => CustomPaint(painter: DashedBorderPainter(c.fgSubtle)),
    };
  }
}

class _LanguageBar extends StatelessWidget {
  const _LanguageBar({required this.language});

  final SpokenLanguage language;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final fraction = (language.percent / 100).clamp(0.0, 1.0);
    return Semantics(
      label: '${language.name}, ${language.level}',
      excludeSemantics: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Expanded(
                  child: Text(language.name, style: AppText.body(c.fgStrong)),
                ),
                Text(language.level, style: AppText.mono(c.fgSubtle)),
              ],
            ),
            const SizedBox(height: 8),
            Container(
              height: 4,
              color: c.border,
              alignment: Alignment.centerLeft,
              child: FractionallySizedBox(
                widthFactor: fraction,
                child: Container(color: c.accent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
