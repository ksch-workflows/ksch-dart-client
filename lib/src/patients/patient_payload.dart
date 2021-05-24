import 'package:json_annotation/json_annotation.dart';

part 'patient_payload.g.dart';


class CreatePatientPayload {

}


@JsonSerializable()
class PatientResponsePayload {
  @JsonKey(name: '_id')
  final String id;

  @JsonKey(name: '_links')
  final Links links;

  PatientResponsePayload({
    required this.id,
    required this.links,
  });

  factory PatientResponsePayload.fromJson(Map<String, dynamic> json) => _$PatientFromJson(json);

  Map<String, dynamic> toJson() => _$PatientToJson(this);
}

@JsonSerializable()
class Links {

  final Link self;

  Links({required this.self});


  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);

  Map<String, dynamic> toJson() => _$LinksToJson(this);
}

@JsonSerializable()
class Link {
  final String href;

  Link({required this.href});

  factory Link.fromJson(Map<String, dynamic> json) => _$LinkFromJson(json);

  Map<String, dynamic> toJson() => _$LinkToJson(this);
}
