import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/resources.dart';

enum Resource { profile, experiences, projects, skills, certificates }

/// Refetches the given API resources in parallel.
Future<void> refreshResources(
  WidgetRef ref, [
  Iterable<Resource> resources = Resource.values,
]) async {
  await Future.wait<void>([
    for (final resource in resources)
      switch (resource) {
        Resource.profile => ref.read(profileProvider.notifier).refresh(),
        Resource.experiences =>
          ref.read(experiencesProvider.notifier).refresh(),
        Resource.projects => ref.read(projectsProvider.notifier).refresh(),
        Resource.skills => ref.read(skillsProvider.notifier).refresh(),
        Resource.certificates =>
          ref.read(certificatesProvider.notifier).refresh(),
      },
  ]);
}
