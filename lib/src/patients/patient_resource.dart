import 'dart:convert';

import '../client.dart';
import '../resource.dart';
import 'address/address_resource.dart';
import 'patient_payload.dart';
import 'patients_payload.dart';

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

  Future<PatientResponsePayload> create([CreatePatientRequestPayload? patient]) async {
    var response = await api.post(absolutePath, body: patient?.toJson());
    return PatientResponsePayload.fromJson(json.decode(response.body));
  }

  Future<PatientsReponsePayload> list() async {
    var listPatientsResponse = await api.get(absolutePath);
    return PatientsReponsePayload.fromJson(json.decode(listPatientsResponse.body));
  }
}

class PatientResource extends IdentityResource {
  final KschApi api;
  late final ResidentialAddressResource residentialAddress;

  PatientResource({
    required this.api,
    required String id,
    required CollectionResource parent,
  }) : super(
          id: id,
          parent: parent,
        ) {
    residentialAddress = ResidentialAddressResource(api: api, parent: this);
  }

  Future<PatientResponsePayload> get() async {
    var getPatientResponse = await api.get(absolutePath);
    var responseBody = json.decode(getPatientResponse.body);
    return PatientResponsePayload.fromJson(responseBody);
  }
}
