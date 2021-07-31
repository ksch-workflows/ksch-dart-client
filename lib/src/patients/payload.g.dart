// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientsResponsePayload _$PatientsResponsePayloadFromJson(
    Map<String, dynamic> json) {
  return PatientsResponsePayload(
    embedded: json['_embedded'] == null
        ? null
        : _Embedded.fromJson(json['_embedded'] as Map<String, dynamic>),
    page: Page.fromJson(json['page'] as Map<String, dynamic>),
    links: PageLinks.fromJson(json['_links'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PatientsResponsePayloadToJson(
        PatientsResponsePayload instance) =>
    <String, dynamic>{
      '_embedded': instance.embedded?.toJson(),
      '_links': instance.links.toJson(),
      'page': instance.page.toJson(),
    };

_Embedded _$_EmbeddedFromJson(Map<String, dynamic> json) {
  return _Embedded(
    patientResourceList: (json['patientResourceList'] as List<dynamic>)
        .map((e) => PatientResponsePayload.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_EmbeddedToJson(_Embedded instance) => <String, dynamic>{
      'patientResourceList':
          instance.patientResourceList.map((e) => e.toJson()).toList(),
    };

CreatePatientRequestPayload _$CreatePatientRequestPayloadFromJson(
    Map<String, dynamic> json) {
  return CreatePatientRequestPayload(
    name: json['name'] as String?,
    residentialAddress: json['residentialAddress'] as String?,
  );
}

Map<String, dynamic> _$CreatePatientRequestPayloadToJson(
        CreatePatientRequestPayload instance) =>
    <String, dynamic>{
      'name': instance.name,
      'residentialAddress': instance.residentialAddress,
    };

PatientResponsePayload _$PatientResponsePayloadFromJson(
    Map<String, dynamic> json) {
  return PatientResponsePayload(
    id: json['_id'] as String,
    links: _Links.fromJson(json['_links'] as Map<String, dynamic>),
    name: json['name'] as String?,
    residentialAddress: json['residentialAddress'] as String?,
  );
}

Map<String, dynamic> _$PatientResponsePayloadToJson(
        PatientResponsePayload instance) =>
    <String, dynamic>{
      'name': instance.name,
      'residentialAddress': instance.residentialAddress,
      '_id': instance.id,
      '_links': instance.links.toJson(),
    };

_BasePatientPayload _$_BasePatientPayloadFromJson(Map<String, dynamic> json) {
  return _BasePatientPayload(
    name: json['name'] as String?,
    residentialAddress: json['residentialAddress'] as String?,
  );
}

Map<String, dynamic> _$_BasePatientPayloadToJson(
        _BasePatientPayload instance) =>
    <String, dynamic>{
      'name': instance.name,
      'residentialAddress': instance.residentialAddress,
    };

_Links _$_LinksFromJson(Map<String, dynamic> json) {
  return _Links(
    self: Link.fromJson(json['self'] as Map<String, dynamic>),
    startVisit: json['start-visit'] == null
        ? null
        : Link.fromJson(json['start-visit'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_LinksToJson(_Links instance) => <String, dynamic>{
      'self': instance.self.toJson(),
      'start-visit': instance.startVisit?.toJson(),
    };
