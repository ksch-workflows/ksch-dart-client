import 'package:ksch_dart_client/src/client.dart';
import 'package:ksch_dart_client/src/resource.dart';
import 'package:test/test.dart';

void main() {
  test('Should determine anchestors of root resource', () {
    var result = RootResource().getAncestors();
    expect(result.length, equals(0));
  });

  test('Should determine anchestors of nested resources', () {
    var rootResource = RootResource();
    var subResource = SubResource(rootResource);

    var result = subResource.getAncestors();

    expect(result.length, equals(1));
  });

  test('Should determine anchestors of double nested resources', () {
    var rootResource = RootResource();
    var subResource = SubResource(rootResource);
    var subSubResource = SubSubResource(subResource);

    var result = subSubResource.getAncestors();

    expect(result.length, equals(2));
    expect(result[0].runtimeType, equals(RootResource));
    expect(result[1].runtimeType, equals(SubResource));
  });
}

class RootResource extends CollectionResource {
  @override
  CollectionResource? get parent => null;

  @override
  String get path => 'root';

  @override
  KschApi get api => throw UnimplementedError();
}

class SubResource extends CollectionResource {
  final CollectionResource _parent;

  SubResource(this._parent);

  @override
  CollectionResource? get parent => _parent;

  @override
  String get path => 'sub-resource';

  @override
  KschApi get api => throw UnimplementedError();
}

class SubSubResource extends CollectionResource {
  final CollectionResource _parent;

  SubSubResource(this._parent);

  @override
  CollectionResource? get parent => _parent;

  @override
  String get path => 'sub-sub-resource';

  @override
  KschApi get api => throw UnimplementedError();
}
