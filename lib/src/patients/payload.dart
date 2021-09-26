import 'package:json_annotation/json_annotation.dart';

import '../hateoas.dart';
import '../pagination.dart';

part 'payload.g.dart';

@JsonSerializable()
class PatientsResponsePayload with PageNavigation {
  @JsonKey(name: '_embedded')
  final _Embedded? embedded;

  @JsonKey(name: '_links')
  final PageLinks links;

  final Page page;

  PatientsResponsePayload({
    required this.embedded,
    required this.page,
    required this.links,
  });

  List<PatientResponsePayload> get patients {
    if (embedded == null) {
      return [];
    } else {
      return embedded!.patientResourceList;
    }
  }

  factory PatientsResponsePayload.fromJson(Map<String, dynamic> json) =>
      _$PatientsResponsePayloadFromJson(json);

  Map<String, dynamic> toJson() => _$PatientsResponsePayloadToJson(this);
}

@JsonSerializable()
class _Embedded {
  final List<PatientResponsePayload> patientResourceList;

  _Embedded({required this.patientResourceList});

  factory _Embedded.fromJson(Map<String, dynamic> json) =>
      _$_EmbeddedFromJson(json);

  Map<String, dynamic> toJson() => _$_EmbeddedToJson(this);
}

@JsonSerializable()
class CreatePatientRequestPayload extends _BasePatientPayload {
  CreatePatientRequestPayload({
    required String? name,
    required String? residentialAddress,
    required String? gender,
    required String? patientCategory,
  }) : super(
    name: name,
    residentialAddress: residentialAddress,
    gender: gender,
    patientCategory: patientCategory,
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
    required String? gender,
    required String? patientCategory,
  }) : super(
    name: name,
    residentialAddress: residentialAddress,
    gender: gender,
    patientCategory: patientCategory,
  );

  factory PatientResponsePayload.fromJson(Map<String, dynamic> json) =>
      _$PatientResponsePayloadFromJson(json);

  Map<String, dynamic> toJson() => _$PatientResponsePayloadToJson(this);
}

@JsonSerializable()
class _BasePatientPayload {
  final String? name;
  final String? residentialAddress;
  final String? gender;
  final String? patientCategory;

  _BasePatientPayload({
    required this.name,
    required this.residentialAddress,
    required this.gender,
    required this.patientCategory,
  });

  Map<String, dynamic> toJson() => _$_BasePatientPayloadToJson(this);
}

@JsonSerializable()
class Links {
  final Link self;

  @JsonKey(name: 'start-visit')
  final Link? startVisit;

  Links({
    required this.self,
    this.startVisit,
  });

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);

  Map<String, dynamic> toJson() => _$LinksToJson(this);
}
