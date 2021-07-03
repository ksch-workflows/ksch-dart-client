import 'package:ksch_dart_client/src/client.dart';
import 'package:ksch_dart_client/src/patients/payload.dart';
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

    var result = await api.patients.list();

    expect(result.patients.length, greaterThan(0));
    expect(result.page.number, equals(0));
  });

  test('should get patient', () async {
    var createdPatientId = (await api.patients.create()).id;

    var result = await api.patients(createdPatientId).get();

    expect(result.id, equals(createdPatientId));
  });

  test('should get patient address', () async {
    var createdPatientId = (await _createPatientJohnDoe(api)).id;

    var result = await api.patients(createdPatientId).residentialAddress.get();

    expect(result.residentialAddress, equals('Guesthouse'));
  });

  test('should search for patients', () async {
    var createdPatientId = (await api.patients.create()).id;

    var result = await api.patients.search(createdPatientId);

    expect(result.patients.length, equals(1));
    expect(result.patients[0].id, equals(createdPatientId));
    expect(result.page.number, equals(0));
  });

  test('should URL encode query string in patient search', () async {
    const patientName = 'John & Doe';
    await _createPatient(api, patientName);

    var result = await api.patients.search(patientName);

    expect(result.patients.length, greaterThanOrEqualTo(1));
    expect(result.patients[0].name, equals(patientName));
  });
}

Future<PatientResponsePayload> _createPatient(
  KschApi api,
  String name,
) async {
  var payload = CreatePatientRequestPayload(
    name: name,
  );
  return await api.patients.create(payload);
}

Future<PatientResponsePayload> _createPatientJohnDoe(
  KschApi api,
) async {
  var payload = CreatePatientRequestPayload(
    name: 'John Doe',
    residentialAddress: 'Guesthouse',
  );
  return await api.patients.create(payload);
}
