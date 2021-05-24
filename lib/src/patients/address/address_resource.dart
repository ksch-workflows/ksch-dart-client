import '../../client.dart';
import '../../resource.dart';
import '../resource.dart';
import 'address_payload.dart';

class AddressResource extends SubResource {
  final KschApi api;

  AddressResource({required this.api, required PatientResource parent}) : super(parent);

  Future<Address> get() async {
    var getAddressResponse = await api.get(absolutePath);
    return Address(getAddressResponse.body);
  }

  String get path => 'address';
}
