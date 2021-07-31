import 'dart:convert';

import '../../client.dart';
import '../../resource.dart';
import '../resource.dart';
import 'payload.dart';

class VisitsResource extends CollectionResource {
  final KschApi api;

  VisitsResource({
    required this.api,
    required PatientResource parent,
  }) : super(parent: parent);

  Future<VisitResponsePayload> startVisit(VisitType type) async {
    var payload = StartVisitPayload(type: type);
    var response = await api.post(absolutePath, body: payload.toJson());
    return VisitResponsePayload.fromJson(jsonDecode(response.body));
  }

  String get path => 'visits';
}
