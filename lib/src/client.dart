import 'dart:convert';

import 'package:http/http.dart' as http;

import 'patients/resource.dart';

class KschApi {
  String baseUrl;

  late final PatientCollectionResource patients;

  KschApi(this.baseUrl) {
    patients = PatientCollectionResource(api: this);
  }

  Future<http.Response> get(String resource) async {
    var absolutePath = '$baseUrl/api/$resource';
    var uri = Uri.tryParse(absolutePath);
    if (uri == null) {
      throw 'Could not parse URI from $absolutePath.';
    }
    var response = await http.get(uri);
    _checkNoErrorResponse(response);
    return response;
  }

  Future<http.Response> post(
    String resource, {
    Map<String, dynamic>? body,
  }) async {
    var absolutePath = '$baseUrl/api/$resource';
    var uri = Uri.tryParse(absolutePath);
    if (uri == null) {
      throw 'Could not parse URI from $absolutePath.';
    }
    var headers = <String, String>{
      if (body != null) 'Content-Type': 'application/json',
    };
    late http.Response response;
    if (body != null) {
      response = await http.post(uri, body: jsonEncode(body), headers: headers);
    } else {
      response = await http.post(uri, headers: headers);
    }
    _checkNoErrorResponse(response);
    return response;
  }
}

void _checkNoErrorResponse(http.Response response) {
  if (response.statusCode >= 400) {
    throw HttpException(
      statusCode: response.statusCode,
      responseBody: response.body,
    );
  }
}

class HttpException {
  final int statusCode;
  final String responseBody;

  HttpException({required this.statusCode, required this.responseBody});

  @override
  String toString() {
    return "Request failed with status code '$statusCode'."
        'Details: $responseBody';
  }
}
