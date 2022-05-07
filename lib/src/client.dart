import 'dart:convert';

import 'package:http/http.dart' as http;

import 'actuator/resource.dart';
import 'patients/resource.dart';

class KschApi {
  String baseUrl;
  String? accessToken;

  late final ActuatorResource actuator;
  late final PatientsResource patients;

  KschApi(this.baseUrl, {this.accessToken}) {
    actuator = ActuatorResource(api: this);
    patients = PatientsResource(api: this);
  }

  Future<http.Response> get(String resource) async {
    var absolutePath = '$baseUrl/api/$resource';
    var uri = Uri.tryParse(absolutePath);
    if (uri == null) {
      throw 'Could not parse URI from $absolutePath.';
    }
    var response = await http.get(uri, headers: commonHeaders);
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
    headers.addAll(commonHeaders);
    late http.Response response;
    if (body != null) {
      response = await http.post(uri, body: jsonEncode(body), headers: headers);
    } else {
      response = await http.post(uri, headers: headers);
    }
    _checkNoErrorResponse(response);
    return response;
  }

  Map<String, String> get commonHeaders {
    var result = <String, String>{};
    if (accessToken != null) {
      result['Authorization'] = 'Bearer $accessToken';
    }
    return result;
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
    var msg = "Request failed with status code '$statusCode'.";
    if (responseBody.isNotEmpty) {
      msg += ' Details: $responseBody.';
    } else {
      msg += ' No response payload.';
    }
    return msg;
  }
}
