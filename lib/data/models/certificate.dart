import 'package:freezed_annotation/freezed_annotation.dart';

part 'certificate.freezed.dart';
part 'certificate.g.dart';

/// `GET /certificates`.
@freezed
abstract class ApiCertificate with _$ApiCertificate {
  const factory ApiCertificate({
    required String title,
    required DateTime date,
    String? url,
  }) = _ApiCertificate;

  factory ApiCertificate.fromJson(Map<String, Object?> json) =>
      _$ApiCertificateFromJson(json);
}
