import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/data/cached_resource.dart';
import 'package:portfolio/data/models/certificate.dart';
import 'package:portfolio/data/models/experience.dart';
import 'package:portfolio/data/models/profile.dart';
import 'package:portfolio/data/models/project.dart';
import 'package:portfolio/data/models/skills.dart';

import 'helpers.dart';

void main() {
  group('real API fixtures decode', () {
    test('profile', () {
      final p = decodeObject(loadFixture('profile'), ApiProfile.fromJson);
      expect(p.name, isNotEmpty);
      expect(p.email, contains('@'));
      expect(p.languages, isNotEmpty);
    });

    test('experiences', () {
      final list = decodeList(loadFixture('experiences'), ApiExperience.fromJson);
      expect(list, isNotEmpty);
      expect(list.map((e) => e.kind), contains(ExperienceKind.education));
      final iomedia = list.firstWhere((e) => e.id == 'job-iomedia-sa-2021-12');
      expect(iomedia.start, DateTime(2021, 12, 1));
      expect(iomedia.end, DateTime(2024, 7, 31));
      expect(iomedia.degree, isNull);
    });

    test('projects', () {
      final list = decodeList(loadFixture('projects'), ApiProject.fromJson);
      expect(list, isNotEmpty);
      final ambition = list.firstWhere((p) => p.id == 'ambition-tools');
      expect(ambition.isPersonal, isTrue);
      expect(ambition.kind, ProjectKind.script);
      expect(ambition.status, ProjectStatus.inProgress);
      expect(ambition.snippet, isNotNull);
      expect(ambition.position, greaterThan(0));
    });

    test('skills', () {
      final skills = decodeObject(loadFixture('skills'), ApiSkills.fromJson);
      expect(skills.stack, isNotEmpty);
      final all = skills.categories.expand((c) => c.skills);
      expect(all.map((s) => s.level), contains(SkillLevel.top));
      expect(all.any((s) => s.personalOnly), isTrue);
    });

    test('certificates', () {
      final list = decodeList(loadFixture('certificates'), ApiCertificate.fromJson);
      expect(list, isNotEmpty);
      expect(list.any((c) => c.url == null), isTrue);
    });
  });

  group('robustness', () {
    test('unknown project kind/status become null', () {
      final p = ApiProject.fromJson({
        'id': 'x',
        'name': 'X',
        'kind': 'game',
        'status': 'paused',
      });
      expect(p.kind, isNull);
      expect(p.status, isNull);
      expect(p.tasks, isEmpty);
    });

    test('missing personalOnly defaults to false', () {
      final s = Skill.fromJson({'name': 'Dart', 'level': 'mid'});
      expect(s.personalOnly, isFalse);
    });

    test('decodeList rejects a non-array body', () {
      expect(
        () => decodeList(<String, Object?>{'error': null}, ApiProject.fromJson),
        throwsFormatException,
      );
    });
  });
}
