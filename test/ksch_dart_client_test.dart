import 'package:ksch_dart_client/src/client.dart';
import 'package:ksch_dart_client/src/patients/patient_payload.dart';
import 'package:test/test.dart';

void main() {
  late KschApi api;

  setUp(() {
    api = KschApi('http://localhost:8080');
  });

  test('should create patient', () async {
    var patient = await api.patients.create();

    expect(patient.id, isNotEmpty);
  });

  test('should list patients', () async {
    await api.patients.create();
    var response = await api.patients.list();

    expect(response.patients.length, greaterThan(0));
    expect(response.page.number, equals(0));
  });

  test('should get patient', () async {
    var createdPatientId = (await api.patients.create()).id;

    var result = await api.patients(createdPatientId).get();

    expect(result.id, equals(createdPatientId));
  });

  test('should get patient address', () async {
    var createdPatientId = (await api.patients.create(CreatePatientRequestPayload(
      name: 'John Doe',
      residentialAddress: 'Guesthouse',
    )))
        .id;

    var result = await api.patients(createdPatientId).residentialAddress.get();

    expect(result.residentialAddress, equals('Guesthouse'));
  });
}
