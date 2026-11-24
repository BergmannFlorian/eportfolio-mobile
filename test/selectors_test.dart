import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/data/models/experience.dart';
import 'package:portfolio/data/models/project.dart';
import 'package:portfolio/data/models/skills.dart';
import 'package:portfolio/data/selectors.dart';

ApiProject project(String id, {String? exp, int position = 0, bool featured = false}) =>
    ApiProject(id: id, name: id, experienceId: exp, position: position, featured: featured);

ApiExperience experience(String id, DateTime start, {List<String> projectIds = const []}) =>
    ApiExperience(
      id: id,
      kind: ExperienceKind.job,
      title: id,
      start: start,
      projectIds: projectIds,
    );

void main() {
  test('experiences sorted by most recent start', () {
    final sorted = sortedExperiences([
      experience('old', DateTime(2012)),
      experience('new', DateTime(2021)),
      experience('mid', DateTime(2019)),
    ]);
    expect(sorted.map((e) => e.id), ['new', 'mid', 'old']);
  });

  test('personal and client projects are split and sorted by position', () {
    final all = [
      project('c2', exp: 'a', position: 2),
      project('p2', position: 2),
      project('c1', exp: 'a', position: 1),
      project('p1', position: 1),
    ];
    expect(personalProjects(all).map((p) => p.id), ['p1', 'p2']);
    expect(clientProjects(all).map((p) => p.id), ['c1', 'c2']);
  });

  test('client groups follow the first position of each experience', () {
    final groups = clientProjectGroups(
      [
        project('w1', exp: 'work', position: 3),
        project('s1', exp: 'school', position: 5),
        project('i1', exp: 'iomedia', position: 1),
        project('i2', exp: 'iomedia', position: 2),
        project('w2', exp: 'work', position: 4),
      ],
      [experience('iomedia', DateTime(2021)), experience('work', DateTime(2020))],
    );
    expect(groups.map((g) => g.experienceId), ['iomedia', 'work', 'school']);
    expect(groups.first.projects.map((p) => p.id), ['i1', 'i2']);
    expect(groups.last.experience, isNull);
  });

  test('linked projects keep the experience order and skip unknown ids', () {
    final e = experience('x', DateTime(2021), projectIds: ['b', 'missing', 'a']);
    final linked = linkedProjects(e, [project('a'), project('b')]);
    expect(linked.map((p) => p.id), ['b', 'a']);
  });

  test('skills sorted top, mid, bottom; stable otherwise', () {
    final sorted = sortedSkills(const [
      Skill(name: 'b1', level: SkillLevel.bottom),
      Skill(name: 'm1', level: SkillLevel.mid),
      Skill(name: 't1', level: SkillLevel.top),
      Skill(name: 'm2', level: SkillLevel.mid),
    ]);
    expect(sorted.map((s) => s.name), ['t1', 'm1', 'm2', 'b1']);
  });
}
