import '../client.dart';
import '../resource.dart';
import 'health/resource.dart';

class ActuatorResource extends Resource {
  final KschApi api;

  late final HealthResource health;

  ActuatorResource({required this.api}) {
    health = HealthResource(api: api, parent: this);
  }

  @override
  String get path => 'actuator';
}
