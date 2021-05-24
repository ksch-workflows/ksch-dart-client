import 'package:ksch_dart_client/src/client.dart';
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

  test('should get patients', () async {
    await api.patients.create();
    var patients = await api.patients.list();

    expect(patients.length, greaterThan(0));
  });

  test('should get patient', () async {
    var createdPatientId = (await api.patients.create()).id;

    var result = await api.patients(createdPatientId).get();

    expect(result.id, equals(createdPatientId));
  });

  test('should get patient address', () async {
    var createdPatientId = (await api.patients.create()).id;

    var result = await api.patients(createdPatientId).address.get();

    expect(result.value, equals('Guesthouse'));
  });
}
