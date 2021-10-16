# K.S.C.H. Dart Client

This repository contains the source code of a [Dart](https://dart.dev/) package which provides access on the API of the [K.S.C.H. Workflows backend](https://github.com/ksch-workflows/backend).

## Development

Execute the following command to generate the JSON serialization and de-serialization code:

```
dart run build_runner build
```

## Test

### Integration tests

When running the tests it is assumed that there is a local process of the [backend](https://github.com/ksch-workflows/backend)
running on port 8080.

```
cd ../backend
./gradlew bootRun
```

Then the tests can be executed like this:

```
dart test
```

### Linting

```
dart format .
dart analyze

# https://github.com/dart-lang/pana
pana .
```

## License

This project is maintained by [KS-plus e.V.](https://ks-plus.org/en/welcome/),
a non-profit association dedicated to supporting the [Kirpal Sagar](https://kirpal-sagar.org/en/welcome/) project.

It is licensed under the [Apache License Version 2.0](https://github.com/ksch-workflows/ksch-workflows/blob/master/LICENSE).
