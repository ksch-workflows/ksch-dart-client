import 'package:json_annotation/json_annotation.dart';

part 'payload.g.dart';

@JsonSerializable()
class StartVisitPayload {

  // TODO Use enum for visit type
  final String type;

  StartVisitPayload({required this.type});

  factory StartVisitPayload.fromJson(Map<String, dynamic> json) =>
      _$StartVisitPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$StartVisitPayloadToJson(this);
}

@JsonSerializable()
class VisitResponsePayload {
  @JsonKey(name: '_id')
  final String id;

  // TODO parse enum
  final String type;

  final String opdNumber;

  // TODO parse date
  final String timeStart;

  VisitResponsePayload({
    required this.id,
    required this.type,
    required this.opdNumber,
    required this.timeStart,
  });

  factory VisitResponsePayload.fromJson(Map<String, dynamic> json) =>
      _$VisitResponsePayloadFromJson(json);

  Map<String, dynamic> toJson() => _$VisitResponsePayloadToJson(this);
}
