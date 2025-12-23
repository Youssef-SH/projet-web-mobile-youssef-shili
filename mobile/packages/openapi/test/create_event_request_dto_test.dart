import 'package:test/test.dart';
import 'package:openapi/openapi.dart';

// tests for CreateEventRequestDto
void main() {
  final instance = CreateEventRequestDtoBuilder();
  // TODO add properties to the builder and call build()

  group(CreateEventRequestDto, () {
    // Publicly visible title of the event.
    // String title
    test('to test the property `title`', () async {
      // TODO
    });

    // Detailed description of the event.
    // String description
    test('to test the property `description`', () async {
      // TODO
    });

    // Type / category of this event.
    // String eventType
    test('to test the property `eventType`', () async {
      // TODO
    });

    // Start date/time (ISO 8601, UTC recommended).
    // DateTime startTime
    test('to test the property `startTime`', () async {
      // TODO
    });

    // End date/time (must be > startTime, checked in service).
    // DateTime endTime
    test('to test the property `endTime`', () async {
      // TODO
    });

    // Estimated attendance.
    // num expectedStudents
    test('to test the property `expectedStudents`', () async {
      // TODO
    });

    // Internal room ID (on-campus). Mutually exclusive with externalAddress.
    // String roomId
    test('to test the property `roomId`', () async {
      // TODO
    });

    // External, off-campus location. Mutually exclusive with roomId.
    // String externalAddress
    test('to test the property `externalAddress`', () async {
      // TODO
    });

    // Club leader (President / VicePresident) responsible for this request. Must belong to the authenticated club.
    // String submittedBy
    test('to test the property `submittedBy`', () async {
      // TODO
    });

  });
}
