// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasePatientPayload _$BasePatientPayloadFromJson(Map<String, dynamic> json) {
  return BasePatientPayload(
    name: json['name'] as String?,
  );
}

Map<String, dynamic> _$BasePatientPayloadToJson(BasePatientPayload instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

PatientResponsePayload _$PatientResponsePayloadFromJson(
    Map<String, dynamic> json) {
  return PatientResponsePayload(
    id: json['_id'] as String,
    links: Links.fromJson(json['_links'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PatientResponsePayloadToJson(
        PatientResponsePayload instance) =>
    <String, dynamic>{
      '_id': instance.id,
      '_links': instance.links.toJson(),
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
