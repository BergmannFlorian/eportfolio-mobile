// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resources.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Profile)
final profileProvider = ProfileProvider._();

final class ProfileProvider
    extends $AsyncNotifierProvider<Profile, Cached<ApiProfile>> {
  ProfileProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profileProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$profileHash();

  @$internal
  @override
  Profile create() => Profile();
}

String _$profileHash() => r'0b027cf694dd9e86d4960a1fba433d39475aceab';

abstract class _$Profile extends $AsyncNotifier<Cached<ApiProfile>> {
  FutureOr<Cached<ApiProfile>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<Cached<ApiProfile>>, Cached<ApiProfile>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Cached<ApiProfile>>, Cached<ApiProfile>>,
              AsyncValue<Cached<ApiProfile>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(Experiences)
final experiencesProvider = ExperiencesProvider._();

final class ExperiencesProvider
    extends $AsyncNotifierProvider<Experiences, Cached<List<ApiExperience>>> {
  ExperiencesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'experiencesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$experiencesHash();

  @$internal
  @override
  Experiences create() => Experiences();
}

String _$experiencesHash() => r'c1fc7ab4134d4af2b1a5e115b85b77c4ed376eba';

abstract class _$Experiences
    extends $AsyncNotifier<Cached<List<ApiExperience>>> {
  FutureOr<Cached<List<ApiExperience>>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<Cached<List<ApiExperience>>>,
              Cached<List<ApiExperience>>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<Cached<List<ApiExperience>>>,
                Cached<List<ApiExperience>>
              >,
              AsyncValue<Cached<List<ApiExperience>>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(Projects)
final projectsProvider = ProjectsProvider._();

final class ProjectsProvider
    extends $AsyncNotifierProvider<Projects, Cached<List<ApiProject>>> {
  ProjectsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'projectsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$projectsHash();

  @$internal
  @override
  Projects create() => Projects();
}

String _$projectsHash() => r'd2fe2559cfc1ca479cd9ae5b1a31120c458f6c4c';

abstract class _$Projects extends $AsyncNotifier<Cached<List<ApiProject>>> {
  FutureOr<Cached<List<ApiProject>>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<Cached<List<ApiProject>>>,
              Cached<List<ApiProject>>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<Cached<List<ApiProject>>>,
                Cached<List<ApiProject>>
              >,
              AsyncValue<Cached<List<ApiProject>>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(Skills)
final skillsProvider = SkillsProvider._();

final class SkillsProvider
    extends $AsyncNotifierProvider<Skills, Cached<ApiSkills>> {
  SkillsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'skillsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$skillsHash();

  @$internal
  @override
  Skills create() => Skills();
}

String _$skillsHash() => r'55b4253d54db251596b98bb173c5efda3cb15ddc';

abstract class _$Skills extends $AsyncNotifier<Cached<ApiSkills>> {
  FutureOr<Cached<ApiSkills>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<Cached<ApiSkills>>, Cached<ApiSkills>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Cached<ApiSkills>>, Cached<ApiSkills>>,
              AsyncValue<Cached<ApiSkills>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(Certificates)
final certificatesProvider = CertificatesProvider._();

final class CertificatesProvider
    extends $AsyncNotifierProvider<Certificates, Cached<List<ApiCertificate>>> {
  CertificatesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'certificatesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$certificatesHash();

  @$internal
  @override
  Certificates create() => Certificates();
}

String _$certificatesHash() => r'ae5032b1067e9311f896e84c8a641d9d24988fee';

abstract class _$Certificates
    extends $AsyncNotifier<Cached<List<ApiCertificate>>> {
  FutureOr<Cached<List<ApiCertificate>>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<Cached<List<ApiCertificate>>>,
              Cached<List<ApiCertificate>>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<Cached<List<ApiCertificate>>>,
                Cached<List<ApiCertificate>>
              >,
              AsyncValue<Cached<List<ApiCertificate>>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
