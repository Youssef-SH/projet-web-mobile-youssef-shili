import 'package:test/test.dart';
import 'package:openapi/openapi.dart';

// tests for ClubPublicHeaderResponseDto
void main() {
  final instance = ClubPublicHeaderResponseDtoBuilder();
  // TODO add properties to the builder and call build()

  group(ClubPublicHeaderResponseDto, () {
    // Unique identifier of the club.
    // String id
    test('to test the property `id`', () async {
      // TODO
    });

    // Official public name of the club.
    // String name
    test('to test the property `name`', () async {
      // TODO
    });

    // Short description of the club’s mission, goals, and activities.
    // String description
    test('to test the property `description`', () async {
      // TODO
    });

    // Publicly accessible URL of the club’s logo.
    // String logoUrl
    test('to test the property `logoUrl`', () async {
      // TODO
    });

    // Total number of students currently following this club.
    // num followerCount
    test('to test the property `followerCount`', () async {
      // TODO
    });

    // Number of published posts by this club.
    // num postCount
    test('to test the property `postCount`', () async {
      // TODO
    });

    // Whether the authenticated student follows this club. Included only when the requester is a student.
    // bool isFollowed
    test('to test the property `isFollowed`', () async {
      // TODO
    });

    // Whether this club’s account is currently active. Included only when the requester is an admin.
    // bool isActive
    test('to test the property `isActive`', () async {
      // TODO
    });

  });
}
