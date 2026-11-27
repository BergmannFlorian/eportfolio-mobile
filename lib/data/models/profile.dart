import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

/// `GET /profile`: contact, bio, facts, spoken languages and hobbies.
@freezed
abstract class ApiProfile with _$ApiProfile {
  const factory ApiProfile({
    required String name,
    required String email,
    required String city,
    required int age,
    required String headline,
    required String bio,
    required String about,
    required String title,

    /// Portrait, cropped 4:5. `url` is a site-relative `/media/…` path.
    ProfilePhoto? photo,
    @Default(<Social>[]) List<Social> socials,
    @Default(<Fact>[]) List<Fact> facts,
    @Default(<SpokenLanguage>[]) List<SpokenLanguage> languages,
    @Default(<Hobby>[]) List<Hobby> hobbies,
  }) = _ApiProfile;

  factory ApiProfile.fromJson(Map<String, Object?> json) =>
      _$ApiProfileFromJson(json);
}

@freezed
abstract class ProfilePhoto with _$ProfilePhoto {
  const factory ProfilePhoto({required String url, @Default('') String alt}) =
      _ProfilePhoto;

  factory ProfilePhoto.fromJson(Map<String, Object?> json) =>
      _$ProfilePhotoFromJson(json);
}

@freezed
abstract class Social with _$Social {
  const factory Social({required String network, required String url}) =
      _Social;

  factory Social.fromJson(Map<String, Object?> json) => _$SocialFromJson(json);
}

@freezed
abstract class Fact with _$Fact {
  const factory Fact({required String label, required String value}) = _Fact;

  factory Fact.fromJson(Map<String, Object?> json) => _$FactFromJson(json);
}

@freezed
abstract class SpokenLanguage with _$SpokenLanguage {
  const factory SpokenLanguage({
    required String name,
    required String level,
    required int percent,
  }) = _SpokenLanguage;

  factory SpokenLanguage.fromJson(Map<String, Object?> json) =>
      _$SpokenLanguageFromJson(json);
}

@freezed
abstract class Hobby with _$Hobby {
  const factory Hobby({required String name, required String reason}) = _Hobby;

  factory Hobby.fromJson(Map<String, Object?> json) => _$HobbyFromJson(json);
}
