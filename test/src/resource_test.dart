import 'package:ksch_dart_client/src/client.dart';
import 'package:ksch_dart_client/src/resource.dart';
import 'package:test/test.dart';

void main() {
  test('Should determine absolute path of nested identity resources', () {
    var patientsResource = MockPatientsResource();
    var patientResource = MockPatientResource(
      id: '1',
      parent: patientsResource,
    );
    var visitsResource = MockVisitsResource(parent: patientResource);
    var visitResource = MockVisitResource(
      id: '2',
      parent: visitsResource,
    );

    var result = visitResource.absolutePath;

    expect(result, equals('patients/1/visits/2'));
  });
}

class MockPatientsResource extends CollectionResource {
  @override
  CollectionResource? get parent => null;

  @override
  String get path => 'patients';

  @override
  KschApi get api => throw UnimplementedError();
}

class MockPatientResource extends IdentityResource {
  MockPatientResource({
    required String id,
    required CollectionResource parent,
  }) : super(
          id: id,
          parent: parent,
        );

  @override
  KschApi get api => throw UnimplementedError();
}

class MockVisitsResource extends CollectionResource {
  MockVisitsResource({
    required MockPatientResource parent,
  }) : super(
          parent: parent,
        );

  @override
  KschApi get api => throw UnimplementedError();

  @override
  String get path => 'visits';
}

class MockVisitResource extends IdentityResource {
  MockVisitResource({
    required String id,
    required CollectionResource parent,
  }) : super(
          id: id,
          parent: parent,
        );

  @override
  KschApi get api => throw UnimplementedError();
}
