import 'client.dart';

/// Base class for collection resource representations
abstract class CollectionResource extends _Resource {
  CollectionResource({_Resource? parent}) : super(parent: parent);
}

/// Base class for singleton resource representations.
abstract class IdentityResource extends _Resource {
  final String _id;

  IdentityResource({
    required String id,
    required _Resource parent,
  })  : _id = id,
        super(parent: parent);

  @override
  String get path => _id;
}

/// Base class for an anonymous sub-resource, i.e. a sub-resource without
/// a specific identifier.
abstract class SubResource extends _Resource {
  SubResource({_Resource? parent}) : super(parent: parent);
}

/// Representation of a REST resource.
///
/// References:
/// - https://www.thoughtworks.com/insights/blog/rest-api-design-resource-modeling
/// - https://restfulapi.net/resource-naming/
/// - https://restful-api-design.readthedocs.io/en/latest/resources.html
/// - https://stackoverflow.com/questions/2810652/how-to-design-a-restful-collection-resource
abstract class _Resource {
  final _Resource? _parent;

  _Resource({_Resource? parent}) : _parent = parent;

  KschApi get api;

  /// The last element of the resource path, e.g. `foo` in the
  /// resource `/bars/{id}/foo`
  String get path;

  _Resource? get parent => _parent;

  /// The full resource path, e.g. `/bars/{id}/foo`.
  String get absolutePath {
    var result = '';

    var ancestors = getAncestors().reversed.toList();
    for (var i = 0; i < ancestors.length; i++) {
      var ancestor = ancestors[i];
      result += '${ancestor.path}/';
    }
    result += path;

    return result;
  }

  // TODO: Make this method private and validate in tests on `absolutePath`.
  List<_Resource> getAncestors() {
    var result = <_Resource>[];
    if (parent != null) {
      result.add(parent!);
      result.addAll(parent!.getAncestors());
    }
    return result.toList();
  }
}
