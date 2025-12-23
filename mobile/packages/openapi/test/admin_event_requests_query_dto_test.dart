import 'package:test/test.dart';
import 'package:openapi/openapi.dart';

// tests for AdminEventRequestsQueryDto
void main() {
  final instance = AdminEventRequestsQueryDtoBuilder();
  // TODO add properties to the builder and call build()

  group(AdminEventRequestsQueryDto, () {
    // Page number (starting at 1)
    // JsonObject page
    test('to test the property `page`', () async {
      // TODO
    });

    // Items per page
    // JsonObject limit
    test('to test the property `limit`', () async {
      // TODO
    });

    // Filter by request status.
    // String status
    test('to test the property `status`', () async {
      // TODO
    });

    // Filter by club (id from /clubs).
    // String clubId
    test('to test the property `clubId`', () async {
      // TODO
    });

  });
}
