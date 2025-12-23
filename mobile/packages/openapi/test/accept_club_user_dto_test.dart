import 'package:test/test.dart';
import 'package:openapi/openapi.dart';

// tests for AcceptClubUserDto
void main() {
  final instance = AcceptClubUserDtoBuilder();
  // TODO add properties to the builder and call build()

  group(AcceptClubUserDto, () {
    // Unique identifier of the newly created club user
    // String id
    test('to test the property `id`', () async {
      // TODO
    });

    // Email address associated with the club account
    // String email
    test('to test the property `email`', () async {
      // TODO
    });

    // Role assigned to the user (always Club)
    // String role
    test('to test the property `role`', () async {
      // TODO
    });

    // Full name for this user — always null for club accounts
    // JsonObject fullName
    test('to test the property `fullName`', () async {
      // TODO
    });

    // Unique identifier of the associated club
    // String clubId
    test('to test the property `clubId`', () async {
      // TODO
    });

  });
}
