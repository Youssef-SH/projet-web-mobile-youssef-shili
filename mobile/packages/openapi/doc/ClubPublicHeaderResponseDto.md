# openapi.model.ClubPublicHeaderResponseDto

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** | Unique identifier of the club. | 
**name** | **String** | Official public name of the club. | 
**description** | **String** | Short description of the club’s mission, goals, and activities. | 
**logoUrl** | **String** | Publicly accessible URL of the club’s logo. | 
**followerCount** | **num** | Total number of students currently following this club. | 
**postCount** | **num** | Number of published posts by this club. | 
**isFollowed** | **bool** | Whether the authenticated student follows this club. Included only when the requester is a student. | [optional] 
**isActive** | **bool** | Whether this club’s account is currently active. Included only when the requester is an admin. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


