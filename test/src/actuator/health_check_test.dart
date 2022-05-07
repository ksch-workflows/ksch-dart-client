import 'package:ksch_dart_client/core.dart';
import 'package:test/test.dart';

import '../authentication.dart';

void main() {
  late KschApi api;

  setUp(() {
    api = KschApi('http://localhost:8080', accessToken: mockAccessToken);
  });

  test('Should execute health check', () async {
    var response = await api.actuator.health.get();
    expect(response.status, equals('UP'));
  });
}
