# openapi.api.AuthApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://isimm-clubhub-api.onrender.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**authAcceptClubInvite**](AuthApi.md#authacceptclubinvite) | **POST** /api/v1/auth/invites/accept/club | Accept Club invite (creates club + 2 leaders)
[**authAcceptStudentInvite**](AuthApi.md#authacceptstudentinvite) | **POST** /api/v1/auth/invites/accept/student | Accept Student invite
[**authChangePassword**](AuthApi.md#authchangepassword) | **PATCH** /api/v1/auth/password/change | Change password (authenticated user)
[**authForgotPassword**](AuthApi.md#authforgotpassword) | **POST** /api/v1/auth/password/forgot | Start password reset flow (always returns 202)
[**authInvitesBulk**](AuthApi.md#authinvitesbulk) | **POST** /api/v1/auth/invites/bulk | Apply CSV import
[**authInvitesPreview**](AuthApi.md#authinvitespreview) | **POST** /api/v1/auth/invites/preview | Dry-run CSV import (no DB changes)
[**authInvitesResend**](AuthApi.md#authinvitesresend) | **POST** /api/v1/auth/invites/resend | Resend invite emails to pending users
[**authLogin**](AuthApi.md#authlogin) | **POST** /api/v1/auth/login | Login and issue access + refresh tokens
[**authLogout**](AuthApi.md#authlogout) | **POST** /api/v1/auth/logout | Revoke the current session
[**authMe**](AuthApi.md#authme) | **GET** /api/v1/auth/me | Get current authenticated user profile
[**authRefresh**](AuthApi.md#authrefresh) | **POST** /api/v1/auth/refresh | Rotate refresh token → new access + refresh pair
[**authResetPassword**](AuthApi.md#authresetpassword) | **POST** /api/v1/auth/password/reset | Complete password reset and revoke all sessions


# **authAcceptClubInvite**
> AuthAcceptClubInvite200Response authAcceptClubInvite()

Accept Club invite (creates club + 2 leaders)

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAuthApi();

try {
    final response = api.authAcceptClubInvite();
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->authAcceptClubInvite: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**AuthAcceptClubInvite200Response**](AuthAcceptClubInvite200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authAcceptStudentInvite**
> AuthAcceptStudentInvite200Response authAcceptStudentInvite(acceptStudentInviteDto)

Accept Student invite

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAuthApi();
final AcceptStudentInviteDto acceptStudentInviteDto = ; // AcceptStudentInviteDto | 

try {
    final response = api.authAcceptStudentInvite(acceptStudentInviteDto);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->authAcceptStudentInvite: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **acceptStudentInviteDto** | [**AcceptStudentInviteDto**](AcceptStudentInviteDto.md)|  | 

### Return type

[**AuthAcceptStudentInvite200Response**](AuthAcceptStudentInvite200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authChangePassword**
> AuthChangePassword200Response authChangePassword(changePasswordDto)

Change password (authenticated user)

Requires the current password. On success, all sessions are revoked and a re-login is required.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAuthApi();
final ChangePasswordDto changePasswordDto = ; // ChangePasswordDto | 

try {
    final response = api.authChangePassword(changePasswordDto);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->authChangePassword: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **changePasswordDto** | [**ChangePasswordDto**](ChangePasswordDto.md)|  | 

### Return type

[**AuthChangePassword200Response**](AuthChangePassword200Response.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authForgotPassword**
> AuthForgotPassword202Response authForgotPassword(forgotPasswordDto)

Start password reset flow (always returns 202)

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAuthApi();
final ForgotPasswordDto forgotPasswordDto = ; // ForgotPasswordDto | 

try {
    final response = api.authForgotPassword(forgotPasswordDto);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->authForgotPassword: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **forgotPasswordDto** | [**ForgotPasswordDto**](ForgotPasswordDto.md)|  | 

### Return type

[**AuthForgotPassword202Response**](AuthForgotPassword202Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authInvitesBulk**
> AuthInvitesBulk200Response authInvitesBulk(accountType, mode, file, confirm)

Apply CSV import

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAuthApi();
final String accountType = accountType_example; // String | 
final String mode = mode_example; // String | 
final MultipartFile file = BINARY_DATA_HERE; // MultipartFile | 
final String confirm = confirm_example; // String | 

try {
    final response = api.authInvitesBulk(accountType, mode, file, confirm);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->authInvitesBulk: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **accountType** | **String**|  | 
 **mode** | **String**|  | 
 **file** | **MultipartFile**|  | 
 **confirm** | **String**|  | [optional] 

### Return type

[**AuthInvitesBulk200Response**](AuthInvitesBulk200Response.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authInvitesPreview**
> AuthInvitesPreview200Response authInvitesPreview(accountType, mode, file)

Dry-run CSV import (no DB changes)

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAuthApi();
final String accountType = accountType_example; // String | 
final String mode = mode_example; // String | 
final MultipartFile file = BINARY_DATA_HERE; // MultipartFile | 

try {
    final response = api.authInvitesPreview(accountType, mode, file);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->authInvitesPreview: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **accountType** | **String**|  | 
 **mode** | **String**|  | 
 **file** | **MultipartFile**|  | 

### Return type

[**AuthInvitesPreview200Response**](AuthInvitesPreview200Response.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authInvitesResend**
> AuthInvitesResend202Response authInvitesResend(invitesResendDto)

Resend invite emails to pending users

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAuthApi();
final InvitesResendDto invitesResendDto = ; // InvitesResendDto | 

try {
    final response = api.authInvitesResend(invitesResendDto);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->authInvitesResend: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **invitesResendDto** | [**InvitesResendDto**](InvitesResendDto.md)|  | 

### Return type

[**AuthInvitesResend202Response**](AuthInvitesResend202Response.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authLogin**
> AuthLogin200Response authLogin(loginDto)

Login and issue access + refresh tokens

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAuthApi();
final LoginDto loginDto = ; // LoginDto | 

try {
    final response = api.authLogin(loginDto);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->authLogin: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **loginDto** | [**LoginDto**](LoginDto.md)|  | 

### Return type

[**AuthLogin200Response**](AuthLogin200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authLogout**
> AuthLogout200Response authLogout()

Revoke the current session

Invalidates the current session and refresh token. User must log in again.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAuthApi();

try {
    final response = api.authLogout();
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->authLogout: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**AuthLogout200Response**](AuthLogout200Response.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authMe**
> AuthMe200Response authMe()

Get current authenticated user profile

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAuthApi();

try {
    final response = api.authMe();
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->authMe: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**AuthMe200Response**](AuthMe200Response.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authRefresh**
> AuthRefresh200Response authRefresh(refreshTokenDto)

Rotate refresh token → new access + refresh pair

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAuthApi();
final RefreshTokenDto refreshTokenDto = ; // RefreshTokenDto | 

try {
    final response = api.authRefresh(refreshTokenDto);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->authRefresh: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **refreshTokenDto** | [**RefreshTokenDto**](RefreshTokenDto.md)|  | 

### Return type

[**AuthRefresh200Response**](AuthRefresh200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authResetPassword**
> AuthResetPassword200Response authResetPassword(resetPasswordDto)

Complete password reset and revoke all sessions

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAuthApi();
final ResetPasswordDto resetPasswordDto = ; // ResetPasswordDto | 

try {
    final response = api.authResetPassword(resetPasswordDto);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->authResetPassword: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **resetPasswordDto** | [**ResetPasswordDto**](ResetPasswordDto.md)|  | 

### Return type

[**AuthResetPassword200Response**](AuthResetPassword200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

