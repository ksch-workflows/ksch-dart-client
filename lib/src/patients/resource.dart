import 'dart:convert';

import 'package:ksch_dart_client/src/patients/visits/resource.dart';

import '../client.dart';
import '../resource.dart';
import 'address/resource.dart';
import 'payload.dart';

class PatientCollectionResource extends CollectionResource {
  final KschApi api;

  PatientCollectionResource({required this.api});

  PatientResource call(String id) {
    return PatientResource(api: api, id: id, parent: this);
  }

  @override
  String get path => 'patients';

  @override
  CollectionResource? get parent => null;

  Future<PatientResponsePayload> create(
      [CreatePatientRequestPayload? patient]) async {
    var response = await api.post(absolutePath, body: patient?.toJson());
    return PatientResponsePayload.fromJson(json.decode(response.body));
  }

  Future<PatientsResponsePayload> list({int page = 0}) async {
    var requestUrl = '$absolutePath?page=$page';
    var response = await api.get(requestUrl);
    return PatientsResponsePayload.fromJson(json.decode(response.body));
  }

  /// Searches for patients which match the provided query string.
  ///
  /// - If the query string is a valid UUID, it is searched for a patient with
  /// this patient ID.
  /// - If the query string is a valid patient number, it is searched for a
  /// patient with this patient number.
  /// - Otherwise, it is searched for patients with a name matching with the
  /// query string.
  ///
  /// Also see https://ksch-workflows.github.io/backend/#_search_patient
  Future<PatientsResponsePayload> search(String query, {int page = 0}) async {
    var urlEncodedQuery = Uri.encodeComponent(query);
    var requestUrl = '$absolutePath/search?q=$urlEncodedQuery&page=$page';
    var response = await api.get(requestUrl);
    return PatientsResponsePayload.fromJson(json.decode(response.body));
  }
}

class PatientResource extends IdentityResource {
  final KschApi api;
  late final ResidentialAddressResource residentialAddress;
  late final VisitsResource visits;

  PatientResource({
    required this.api,
    required String id,
    required CollectionResource parent,
  }) : super(
          id: id,
          parent: parent,
        ) {
    residentialAddress = ResidentialAddressResource(api: api, parent: this);
    visits = VisitsResource(api: api, parent: this);
  }

  Future<PatientResponsePayload> get() async {
    var getPatientResponse = await api.get(absolutePath);
    var responseBody = json.decode(getPatientResponse.body);
    return PatientResponsePayload.fromJson(responseBody);
  }
}
