import 'package:test/test.dart';
import 'package:openapi/openapi.dart';

// tests for AdminEventRequestListItemResponseDto
void main() {
  final instance = AdminEventRequestListItemResponseDtoBuilder();
  // TODO add properties to the builder and call build()

  group(AdminEventRequestListItemResponseDto, () {
    // Event request identifier.
    // String id
    test('to test the property `id`', () async {
      // TODO
    });

    // Title of the requested event.
    // String title
    test('to test the property `title`', () async {
      // TODO
    });

    // Type/category of the event.
    // String eventType
    test('to test the property `eventType`', () async {
      // TODO
    });

    // Name of the club that submitted the request.
    // String clubName
    test('to test the property `clubName`', () async {
      // TODO
    });

    // Current workflow status of the request.
    // String status
    test('to test the property `status`', () async {
      // TODO
    });

    // Event start time (from the request).
    // DateTime startTime
    test('to test the property `startTime`', () async {
      // TODO
    });

    // Event end time (from the request).
    // DateTime endTime
    test('to test the property `endTime`', () async {
      // TODO
    });

    // When this request was submitted by the club.
    // DateTime submittedAt
    test('to test the property `submittedAt`', () async {
      // TODO
    });

    // Role of the club leader who submitted the request. Exposed here to let admin see accountability level without PII.
    // String submittedByRole
    test('to test the property `submittedByRole`', () async {
      // TODO
    });

  });
}
