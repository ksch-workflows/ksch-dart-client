// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HealthResponsePayload _$HealthResponsePayloadFromJson(
    Map<String, dynamic> json) {
  return HealthResponsePayload(
    json['status'] as String,
  );
}

Map<String, dynamic> _$HealthResponsePayloadToJson(
        HealthResponsePayload instance) =>
    <String, dynamic>{
      'status': instance.status,
    };
