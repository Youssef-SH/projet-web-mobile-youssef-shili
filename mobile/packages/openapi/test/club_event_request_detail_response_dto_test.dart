import 'package:test/test.dart';
import 'package:openapi/openapi.dart';

// tests for ClubEventRequestDetailResponseDto
void main() {
  final instance = ClubEventRequestDetailResponseDtoBuilder();
  // TODO add properties to the builder and call build()

  group(ClubEventRequestDetailResponseDto, () {
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

    // If the event is internal, this is the chosen room.
    // JsonObject roomId
    test('to test the property `roomId`', () async {
      // TODO
    });

    // If the event is external, this is the chosen location. Mutually exclusive with roomId.
    // JsonObject externalAddress
    test('to test the property `externalAddress`', () async {
      // TODO
    });

    // Current status of the request from the club perspective.
    // String status
    test('to test the property `status`', () async {
      // TODO
    });

    // Admin comment if the request was approved/rejected, shown to the club.
    // JsonObject adminComment
    test('to test the property `adminComment`', () async {
      // TODO
    });

    // Club role of the leader who sent the request. We only show the role to the club.
    // JsonObject submittedBy
    test('to test the property `submittedBy`', () async {
      // TODO
    });

    // Date/time when the club submitted this request.
    // DateTime submittedAt
    test('to test the property `submittedAt`', () async {
      // TODO
    });

  });
}
