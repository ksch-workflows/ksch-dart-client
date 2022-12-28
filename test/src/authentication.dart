import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

String get mockAccessToken {
  final jwt = JWT({}, issuer: 'https://example.com');
  return jwt.sign(
    SecretKey('\$MOCK_SIGNING_SECRET'),
    expiresIn: const Duration(seconds: 86400),
  );
}
