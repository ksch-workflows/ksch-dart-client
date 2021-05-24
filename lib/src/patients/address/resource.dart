import 'dart:convert';

import '../../client.dart';
import '../../resource.dart';
import '../resource.dart';
import 'payload.dart';

class ResidentialAddressResource extends SubResource {
  final KschApi api;

  ResidentialAddressResource({required this.api, required PatientResource parent}) : super(parent);

  Future<AddressPayload> get() async {
    var getAddressResponse = await api.get(absolutePath);
    return AddressPayload.fromJson(jsonDecode(getAddressResponse.body));
  }

  String get path => 'residential-address';
}
