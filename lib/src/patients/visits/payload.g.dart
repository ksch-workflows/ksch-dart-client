// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StartVisitPayload _$StartVisitPayloadFromJson(Map<String, dynamic> json) {
  return StartVisitPayload(
    type: json['type'] as String,
  );
}

Map<String, dynamic> _$StartVisitPayloadToJson(StartVisitPayload instance) =>
    <String, dynamic>{
      'type': instance.type,
    };

VisitResponsePayload _$VisitResponsePayloadFromJson(Map<String, dynamic> json) {
  return VisitResponsePayload(
    id: json['_id'] as String,
    type: json['type'] as String,
    opdNumber: json['opdNumber'] as String,
    timeStart: json['timeStart'] as String,
  );
}

Map<String, dynamic> _$VisitResponsePayloadToJson(
        VisitResponsePayload instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'type': instance.type,
      'opdNumber': instance.opdNumber,
      'timeStart': instance.timeStart,
    };
