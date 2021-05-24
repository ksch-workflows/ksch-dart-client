import 'package:http/http.dart' as http;
import 'dart:convert';

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

  Future<http.Response> post(String resource, {Map<String, dynamic>? body}) async {
    var absolutePath = '$baseUrl/api/$resource';
    var uri = Uri.tryParse(absolutePath);
    if (uri == null) {
      throw 'Could not parse URI from $absolutePath.';
    }
    var headers = <String, String>{
      if (body != null) 'Content-Type' : 'application/json'
    };
    var response = await http.post(uri, body: jsonEncode(body), headers: headers);
    if (response.statusCode >= 400) {
      throw HttpException(statusCode: response.statusCode, responseBody: response.body);
    }
    return response;
  }
}

class HttpException {
  final int statusCode;
  final String responseBody;

  HttpException({required this.statusCode, required this.responseBody});

  @override
  String toString() {
    return "Request failed with status code '$statusCode'. Details: $responseBody";
  }
}
