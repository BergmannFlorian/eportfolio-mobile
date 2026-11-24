import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'cached_resource.dart';
import 'models/certificate.dart';
import 'models/experience.dart';
import 'models/profile.dart';
import 'models/project.dart';
import 'models/skills.dart';

part 'resources.g.dart';

// One notifier per API resource. Each one fetches the whole collection; the
// UI filters and sorts client-side, so there is a single cache entry per
// resource and language.

@Riverpod(keepAlive: true)
class Profile extends _$Profile with CachedResource<ApiProfile> {
  @override
  String get path => '/profile';

  @override
  ApiProfile decode(Object? json) => decodeObject(json, ApiProfile.fromJson);

  @override
  Future<Cached<ApiProfile>> build() => load();
}

@Riverpod(keepAlive: true)
class Experiences extends _$Experiences
    with CachedResource<List<ApiExperience>> {
  @override
  String get path => '/experiences';

  @override
  List<ApiExperience> decode(Object? json) =>
      decodeList(json, ApiExperience.fromJson);

  @override
  Future<Cached<List<ApiExperience>>> build() => load();
}

@Riverpod(keepAlive: true)
class Projects extends _$Projects with CachedResource<List<ApiProject>> {
  @override
  String get path => '/projects';

  @override
  List<ApiProject> decode(Object? json) => decodeList(json, ApiProject.fromJson);

  @override
  Future<Cached<List<ApiProject>>> build() => load();
}

@Riverpod(keepAlive: true)
class Skills extends _$Skills with CachedResource<ApiSkills> {
  @override
  String get path => '/skills';

  @override
  ApiSkills decode(Object? json) => decodeObject(json, ApiSkills.fromJson);

  @override
  Future<Cached<ApiSkills>> build() => load();
}

@Riverpod(keepAlive: true)
class Certificates extends _$Certificates
    with CachedResource<List<ApiCertificate>> {
  @override
  String get path => '/certificates';

  @override
  List<ApiCertificate> decode(Object? json) =>
      decodeList(json, ApiCertificate.fromJson);

  @override
  Future<Cached<List<ApiCertificate>>> build() => load();
}
