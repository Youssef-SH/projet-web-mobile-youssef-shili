import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for EventsApi
void main() {
  final instance = Openapi().getEventsApi();

  group(EventsApi, () {
    // List event requests (admin)
    //
    // Paginated list of all event requests. Can be filtered by status and clubId. Sorted by submittedAt DESC.
    //
    //Future<EventsAdminListRequests200Response> eventsAdminListRequests({ num page, num limit, String status, String clubId }) async
    test('test eventsAdminListRequests', () async {
      // TODO
    });

    // Approve event request
    //
    // Approves the request and creates the live event. Idempotent.
    //
    //Future<EventsApproveRequest201Response> eventsApproveRequest(String id, ApproveEventRequestDto approveEventRequestDto) async
    test('test eventsApproveRequest', () async {
      // TODO
    });

    // Cancel event (admin)
    //
    // Marks the event as cancelled. Still visible in public calendar.
    //
    //Future<EventsCancel200Response> eventsCancel(String id) async
    test('test eventsCancel', () async {
      // TODO
    });

    // Change event room (admin)
    //
    // Moves an internal event to another room. Fails for external events or overlapping schedules.
    //
    //Future<EventsChangeRoom200Response> eventsChangeRoom(String id, ChangeEventRoomDto changeEventRoomDto) async
    test('test eventsChangeRoom', () async {
      // TODO
    });

    // List own event requests (club)
    //
    // Returns the authenticated club’s own requests (newest first).
    //
    //Future<EventsClubListOwnRequests200Response> eventsClubListOwnRequests({ num page, num limit }) async
    test('test eventsClubListOwnRequests', () async {
      // TODO
    });

    // Create event request (club)
    //
    // Club submits an event request with all required annexes. Each annex field must be named `annex_{templateId}`. Unknown/extra files are ignored.
    //
    //Future<EventsCreateRequest201Response> eventsCreateRequest(String title, String eventType, DateTime startTime, DateTime endTime, String submittedBy, { String description, num expectedStudents, String roomId, String externalAddress, MultipartFile annex11111111111111111111111111111111 }) async
    test('test eventsCreateRequest', () async {
      // TODO
    });

    // Create internal room
    //
    // Admin-only. Creates a new bookable internal room.
    //
    //Future<EventsCreateRoom201Response> eventsCreateRoom(CreateRoomDto createRoomDto) async
    test('test eventsCreateRoom', () async {
      // TODO
    });

    // Delete room
    //
    // Admin-only. Fails if room is used by pending requests or upcoming events.
    //
    //Future eventsDeleteRoom(String id) async
    test('test eventsDeleteRoom', () async {
      // TODO
    });

    // Get public event details
    //
    // Public endpoint. Returns title, club, time, location, description, and isCancelled.
    //
    //Future<EventsGetPublicById200Response> eventsGetPublicById(String id) async
    test('test eventsGetPublicById', () async {
      // TODO
    });

    // Public calendar (upcoming events)
    //
    // Returns upcoming events in the next N days (e.g. 30). No filters.
    //
    //Future<EventsGetPublicCalendar200Response> eventsGetPublicCalendar({ num page, num limit }) async
    test('test eventsGetPublicCalendar', () async {
      // TODO
    });

    // Get single event request (role-shaped)
    //
    // Admins get the full internal view (club contact + annexes). Clubs get their own view (no annexes).
    //
    //Future<EventsGetRequest200Response> eventsGetRequest(String id) async
    test('test eventsGetRequest', () async {
      // TODO
    });

    // List internal rooms
    //
    // Used by clubs when creating event requests and by admins to manage rooms.
    //
    //Future<EventsListRooms200Response> eventsListRooms() async
    test('test eventsListRooms', () async {
      // TODO
    });

    // Reject event request
    //
    // Rejects the request with a mandatory comment.
    //
    //Future<EventsRejectRequest200Response> eventsRejectRequest(String id, RejectEventRequestDto rejectEventRequestDto) async
    test('test eventsRejectRequest', () async {
      // TODO
    });

    // Reschedule event (admin)
    //
    // Changes start/end time of an approved event.
    //
    //Future<EventsReschedule200Response> eventsReschedule(String id, RescheduleEventDto rescheduleEventDto) async
    test('test eventsReschedule', () async {
      // TODO
    });

  });
}
