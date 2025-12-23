# openapi.model.LoginUserSnapshotDto

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** | Unique identifier of the authenticated user. | 
**email** | **String** | Email address of the authenticated user | 
**role** | **String** | Role assigned to the authenticated user | 
**fullName** | [**JsonObject**](.md) | Full name of the user (Admin & Student only). Null for club accounts. | 
**clubId** | [**JsonObject**](.md) | Club ID if the user is a club account, otherwise null | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


