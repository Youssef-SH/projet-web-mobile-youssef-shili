import 'package:test/test.dart';
import 'package:openapi/openapi.dart';

// tests for MeResponseDto
void main() {
  final instance = MeResponseDtoBuilder();
  // TODO add properties to the builder and call build()

  group(MeResponseDto, () {
    // Unique identifier of the authenticated user.
    // String id
    test('to test the property `id`', () async {
      // TODO
    });

    // Email address of the authenticated user
    // String email
    test('to test the property `email`', () async {
      // TODO
    });

    // Role of the authenticated user within the platform
    // String role
    test('to test the property `role`', () async {
      // TODO
    });

    // Full name of the user (Admin & Student only). Null for club accounts.
    // JsonObject fullName
    test('to test the property `fullName`', () async {
      // TODO
    });

    // Club ID if the user is a club account, otherwise null
    // JsonObject clubId
    test('to test the property `clubId`', () async {
      // TODO
    });

  });
}
