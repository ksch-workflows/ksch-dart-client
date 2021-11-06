import 'package:json_annotation/json_annotation.dart';
import 'package:ksch_dart_client/core.dart';
import 'package:ksch_dart_client/resources.dart';

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
  final StartVisitLink? startVisit;

  @JsonKey(name: 'current-visit')
  final VisitLink? currentVisit;

  Links({
    required this.self,
    this.startVisit,
    this.currentVisit,
  });

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);

  Map<String, dynamic> toJson() => _$LinksToJson(this);
}

@JsonSerializable()
class VisitLink implements Link {
  final String href;

  VisitLink({required this.href});

  factory VisitLink.fromJson(Map<String, dynamic> json) =>
      _$VisitLinkFromJson(json);

  Map<String, dynamic> toJson() => _$VisitLinkToJson(this);

  String get patientId {
    var regExp = RegExp(r'http.*/api/patients/([A-Fa-f\-0-9]+)/visits/([A-Fa-f\-0-9]+)');
    var match = regExp.firstMatch(href);
    if (match == null) {
      throw 'Could not parse patient id from link "$href".';
    }
    var patientId = match.group(1);
    if (patientId == null) {
      throw 'Could not parse patient id from link "$href".';
    }
    return patientId;
  }

  String get visitId {
    var regExp = RegExp(r'http.*/api/patients/([A-Fa-f\-0-9]+)/visits/([A-Fa-f\-0-9]+)');
    var match = regExp.firstMatch(href);
    if (match == null) {
      throw 'Could not parse visit id from link "$href".';
    }
    var visitId = match.group(2);
    if (visitId == null) {
      throw 'Could not parse visit id from link "$href".';
    }
    return visitId;
  }

  Future<VisitResponsePayload> get(KschApi api) {
    return api.patients(patientId).visits(visitId).get();
  }
}

@JsonSerializable()
class StartVisitLink implements Link {
  final String href;

  StartVisitLink({required this.href});

  factory StartVisitLink.fromJson(Map<String, dynamic> json) =>
      _$StartVisitLinkFromJson(json);

  Map<String, dynamic> toJson() => _$StartVisitLinkToJson(this);

  Future<VisitResponsePayload> call(KschApi api, VisitType visitType) {
    return api.patients(patientId).visits.startVisit(visitType);
  }

  String get patientId {
    var regExp = RegExp(r'http.*/api/patients/([A-Fa-f\-0-9]+)/visits');
    var match = regExp.firstMatch(href);
    if (match == null) {
      throw 'Could not parse patient id from link "$href".';
    }
    var patientId = match.group(1);
    if (patientId == null) {
      throw 'Could not parse patient id from link "$href".';
    }
    return patientId;
  }
}
