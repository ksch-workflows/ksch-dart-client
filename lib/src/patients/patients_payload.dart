import 'package:json_annotation/json_annotation.dart';
import 'patient_payload.dart';

part 'patients_payload.g.dart';

@JsonSerializable()
class PatientsReponsePayload {

  @JsonKey(name: '_embedded')
  final Embedded embedded;

  final Page page;

  List<PatientResponsePayload> get patients {
    return embedded.patientModelList;
  }

  PatientsReponsePayload({
    required this.embedded,
    required this.page,
  });

  factory PatientsReponsePayload.fromJson(Map<String, dynamic> json) => _$PatientsReponsePayloadFromJson(json);

  Map<String, dynamic> toJson() => _$PatientsReponsePayloadToJson(this);
}

@JsonSerializable()
class Embedded {

  final List<PatientResponsePayload> patientModelList;

  Embedded({required this.patientModelList});

  factory Embedded.fromJson(Map<String, dynamic> json) => _$EmbeddedFromJson(json);

  Map<String, dynamic> toJson() => _$EmbeddedToJson(this);
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
