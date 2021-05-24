// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patients_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientsReponsePayload _$PatientsReponsePayloadFromJson(
    Map<String, dynamic> json) {
  return PatientsReponsePayload(
    embedded: Embedded.fromJson(json['_embedded'] as Map<String, dynamic>),
    page: Page.fromJson(json['page'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PatientsReponsePayloadToJson(
        PatientsReponsePayload instance) =>
    <String, dynamic>{
      '_embedded': instance.embedded.toJson(),
      'page': instance.page.toJson(),
    };

Embedded _$EmbeddedFromJson(Map<String, dynamic> json) {
  return Embedded(
    patientModelList: (json['patientModelList'] as List<dynamic>)
        .map((e) => PatientResponsePayload.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$EmbeddedToJson(Embedded instance) => <String, dynamic>{
      'patientModelList':
          instance.patientModelList.map((e) => e.toJson()).toList(),
    };

Page _$PageFromJson(Map<String, dynamic> json) {
  return Page(
    size: json['size'] as int,
    totalElements: json['totalElements'] as int,
    totalPages: json['totalPages'] as int,
    number: json['number'] as int,
  );
}

Map<String, dynamic> _$PageToJson(Page instance) => <String, dynamic>{
      'size': instance.size,
      'totalElements': instance.totalElements,
      'totalPages': instance.totalPages,
      'number': instance.number,
    };
