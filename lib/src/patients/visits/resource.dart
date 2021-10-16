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

  @override
  String get path => 'visits';

  VisitResource call(String id) {
    return VisitResource(api: api, id: id, parent: this);
  }

  Future<VisitResponsePayload> startVisit(VisitType type) async {
    var payload = StartVisitPayload(type: type);
    var response = await api.post(absolutePath, body: payload.toJson());
    return VisitResponsePayload.fromJson(jsonDecode(response.body));
  }
}

class VisitResource extends IdentityResource {
  final KschApi api;

  VisitResource({
    required this.api,
    required String id,
    required CollectionResource parent,
  }) : super(
          id: id,
          parent: parent,
        );

  Future<VisitResponsePayload> get() async {
    var response = await api.get(absolutePath);
    var responseBody = json.decode(response.body);
    return VisitResponsePayload.fromJson(responseBody);
  }
}
