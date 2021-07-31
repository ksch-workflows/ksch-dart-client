import 'package:json_annotation/json_annotation.dart';

part 'payload.g.dart';

@JsonSerializable()
class AddressPayload {
  final String residentialAddress;

  AddressPayload(this.residentialAddress);

  factory AddressPayload.fromJson(Map<String, dynamic> json) =>
      _$AddressPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$AddressPayloadToJson(this);
}
