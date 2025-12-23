# openapi.api.ClubsApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://isimm-clubhub-api.onrender.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**clubsFollow**](ClubsApi.md#clubsfollow) | **POST** /api/v1/clubs/{id}/subscribe | Follow a club
[**clubsGenerateAnnualReport**](ClubsApi.md#clubsgenerateannualreport) | **POST** /api/v1/clubs/{id}/reports | Generate club annual report
[**clubsGenerateGlobalAnnualReport**](ClubsApi.md#clubsgenerateglobalannualreport) | **POST** /api/v1/clubs/reports | Generate global annual report
[**clubsGetAnnualReport**](ClubsApi.md#clubsgetannualreport) | **GET** /api/v1/clubs/{id}/reports/{year} | Get annual report metadata
[**clubsGetGlobalAnnualReport**](ClubsApi.md#clubsgetglobalannualreport) | **GET** /api/v1/clubs/reports/{year} | Get global annual report metadata
[**clubsGetHeader**](ClubsApi.md#clubsgetheader) | **GET** /api/v1/clubs/{id} | Get club public header / stats
[**clubsGetLeaders**](ClubsApi.md#clubsgetleaders) | **GET** /api/v1/clubs/{id}/leaders | Get leaders for a club (Admin)
[**clubsGetOwnProfile**](ClubsApi.md#clubsgetownprofile) | **GET** /api/v1/clubs/me | Get current club profile (self view)
[**clubsList**](ClubsApi.md#clubslist) | **GET** /api/v1/clubs | List all active clubs
[**clubsRename**](ClubsApi.md#clubsrename) | **PATCH** /api/v1/clubs/{id}/name | Rename a club (Admin only)
[**clubsReplaceLeaders**](ClubsApi.md#clubsreplaceleaders) | **PUT** /api/v1/clubs/me/leaders | Replace club leadership (President &amp; VicePresident)
[**clubsUnfollow**](ClubsApi.md#clubsunfollow) | **DELETE** /api/v1/clubs/{id}/subscribe | Unfollow a club
[**clubsUpdateProfile**](ClubsApi.md#clubsupdateprofile) | **PATCH** /api/v1/clubs/me | Update current club profile


# **clubsFollow**
> ClubsFollow200Response clubsFollow(id)

Follow a club

Idempotent. If already following, still returns isFollowed=true.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getClubsApi();
final String id = id_example; // String | Club UUID to follow

try {
    final response = api.clubsFollow(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ClubsApi->clubsFollow: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Club UUID to follow | 

### Return type

[**ClubsFollow200Response**](ClubsFollow200Response.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **clubsGenerateAnnualReport**
> ClubsGenerateAnnualReport200Response clubsGenerateAnnualReport(id, generateAnnualReportDto)

Generate club annual report

Clubs can generate their own report. Admins may also generate a report for any club.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getClubsApi();
final String id = id_example; // String | Club UUID
final GenerateAnnualReportDto generateAnnualReportDto = ; // GenerateAnnualReportDto | 

try {
    final response = api.clubsGenerateAnnualReport(id, generateAnnualReportDto);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ClubsApi->clubsGenerateAnnualReport: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Club UUID | 
 **generateAnnualReportDto** | [**GenerateAnnualReportDto**](GenerateAnnualReportDto.md)|  | 

### Return type

[**ClubsGenerateAnnualReport200Response**](ClubsGenerateAnnualReport200Response.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **clubsGenerateGlobalAnnualReport**
> ClubsGenerateAnnualReport200Response clubsGenerateGlobalAnnualReport(generateAnnualReportDto)

Generate global annual report

Admins may generate a global institute-wide annual report (no clubId).

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getClubsApi();
final GenerateAnnualReportDto generateAnnualReportDto = ; // GenerateAnnualReportDto | 

try {
    final response = api.clubsGenerateGlobalAnnualReport(generateAnnualReportDto);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ClubsApi->clubsGenerateGlobalAnnualReport: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **generateAnnualReportDto** | [**GenerateAnnualReportDto**](GenerateAnnualReportDto.md)|  | 

### Return type

[**ClubsGenerateAnnualReport200Response**](ClubsGenerateAnnualReport200Response.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **clubsGetAnnualReport**
> ClubsGenerateAnnualReport200Response clubsGetAnnualReport(id, year)

Get annual report metadata

Returns metadata and a signed URL for an existing generated report.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getClubsApi();
final String id = id_example; // String | Club UUID
final String year = year_example; // String | Report year as an integer (e.g. 2024)

try {
    final response = api.clubsGetAnnualReport(id, year);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ClubsApi->clubsGetAnnualReport: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Club UUID | 
 **year** | **String**| Report year as an integer (e.g. 2024) | 

### Return type

[**ClubsGenerateAnnualReport200Response**](ClubsGenerateAnnualReport200Response.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **clubsGetGlobalAnnualReport**
> ClubsGenerateAnnualReport200Response clubsGetGlobalAnnualReport(year)

Get global annual report metadata

Returns metadata and a signed URL for an existing generated GLOBAL report.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getClubsApi();
final String year = year_example; // String | Report year as an integer (e.g. 2024)

try {
    final response = api.clubsGetGlobalAnnualReport(year);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ClubsApi->clubsGetGlobalAnnualReport: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **year** | **String**| Report year as an integer (e.g. 2024) | 

### Return type

[**ClubsGenerateAnnualReport200Response**](ClubsGenerateAnnualReport200Response.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **clubsGetHeader**
> ClubsGetHeader200Response clubsGetHeader(id)

Get club public header / stats

Anonymous users see public info. Students also get isFollowed. Admins may view inactive clubs and get isActive.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getClubsApi();
final String id = id_example; // String | Club UUID

try {
    final response = api.clubsGetHeader(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ClubsApi->clubsGetHeader: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Club UUID | 

### Return type

[**ClubsGetHeader200Response**](ClubsGetHeader200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **clubsGetLeaders**
> ClubsGetLeaders200Response clubsGetLeaders(id)

Get leaders for a club (Admin)

Admin-only. Returns contact info of the club leadership.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getClubsApi();
final String id = id_example; // String | Club UUID

try {
    final response = api.clubsGetLeaders(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ClubsApi->clubsGetLeaders: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Club UUID | 

### Return type

[**ClubsGetLeaders200Response**](ClubsGetLeaders200Response.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **clubsGetOwnProfile**
> ClubsGetOwnProfile200Response clubsGetOwnProfile()

Get current club profile (self view)

Returns editable profile data (description, logo, leaders) for the authenticated club account.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getClubsApi();

try {
    final response = api.clubsGetOwnProfile();
    print(response);
} catch on DioException (e) {
    print('Exception when calling ClubsApi->clubsGetOwnProfile: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ClubsGetOwnProfile200Response**](ClubsGetOwnProfile200Response.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **clubsList**
> ClubsList200Response clubsList()

List all active clubs

Returns minimal public cards for all active clubs.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getClubsApi();

try {
    final response = api.clubsList();
    print(response);
} catch on DioException (e) {
    print('Exception when calling ClubsApi->clubsList: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ClubsList200Response**](ClubsList200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **clubsRename**
> ClubsRename200Response clubsRename(id, adminRenameClubDto)

Rename a club (Admin only)

Updates the club display name. This will be visible everywhere.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getClubsApi();
final String id = id_example; // String | Club UUID to rename
final AdminRenameClubDto adminRenameClubDto = ; // AdminRenameClubDto | 

try {
    final response = api.clubsRename(id, adminRenameClubDto);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ClubsApi->clubsRename: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Club UUID to rename | 
 **adminRenameClubDto** | [**AdminRenameClubDto**](AdminRenameClubDto.md)|  | 

### Return type

[**ClubsRename200Response**](ClubsRename200Response.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **clubsReplaceLeaders**
> ClubsReplaceLeaders200Response clubsReplaceLeaders(updateClubLeadersDto)

Replace club leadership (President & VicePresident)

Exactly two leaders must be provided: President and VicePresident. Fully replaces previous leaders.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getClubsApi();
final UpdateClubLeadersDto updateClubLeadersDto = ; // UpdateClubLeadersDto | 

try {
    final response = api.clubsReplaceLeaders(updateClubLeadersDto);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ClubsApi->clubsReplaceLeaders: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **updateClubLeadersDto** | [**UpdateClubLeadersDto**](UpdateClubLeadersDto.md)|  | 

### Return type

[**ClubsReplaceLeaders200Response**](ClubsReplaceLeaders200Response.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **clubsUnfollow**
> ClubsFollow200Response clubsUnfollow(id)

Unfollow a club

Idempotent. If you were not following, returns isFollowed=false anyway.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getClubsApi();
final String id = id_example; // String | Club UUID to unfollow

try {
    final response = api.clubsUnfollow(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ClubsApi->clubsUnfollow: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Club UUID to unfollow | 

### Return type

[**ClubsFollow200Response**](ClubsFollow200Response.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **clubsUpdateProfile**
> ClubsUpdateProfile200Response clubsUpdateProfile(description, logo)

Update current club profile

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getClubsApi();
final String description = description_example; // String | Short public description of the club for the directory page.
final MultipartFile logo = BINARY_DATA_HERE; // MultipartFile | New logo file to upload (image). Optional.

try {
    final response = api.clubsUpdateProfile(description, logo);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ClubsApi->clubsUpdateProfile: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **description** | **String**| Short public description of the club for the directory page. | [optional] 
 **logo** | **MultipartFile**| New logo file to upload (image). Optional. | [optional] 

### Return type

[**ClubsUpdateProfile200Response**](ClubsUpdateProfile200Response.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

