import 'dart:convert';

import '../../../core.dart';
import '../../resource.dart';
import '../resource.dart';
import 'payload.dart';

class HealthResource extends Resource {
  final KschApi api;

  HealthResource({
    required this.api,
    required ActuatorResource parent,
  }) : super(parent: parent);

  @override
  String get path => 'health';

  Future<HealthResponsePayload> get() async {
    var rawResponse = await api.get(absolutePath);
    var responseBody = json.decode(rawResponse.body);
    return HealthResponsePayload.fromJson(responseBody);
  }
}
