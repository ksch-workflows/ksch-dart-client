import 'package:json_annotation/json_annotation.dart';

part 'payload.g.dart';

@JsonSerializable()
class HealthResponsePayload {
  final String status;

  HealthResponsePayload(this.status);

  factory HealthResponsePayload.fromJson(Map<String, dynamic> json) =>
      _$HealthResponsePayloadFromJson(json);

  Map<String, dynamic> toJson() => _$HealthResponsePayloadToJson(this);
}
