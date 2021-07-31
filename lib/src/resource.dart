import 'client.dart';

abstract class Resource {

  KschApi get api;

  /// The last element of the resource path, e.g. `foo` in the
  /// resource `/bars/{id}/foo`
  String get path;

  Resource? get parent;

  /// The full resource path, e.g. `/bars/{id}/foo`.
  String get absolutePath {
    var result = '';

    var ancestors = getAncestors();
    for (var i = 0; i < ancestors.length; i++) {
      var ancestor = ancestors[i];
      result += '${ancestor.path}/';
    }
    result += path;

    return result;
  }

  // TODO: Make this method private and validate in tests on `absolutePath`.
  List<Resource> getAncestors() {
    var result = <Resource>[];
    if (parent != null) {
      result.add(parent!);
      result.addAll(parent!.getAncestors());
    }
    return result.reversed.toList();
  }
}

abstract class IdentityResource extends Resource {
  final String _id;
  final Resource _parent;

  IdentityResource({required String id, required Resource parent})
      : _id = id,
        _parent = parent;

  @override
  String get path => _id;

  @override
  Resource get parent => _parent;
}

abstract class CollectionResource extends Resource {}

abstract class SubResource extends CollectionResource {
  final Resource parent;

  SubResource(this.parent);
}
