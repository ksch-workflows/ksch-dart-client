import 'package:json_annotation/json_annotation.dart';

part 'patient_payload.g.dart';

@JsonSerializable()
class PatientCreationPayload extends _BasePatientPayload {
  PatientCreationPayload({String? name}) : super(name: name);

  factory PatientCreationPayload.fromJson(Map<String, dynamic> json) => _$CreatePatientPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$CreatePatientPayloadToJson(this);
}

@JsonSerializable()
class PatientResponsePayload extends _BasePatientPayload {
  @JsonKey(name: '_id')
  final String id;

  @JsonKey(name: '_links')
  final Links links;

  PatientResponsePayload({
    required this.id,
    required this.links,
    required String? name,
  }) : super(
          name: name,
        );

  factory PatientResponsePayload.fromJson(Map<String, dynamic> json) => _$PatientResponsePayloadFromJson(json);

  Map<String, dynamic> toJson() => _$PatientResponsePayloadToJson(this);
}

@JsonSerializable()
class _BasePatientPayload {
  final String? name;

  _BasePatientPayload({
    required this.name,
  });

  factory _BasePatientPayload.fromJson(Map<String, dynamic> json) => _$_BasePatientPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$_BasePatientPayloadToJson(this);
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
