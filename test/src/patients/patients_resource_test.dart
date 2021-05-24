import 'package:ksch_dart_client/src/client.dart';
import 'package:ksch_dart_client/src/patients/patient_payload.dart';
import 'package:test/test.dart';

void main() {
  test('Should create patient without payload', () async {
    var client = KschApi('http://localhost:8080');

    var patient = await client.patients.create();

    expect(patient.id, isNotNull);
    expect(patient.links.self.href, startsWith('http://localhost:8080/api/patients/'));
  });

  test('Should create patient with payload', () async {
    var client = KschApi('http://localhost:8080');

    var patient = await client.patients.create(CreatePatientPayload(name: 'John Doe'));

    expect(patient.id, isNotNull);
    expect(patient.name, isNotNull);
    expect(patient.links.self.href, startsWith('http://localhost:8080/api/patients/'));
  });
}
