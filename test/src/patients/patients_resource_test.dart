import 'package:ksch_dart_client/core.dart';
import 'package:ksch_dart_client/resources.dart';
import 'package:test/test.dart';

void main() {
  late KschApi api;

  setUp(() {
    api = KschApi('http://localhost:8080');
  });

  test('Should create patient without payload', () async {
    var patient = await api.patients.create();

    expect(patient.id, isNotNull);
    expect(
        patient.links.self.href,
        startsWith(
          'http://localhost:8080/api/patients/',
        ));
  });

  test('Should create patient with payload', () async {
    var patient = await api.patients.create(CreatePatientRequestPayload(
      name: 'John Doe',
      gender: 'MALE',
      residentialAddress: 'Guesthouse',
      patientCategory: 'OPD',
    ));

    expect(patient.id, isNotNull);
    expect(patient.name, equals('John Doe'));
    expect(patient.gender, equals('MALE'));
    expect(
        patient.links.self.href,
        startsWith(
          'http://localhost:8080/api/patients/',
        ));
  });

  test('should get patient', () async {
    var createdPatientId = (await api.patients.create()).id;

    var result = await api.patients.call(createdPatientId).get();

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

  test('should handle empty search results', () async {
    const patientName = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';

    var result = await api.patients.search(patientName);

    expect(result.patients, isEmpty);
  });

  test('should provide access on paged resources', () async {
    const patientName = 'John Doe';
    await _createPatients(api, patientName, 30);

    // Request first page
    var firstPage = await api.patients.list();
    expect(firstPage.page.number, equals(0));

    // Request second page
    if (firstPage.hasNextPage) {
      var secondPage = await api.patients.list(page: firstPage.nextPage!);
      expect(secondPage.page.number, equals(1));
    } else {
      fail('Could not find next page');
    }

    // Request last page
    var lastPage = await api.patients.list(page: firstPage.lastPage);
    expect(lastPage.page.number, greaterThan(0));
    expect(lastPage.page.number, equals(firstPage.page.totalPages - 1));
  });

  test('Should access current visit via link on patient', () async {
    var patient = await api.patients.create();
    expect(patient.links.startVisit, isNotNull);
    expect(patient.links.currentVisit, isNull);

    await patient.links.startVisit!(api, VisitType.IPD);

    patient = await api.patients(patient.id).get();
    expect(patient.links.startVisit, isNull);
    expect(patient.links.currentVisit, isNotNull);
  });

}

Future<PatientResponsePayload> _createPatient(
  KschApi api,
  String name,
) async {
  var payload = CreatePatientRequestPayload(
    name: name,
    residentialAddress: 'Guesthouse',
    gender: 'MALE',
    patientCategory: 'OPD',
  );
  return await api.patients.create(payload);
}

Future<PatientResponsePayload> _createPatientJohnDoe(
  KschApi api,
) async {
  var payload = CreatePatientRequestPayload(
    name: 'John Doe',
    residentialAddress: 'Guesthouse',
    gender: 'MALE',
    patientCategory: 'OPD',
  );
  return await api.patients.create(payload);
}

Future<List<PatientResponsePayload>> _createPatients(
    KschApi api, String name, int numberOfPatients) async {
  var result = <PatientResponsePayload>[];

  var payload = CreatePatientRequestPayload(
    name: name,
    residentialAddress: 'Guesthouse',
    gender: 'MALE',
    patientCategory: 'OPD',
  );
  for (var i = 0; i < numberOfPatients; i++) {
    result.add(await api.patients.create(payload));
  }

  return result;
}
