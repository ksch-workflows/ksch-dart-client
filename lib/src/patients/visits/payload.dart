import 'package:json_annotation/json_annotation.dart';

part 'payload.g.dart';

enum VisitType {
  OPD,
  IPD,
  PHYSIO_THERAPY,
}

@JsonSerializable()
class StartVisitPayload {

  final VisitType type;

  StartVisitPayload({required this.type});

  factory StartVisitPayload.fromJson(Map<String, dynamic> json) =>
      _$StartVisitPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$StartVisitPayloadToJson(this);
}

@JsonSerializable()
class VisitResponsePayload {
  @JsonKey(name: '_id')
  final String id;

  final VisitType type;

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
