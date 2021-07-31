import 'package:json_annotation/json_annotation.dart';

part 'payload.g.dart';

@JsonSerializable()
class PatientsResponsePayload {
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

  bool get hasNextPage {
    return links.next != null;
  }

  int? get nextPage {
    var totalPages = page.totalPages;
    var currentPage = page.number;

    if (currentPage + 1 < totalPages) {
      return currentPage + 1;
    }
  }

  int get firstPage {
    return 0;
  }

  int get lastPage {
    if (page.totalPages > 0) {
      return page.totalPages - 1;
    } else {
      return 0;
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
  final _Links links;

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

@JsonSerializable()
class PageLinks {
  final Link self;

  /// The link to the first page.
  final Link? first;

  /// The link to the previous page.
  final Link? prev;

  /// The link to the next page.
  final Link? next;

  /// The link to the last page.
  final Link? last;

  PageLinks({
    required this.self,
    this.first,
    this.prev,
    this.next,
    this.last,
  });

  factory PageLinks.fromJson(Map<String, dynamic> json) =>
      _$PageLinksFromJson(json);

  Map<String, dynamic> toJson() => _$PageLinksToJson(this);
}

@JsonSerializable()
class _Links {
  final Link self;

  @JsonKey(name: 'start-visit')
  final Link? startVisit;

  _Links({
    required this.self,
    this.startVisit,
  });

  factory _Links.fromJson(Map<String, dynamic> json) => _$_LinksFromJson(json);

  Map<String, dynamic> toJson() => _$_LinksToJson(this);
}

// TODO Move into a more abstract location
@JsonSerializable()
class Link {
  final String href;

  Link({required this.href});

  factory Link.fromJson(Map<String, dynamic> json) => _$LinkFromJson(json);

  Map<String, dynamic> toJson() => _$LinkToJson(this);
}
