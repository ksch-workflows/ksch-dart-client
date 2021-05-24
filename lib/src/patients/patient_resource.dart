import 'dart:convert';
import 'package:http/http.dart' as http;

import '../client.dart';
import '../resource.dart';
import 'address/address_resource.dart';
import 'patient_payload.dart';

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

  Future<PatientResponsePayload> create([PatientCreationPayload? patient]) async {
    var response = await api.post(absolutePath, body: patient?.toJson());
    return PatientResponsePayload.fromJson(json.decode(response.body));
  }

  Future<List<PatientResponsePayload>> list() async {
    var result = <PatientResponsePayload>[];
    var listPatientsResponse = await api.get(absolutePath);
    var responseBody = json.decode(listPatientsResponse.body);
    for (var patientData in responseBody) {
      result.add(PatientResponsePayload.fromJson(responseBody));
    }
    return result;
  }
}

class PatientResource extends IdentityResource {
  final KschApi api;
  late final AddressResource address;

  PatientResource({
    required this.api,
    required String id,
    required CollectionResource parent,
  }) : super(
          id: id,
          parent: parent,
        ) {
    address = AddressResource(api: api, parent: this);
  }

  Future<PatientResponsePayload> get() async {
    var getPatientResponse = await api.get(absolutePath);
    var responseBody = json.decode(getPatientResponse.body);
    return PatientResponsePayload.fromJson(responseBody);
  }
}
