// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'certificate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ApiCertificate _$ApiCertificateFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_ApiCertificate', json, ($checkedConvert) {
      final val = _ApiCertificate(
        title: $checkedConvert('title', (v) => v as String),
        date: $checkedConvert('date', (v) => DateTime.parse(v as String)),
        url: $checkedConvert('url', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$ApiCertificateToJson(_ApiCertificate instance) =>
    <String, dynamic>{
      'title': instance.title,
      'date': instance.date.toIso8601String(),
      'url': instance.url,
    };
