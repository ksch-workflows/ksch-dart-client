# K.S.C.H. Dart Client

This repository contains the source code of a [Dart](https://dart.dev/) package which provides access on the API of the [K.S.C.H. Workflows backend](https://github.com/ksch-workflows/backend).

## Development

Execute the following command to generated the JSON serialization and de-serialization code:

```
dart run build_runner build
```

## Test

### Linting

```
dart analyze
```

## References

- https://pub.dev/packages/json_serializable
- https://pub.dev/documentation/json_serializable/latest/
- https://flutter.dev/docs/development/data-and-backend/json
- https://stackoverflow.com/questions/62144987/flutter-dart-jsonserializable-with-inherited-class
- https://stackoverflow.com/a/61138375/2339010
- https://stackoverflow.com/questions/54849725/bad-state-cannot-set-the-body-fields-of-a-request-with-content-type-applicatio

## License

This project is maintained by [KS-plus e.V.](https://ks-plus.org/en/welcome/),
a non-profit association dedicated to supporting the [Kirpal Sagar](https://kirpal-sagar.org/en/welcome/) project.

It is licensed under the [Apache License Version 2.0](https://github.com/ksch-workflows/ksch-workflows/blob/master/LICENSE).
