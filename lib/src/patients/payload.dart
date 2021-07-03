import 'package:json_annotation/json_annotation.dart';

part './payload.g.dart';

@JsonSerializable()
class PatientsReponsePayload {
  @JsonKey(name: '_embedded')
  final _Embedded embedded;

  final Page page;

  List<PatientResponsePayload> get patients {
    return embedded.patientModelList;
  }

  PatientsReponsePayload({
    required this.embedded,
    required this.page,
  });

  factory PatientsReponsePayload.fromJson(Map<String, dynamic> json) =>
      _$PatientsReponsePayloadFromJson(json);

  Map<String, dynamic> toJson() => _$PatientsReponsePayloadToJson(this);
}

@JsonSerializable()
class _Embedded {
  final List<PatientResponsePayload> patientModelList;

  _Embedded({required this.patientModelList});

  factory _Embedded.fromJson(Map<String, dynamic> json) =>
      _$_EmbeddedFromJson(json);

  Map<String, dynamic> toJson() => _$_EmbeddedToJson(this);
}

@JsonSerializable()
class Page {
  final int size;
  final int totalElements;
  final int totalPages;
  final int number;

  Page({
    required this.size,
    required this.totalElements,
    required this.totalPages,
    required this.number,
  });

  factory Page.fromJson(Map<String, dynamic> json) => _$PageFromJson(json);

  Map<String, dynamic> toJson() => _$PageToJson(this);
}

@JsonSerializable()
class CreatePatientRequestPayload extends _BasePatientPayload {
  CreatePatientRequestPayload({
    String? name,
    String? residentialAddress,
  }) : super(
          name: name,
          residentialAddress: residentialAddress,
        );

  factory CreatePatientRequestPayload.fromJson(Map<String, dynamic> json) =>
      _$CreatePatientRequestPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$CreatePatientRequestPayloadToJson(this);
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
    required String? residentialAddress,
  }) : super(
          name: name,
          residentialAddress: residentialAddress,
        );

  factory PatientResponsePayload.fromJson(Map<String, dynamic> json) =>
      _$PatientResponsePayloadFromJson(json);

  Map<String, dynamic> toJson() => _$PatientResponsePayloadToJson(this);
}

@JsonSerializable()
class _BasePatientPayload {
  final String? name;
  final String? residentialAddress;

  _BasePatientPayload({
    required this.name,
    required this.residentialAddress,
  });

  Map<String, dynamic> toJson() => _$_BasePatientPayloadToJson(this);
}

// TODO Move into a more abstract location
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
