// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientsReponsePayload _$PatientsReponsePayloadFromJson(
    Map<String, dynamic> json) {
  return PatientsReponsePayload(
    embedded: _Embedded.fromJson(json['_embedded'] as Map<String, dynamic>),
    page: Page.fromJson(json['page'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PatientsReponsePayloadToJson(
        PatientsReponsePayload instance) =>
    <String, dynamic>{
      '_embedded': instance.embedded.toJson(),
      'page': instance.page.toJson(),
    };

_Embedded _$_EmbeddedFromJson(Map<String, dynamic> json) {
  return _Embedded(
    patientModelList: (json['patientModelList'] as List<dynamic>)
        .map((e) => PatientResponsePayload.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_EmbeddedToJson(_Embedded instance) => <String, dynamic>{
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
    links: Links.fromJson(json['_links'] as Map<String, dynamic>),
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

Links _$LinksFromJson(Map<String, dynamic> json) {
  return Links(
    self: Link.fromJson(json['self'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LinksToJson(Links instance) => <String, dynamic>{
      'self': instance.self.toJson(),
    };

Link _$LinkFromJson(Map<String, dynamic> json) {
  return Link(
    href: json['href'] as String,
  );
}

Map<String, dynamic> _$LinkToJson(Link instance) => <String, dynamic>{
      'href': instance.href,
    };
