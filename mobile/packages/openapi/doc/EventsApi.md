# openapi.api.EventsApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://isimm-clubhub-api.onrender.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**eventsAdminListRequests**](EventsApi.md#eventsadminlistrequests) | **GET** /api/v1/events/requests | List event requests (admin)
[**eventsApproveRequest**](EventsApi.md#eventsapproverequest) | **POST** /api/v1/events/requests/{id}/approve | Approve event request
[**eventsCancel**](EventsApi.md#eventscancel) | **PATCH** /api/v1/events/{id}/cancel | Cancel event (admin)
[**eventsChangeRoom**](EventsApi.md#eventschangeroom) | **PATCH** /api/v1/events/{id}/room | Change event room (admin)
[**eventsClubListOwnRequests**](EventsApi.md#eventsclublistownrequests) | **GET** /api/v1/events/requests/me | List own event requests (club)
[**eventsCreateRequest**](EventsApi.md#eventscreaterequest) | **POST** /api/v1/events/requests | Create event request (club)
[**eventsCreateRoom**](EventsApi.md#eventscreateroom) | **POST** /api/v1/events/rooms | Create internal room
[**eventsDeleteRoom**](EventsApi.md#eventsdeleteroom) | **DELETE** /api/v1/events/rooms/{id} | Delete room
[**eventsGetPublicById**](EventsApi.md#eventsgetpublicbyid) | **GET** /api/v1/events/{id} | Get public event details
[**eventsGetPublicCalendar**](EventsApi.md#eventsgetpubliccalendar) | **GET** /api/v1/events/calendar | Public calendar (upcoming events)
[**eventsGetRequest**](EventsApi.md#eventsgetrequest) | **GET** /api/v1/events/requests/{id} | Get single event request (role-shaped)
[**eventsListRooms**](EventsApi.md#eventslistrooms) | **GET** /api/v1/events/rooms | List internal rooms
[**eventsRejectRequest**](EventsApi.md#eventsrejectrequest) | **POST** /api/v1/events/requests/{id}/reject | Reject event request
[**eventsReschedule**](EventsApi.md#eventsreschedule) | **PATCH** /api/v1/events/{id}/time | Reschedule event (admin)


# **eventsAdminListRequests**
> EventsAdminListRequests200Response eventsAdminListRequests(page, limit, status, clubId)

List event requests (admin)

Paginated list of all event requests. Can be filtered by status and clubId. Sorted by submittedAt DESC.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getEventsApi();
final num page = 1; // num | Page number (starting at 1)
final num limit = 10; // num | Items per page
final String status = Pending; // String | Filter by request status.
final String clubId = 3ca4f08b-2ee1-4fd5-b73e-7cb6394e19de; // String | Filter by club (id from /clubs).

try {
    final response = api.eventsAdminListRequests(page, limit, status, clubId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling EventsApi->eventsAdminListRequests: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **num**| Page number (starting at 1) | [optional] 
 **limit** | **num**| Items per page | [optional] 
 **status** | **String**| Filter by request status. | [optional] 
 **clubId** | **String**| Filter by club (id from /clubs). | [optional] 

### Return type

[**EventsAdminListRequests200Response**](EventsAdminListRequests200Response.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **eventsApproveRequest**
> EventsApproveRequest201Response eventsApproveRequest(id, approveEventRequestDto)

Approve event request

Approves the request and creates the live event. Idempotent.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getEventsApi();
final String id = id_example; // String | Event request UUID to approve
final ApproveEventRequestDto approveEventRequestDto = ; // ApproveEventRequestDto | 

try {
    final response = api.eventsApproveRequest(id, approveEventRequestDto);
    print(response);
} catch on DioException (e) {
    print('Exception when calling EventsApi->eventsApproveRequest: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Event request UUID to approve | 
 **approveEventRequestDto** | [**ApproveEventRequestDto**](ApproveEventRequestDto.md)|  | 

### Return type

[**EventsApproveRequest201Response**](EventsApproveRequest201Response.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **eventsCancel**
> EventsCancel200Response eventsCancel(id)

Cancel event (admin)

Marks the event as cancelled. Still visible in public calendar.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getEventsApi();
final String id = id_example; // String | Event UUID to cancel

try {
    final response = api.eventsCancel(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling EventsApi->eventsCancel: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Event UUID to cancel | 

### Return type

[**EventsCancel200Response**](EventsCancel200Response.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **eventsChangeRoom**
> EventsChangeRoom200Response eventsChangeRoom(id, changeEventRoomDto)

Change event room (admin)

Moves an internal event to another room. Fails for external events or overlapping schedules.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getEventsApi();
final String id = id_example; // String | Event UUID to move
final ChangeEventRoomDto changeEventRoomDto = ; // ChangeEventRoomDto | 

try {
    final response = api.eventsChangeRoom(id, changeEventRoomDto);
    print(response);
} catch on DioException (e) {
    print('Exception when calling EventsApi->eventsChangeRoom: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Event UUID to move | 
 **changeEventRoomDto** | [**ChangeEventRoomDto**](ChangeEventRoomDto.md)|  | 

### Return type

[**EventsChangeRoom200Response**](EventsChangeRoom200Response.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **eventsClubListOwnRequests**
> EventsClubListOwnRequests200Response eventsClubListOwnRequests(page, limit)

List own event requests (club)

Returns the authenticated club’s own requests (newest first).

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getEventsApi();
final num page = 1; // num | Page number (starting at 1)
final num limit = 10; // num | Items per page

try {
    final response = api.eventsClubListOwnRequests(page, limit);
    print(response);
} catch on DioException (e) {
    print('Exception when calling EventsApi->eventsClubListOwnRequests: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **num**| Page number (starting at 1) | [optional] 
 **limit** | **num**| Items per page | [optional] 

### Return type

[**EventsClubListOwnRequests200Response**](EventsClubListOwnRequests200Response.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **eventsCreateRequest**
> EventsCreateRequest201Response eventsCreateRequest(title, eventType, startTime, endTime, submittedBy, description, expectedStudents, roomId, externalAddress, annex11111111111111111111111111111111)

Create event request (club)

Club submits an event request with all required annexes. Each annex field must be named `annex_{templateId}`. Unknown/extra files are ignored.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getEventsApi();
final String title = title_example; // String | 
final String eventType = eventType_example; // String | 
final DateTime startTime = 2013-10-20T19:20:30+01:00; // DateTime | 
final DateTime endTime = 2013-10-20T19:20:30+01:00; // DateTime | 
final String submittedBy = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | Leader UUID (must be the club President or VicePresident).
final String description = description_example; // String | 
final num expectedStudents = 8.14; // num | 
final String roomId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | Exactly one of roomId or externalAddress must be provided.
final String externalAddress = externalAddress_example; // String | Exactly one of roomId or externalAddress must be provided.
final MultipartFile annex11111111111111111111111111111111 = BINARY_DATA_HERE; // MultipartFile | Annex file for template 11111111-1111-1111-1111-111111111111

try {
    final response = api.eventsCreateRequest(title, eventType, startTime, endTime, submittedBy, description, expectedStudents, roomId, externalAddress, annex11111111111111111111111111111111);
    print(response);
} catch on DioException (e) {
    print('Exception when calling EventsApi->eventsCreateRequest: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **title** | **String**|  | 
 **eventType** | **String**|  | 
 **startTime** | **DateTime**|  | 
 **endTime** | **DateTime**|  | 
 **submittedBy** | **String**| Leader UUID (must be the club President or VicePresident). | 
 **description** | **String**|  | [optional] 
 **expectedStudents** | **num**|  | [optional] 
 **roomId** | **String**| Exactly one of roomId or externalAddress must be provided. | [optional] 
 **externalAddress** | **String**| Exactly one of roomId or externalAddress must be provided. | [optional] 
 **annex11111111111111111111111111111111** | **MultipartFile**| Annex file for template 11111111-1111-1111-1111-111111111111 | [optional] 

### Return type

[**EventsCreateRequest201Response**](EventsCreateRequest201Response.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **eventsCreateRoom**
> EventsCreateRoom201Response eventsCreateRoom(createRoomDto)

Create internal room

Admin-only. Creates a new bookable internal room.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getEventsApi();
final CreateRoomDto createRoomDto = ; // CreateRoomDto | 

try {
    final response = api.eventsCreateRoom(createRoomDto);
    print(response);
} catch on DioException (e) {
    print('Exception when calling EventsApi->eventsCreateRoom: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createRoomDto** | [**CreateRoomDto**](CreateRoomDto.md)|  | 

### Return type

[**EventsCreateRoom201Response**](EventsCreateRoom201Response.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **eventsDeleteRoom**
> eventsDeleteRoom(id)

Delete room

Admin-only. Fails if room is used by pending requests or upcoming events.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getEventsApi();
final String id = id_example; // String | Room UUID

try {
    api.eventsDeleteRoom(id);
} catch on DioException (e) {
    print('Exception when calling EventsApi->eventsDeleteRoom: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Room UUID | 

### Return type

void (empty response body)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **eventsGetPublicById**
> EventsGetPublicById200Response eventsGetPublicById(id)

Get public event details

Public endpoint. Returns title, club, time, location, description, and isCancelled.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getEventsApi();
final String id = id_example; // String | Public event UUID

try {
    final response = api.eventsGetPublicById(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling EventsApi->eventsGetPublicById: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Public event UUID | 

### Return type

[**EventsGetPublicById200Response**](EventsGetPublicById200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **eventsGetPublicCalendar**
> EventsGetPublicCalendar200Response eventsGetPublicCalendar(page, limit)

Public calendar (upcoming events)

Returns upcoming events in the next N days (e.g. 30). No filters.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getEventsApi();
final num page = 1; // num | Page number (starting at 1)
final num limit = 10; // num | Items per page

try {
    final response = api.eventsGetPublicCalendar(page, limit);
    print(response);
} catch on DioException (e) {
    print('Exception when calling EventsApi->eventsGetPublicCalendar: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **num**| Page number (starting at 1) | [optional] 
 **limit** | **num**| Items per page | [optional] 

### Return type

[**EventsGetPublicCalendar200Response**](EventsGetPublicCalendar200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **eventsGetRequest**
> EventsGetRequest200Response eventsGetRequest(id)

Get single event request (role-shaped)

Admins get the full internal view (club contact + annexes). Clubs get their own view (no annexes).

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getEventsApi();
final String id = id_example; // String | Event request UUID

try {
    final response = api.eventsGetRequest(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling EventsApi->eventsGetRequest: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Event request UUID | 

### Return type

[**EventsGetRequest200Response**](EventsGetRequest200Response.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **eventsListRooms**
> EventsListRooms200Response eventsListRooms()

List internal rooms

Used by clubs when creating event requests and by admins to manage rooms.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getEventsApi();

try {
    final response = api.eventsListRooms();
    print(response);
} catch on DioException (e) {
    print('Exception when calling EventsApi->eventsListRooms: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**EventsListRooms200Response**](EventsListRooms200Response.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **eventsRejectRequest**
> EventsRejectRequest200Response eventsRejectRequest(id, rejectEventRequestDto)

Reject event request

Rejects the request with a mandatory comment.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getEventsApi();
final String id = id_example; // String | Event request UUID to reject
final RejectEventRequestDto rejectEventRequestDto = ; // RejectEventRequestDto | 

try {
    final response = api.eventsRejectRequest(id, rejectEventRequestDto);
    print(response);
} catch on DioException (e) {
    print('Exception when calling EventsApi->eventsRejectRequest: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Event request UUID to reject | 
 **rejectEventRequestDto** | [**RejectEventRequestDto**](RejectEventRequestDto.md)|  | 

### Return type

[**EventsRejectRequest200Response**](EventsRejectRequest200Response.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **eventsReschedule**
> EventsReschedule200Response eventsReschedule(id, rescheduleEventDto)

Reschedule event (admin)

Changes start/end time of an approved event.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getEventsApi();
final String id = id_example; // String | Event UUID to reschedule
final RescheduleEventDto rescheduleEventDto = ; // RescheduleEventDto | 

try {
    final response = api.eventsReschedule(id, rescheduleEventDto);
    print(response);
} catch on DioException (e) {
    print('Exception when calling EventsApi->eventsReschedule: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Event UUID to reschedule | 
 **rescheduleEventDto** | [**RescheduleEventDto**](RescheduleEventDto.md)|  | 

### Return type

[**EventsReschedule200Response**](EventsReschedule200Response.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

