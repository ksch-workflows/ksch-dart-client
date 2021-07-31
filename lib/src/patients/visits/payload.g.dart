// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StartVisitPayload _$StartVisitPayloadFromJson(Map<String, dynamic> json) {
  return StartVisitPayload(
    type: _$enumDecode(_$VisitTypeEnumMap, json['type']),
  );
}

Map<String, dynamic> _$StartVisitPayloadToJson(StartVisitPayload instance) =>
    <String, dynamic>{
      'type': _$VisitTypeEnumMap[instance.type],
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$VisitTypeEnumMap = {
  VisitType.OPD: 'OPD',
};

VisitResponsePayload _$VisitResponsePayloadFromJson(Map<String, dynamic> json) {
  return VisitResponsePayload(
    id: json['_id'] as String,
    type: _$enumDecode(_$VisitTypeEnumMap, json['type']),
    opdNumber: json['opdNumber'] as String,
    timeStart: json['timeStart'] as String,
  );
}

Map<String, dynamic> _$VisitResponsePayloadToJson(
        VisitResponsePayload instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'type': _$VisitTypeEnumMap[instance.type],
      'opdNumber': instance.opdNumber,
      'timeStart': instance.timeStart,
    };
