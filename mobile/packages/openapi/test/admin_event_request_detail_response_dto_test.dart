import 'package:test/test.dart';
import 'package:openapi/openapi.dart';

// tests for AdminEventRequestDetailResponseDto
void main() {
  final instance = AdminEventRequestDetailResponseDtoBuilder();
  // TODO add properties to the builder and call build()

  group(AdminEventRequestDetailResponseDto, () {
    // Event request identifier.
    // String id
    test('to test the property `id`', () async {
      // TODO
    });

    // Club that submitted this request.
    // String clubId
    test('to test the property `clubId`', () async {
      // TODO
    });

    // Information about the club leader who submitted the request.
    // JsonObject submittedBy
    test('to test the property `submittedBy`', () async {
      // TODO
    });

    // Title of the requested event.
    // String title
    test('to test the property `title`', () async {
      // TODO
    });

    // Description / context of the event.
    // String description
    test('to test the property `description`', () async {
      // TODO
    });

    // Type of the event.
    // String eventType
    test('to test the property `eventType`', () async {
      // TODO
    });

    // Planned start date/time for the event.
    // DateTime startTime
    test('to test the property `startTime`', () async {
      // TODO
    });

    // Planned end date/time for the event.
    // DateTime endTime
    test('to test the property `endTime`', () async {
      // TODO
    });

    // Expected number of attendees/students.
    // num expectedStudents
    test('to test the property `expectedStudents`', () async {
      // TODO
    });

    // Internal room where the event will take place. Mutually exclusive with externalAddress.
    // JsonObject roomId
    test('to test the property `roomId`', () async {
      // TODO
    });

    // External address (for off-campus events). Mutually exclusive with roomId.
    // JsonObject externalAddress
    test('to test the property `externalAddress`', () async {
      // TODO
    });

    // Current status of the event request.
    // String status
    test('to test the property `status`', () async {
      // TODO
    });

    // Admin comment associated with the approval/rejection of this request.
    // JsonObject adminComment
    test('to test the property `adminComment`', () async {
      // TODO
    });

    // Date/time when the club submitted this request.
    // DateTime submittedAt
    test('to test the property `submittedAt`', () async {
      // TODO
    });

    // List of annexes attached to this event request.
    // BuiltList<AnnexViewDto> annexes
    test('to test the property `annexes`', () async {
      // TODO
    });

  });
}
