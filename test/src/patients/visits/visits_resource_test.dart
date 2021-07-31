import 'package:ksch_dart_client/ksch_dart_client.dart';
import 'package:test/test.dart';

void main() {
  late KschApi api;

  setUp(() {
    api = KschApi('http://localhost:8080');
  });

  test('Should start visit', () async {
    var patient = await api.patients.create();

    var visit = await api.patients(patient.id).visits.startVisit('OPD');

    expect(visit.id, isNotNull);
  });
}
