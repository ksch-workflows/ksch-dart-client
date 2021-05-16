import 'package:http/http.dart' as http;

import 'patients/patient_resource.dart';

class KschApi {
  String baseUrl;

  late final PatientCollectionResource patients;

  KschApi(this.baseUrl) {
    patients = PatientCollectionResource(api: this);
  }

  Future<http.Response> get(String resource) async {
    // TODO: Handle not found error
    var absolutePath = '$baseUrl/api/$resource';
    var uri = Uri.tryParse(absolutePath);
    if (uri == null) {
      throw 'Could not parse URI from $absolutePath.';
    }
    return http.get(uri);
  }

  Future<http.Response> post(String resource) async {
    var absolutePath = '$baseUrl/api/$resource';
    var uri = Uri.tryParse(absolutePath);
    if (uri == null) {
      throw 'Could not parse URI from $absolutePath.';
    }
    return http.post(uri);
  }
}
