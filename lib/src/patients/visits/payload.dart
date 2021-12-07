import 'package:json_annotation/json_annotation.dart';

part 'payload.g.dart';

enum VisitType {
  OPD,
  IPD,
  EMERGENCY,
  PHYSIO_THERAPY,
}

extension Name on String {
  static final Map<VisitType, String> _names = {
    VisitType.OPD: 'OPD',
    VisitType.IPD: 'IPD',
    VisitType.EMERGENCY: 'Emergency',
    VisitType.PHYSIO_THERAPY: 'Physio therapy',
  };

  static String of(VisitType key) {
    if (_names.keys.length != VisitType.values.length) {
      throw 'Visit type name configuration is incomplete';
    }
    return _names[key]!;
  }
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

  final DateTime timeStart;

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
