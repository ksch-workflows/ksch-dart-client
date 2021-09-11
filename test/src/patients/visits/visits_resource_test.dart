import 'package:ksch_dart_client/core.dart';
import 'package:ksch_dart_client/src/patients/visits/payload.dart';
import 'package:test/test.dart';

void main() {
  late KschApi api;

  setUp(() {
    api = KschApi('http://localhost:8080');
  });

  test('Should start visit', () async {
    var patient = await api.patients.create();

    late VisitResponsePayload visit;
    if (patient.links.startVisit != null) {
      visit = await api.patients(patient.id).visits.startVisit(VisitType.OPD);
    } else {
      fail('Could not find start visit link');
    }

    expect(visit.id, isNotNull);
    expect(visit.type, equals(VisitType.OPD));
    expect(visit.timeStart.difference(DateTime.now()).inMinutes, equals(0));
  });
}
