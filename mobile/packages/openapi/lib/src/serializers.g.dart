// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serializers.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (Serializers().toBuilder()
      ..add($ApiResponseDto.serializer)
      ..add($PaginatedResponseDto.serializer)
      ..add(AcceptClubResponseDto.serializer)
      ..add(AcceptClubUserDto.serializer)
      ..add(AcceptClubUserDtoRoleEnum.serializer)
      ..add(AcceptStudentInviteDto.serializer)
      ..add(AcceptStudentResponseDto.serializer)
      ..add(AcceptStudentUserDto.serializer)
      ..add(AcceptStudentUserDtoRoleEnum.serializer)
      ..add(AdminEventRequestDetailResponseDto.serializer)
      ..add(AdminEventRequestDetailResponseDtoEventTypeEnum.serializer)
      ..add(AdminEventRequestDetailResponseDtoStatusEnum.serializer)
      ..add(AdminEventRequestListItemResponseDto.serializer)
      ..add(AdminEventRequestListItemResponseDtoEventTypeEnum.serializer)
      ..add(AdminEventRequestListItemResponseDtoStatusEnum.serializer)
      ..add(AdminEventRequestListItemResponseDtoSubmittedByRoleEnum.serializer)
      ..add(AdminEventRequestsQueryDto.serializer)
      ..add(AdminEventRequestsQueryDtoStatusEnum.serializer)
      ..add(AdminRenameClubDto.serializer)
      ..add(AdminRenameClubResponseDto.serializer)
      ..add(AnnexViewDto.serializer)
      ..add(AnnualReportResponseDto.serializer)
      ..add(ApproveEventRequestDto.serializer)
      ..add(AuthAcceptClubInvite200Response.serializer)
      ..add(AuthAcceptStudentInvite200Response.serializer)
      ..add(AuthAcceptStudentInvite401Response.serializer)
      ..add(AuthChangePassword200Response.serializer)
      ..add(AuthChangePassword400Response.serializer)
      ..add(AuthChangePassword403Response.serializer)
      ..add(AuthForgotPassword202Response.serializer)
      ..add(AuthInvitesBulk200Response.serializer)
      ..add(AuthInvitesPreview200Response.serializer)
      ..add(AuthInvitesPreview400Response.serializer)
      ..add(AuthInvitesResend202Response.serializer)
      ..add(AuthLogin200Response.serializer)
      ..add(AuthLogin400Response.serializer)
      ..add(AuthLogin401Response.serializer)
      ..add(AuthLogin429Response.serializer)
      ..add(AuthLogout200Response.serializer)
      ..add(AuthMe200Response.serializer)
      ..add(AuthMe401Response.serializer)
      ..add(AuthRefresh200Response.serializer)
      ..add(AuthRefresh400Response.serializer)
      ..add(AuthRefresh401Response.serializer)
      ..add(AuthResetPassword200Response.serializer)
      ..add(ChangeEventRoomDto.serializer)
      ..add(ChangePasswordDto.serializer)
      ..add(ChangePasswordResponseDto.serializer)
      ..add(ClubCardResponseDto.serializer)
      ..add(ClubEventRequestDetailResponseDto.serializer)
      ..add(ClubEventRequestDetailResponseDtoEventTypeEnum.serializer)
      ..add(ClubEventRequestDetailResponseDtoStatusEnum.serializer)
      ..add(ClubEventRequestListItemResponseDto.serializer)
      ..add(ClubEventRequestListItemResponseDtoStatusEnum.serializer)
      ..add(ClubEventRequestsQueryDto.serializer)
      ..add(ClubLeaderDto.serializer)
      ..add(ClubLeaderDtoRoleEnum.serializer)
      ..add(ClubLeaderDtoStudyLevelEnum.serializer)
      ..add(ClubLeaderInputDto.serializer)
      ..add(ClubLeaderInputDtoRoleEnum.serializer)
      ..add(ClubLeaderInputDtoStudyLevelEnum.serializer)
      ..add(ClubLeadersResponseDto.serializer)
      ..add(ClubPublicHeaderResponseDto.serializer)
      ..add(ClubSelfProfileResponseDto.serializer)
      ..add(ClubsFollow200Response.serializer)
      ..add(ClubsGenerateAnnualReport200Response.serializer)
      ..add(ClubsGetHeader200Response.serializer)
      ..add(ClubsGetLeaders200Response.serializer)
      ..add(ClubsGetOwnProfile200Response.serializer)
      ..add(ClubsList200Response.serializer)
      ..add(ClubsListResponseDto.serializer)
      ..add(ClubsRename200Response.serializer)
      ..add(ClubsReplaceLeaders200Response.serializer)
      ..add(ClubsUpdateProfile200Response.serializer)
      ..add(CreateEventRequestDto.serializer)
      ..add(CreateEventRequestDtoEventTypeEnum.serializer)
      ..add(CreateEventRequestResponseDto.serializer)
      ..add(CreateEventRequestResponseDtoStatusEnum.serializer)
      ..add(CreateRoomDto.serializer)
      ..add(EventCancelResponseDto.serializer)
      ..add(EventRequestApproveResponseDto.serializer)
      ..add(EventRequestApproveResponseDtoRequestStatusEnum.serializer)
      ..add(EventRequestRejectResponseDto.serializer)
      ..add(EventRequestRejectResponseDtoStatusEnum.serializer)
      ..add(EventRescheduleResponseDto.serializer)
      ..add(EventRoomChangeResponseDto.serializer)
      ..add(EventsAdminListRequests200Response.serializer)
      ..add(EventsAdminListRequests200ResponseAllOfData.serializer)
      ..add(EventsApproveRequest201Response.serializer)
      ..add(EventsCancel200Response.serializer)
      ..add(EventsChangeRoom200Response.serializer)
      ..add(EventsClubListOwnRequests200Response.serializer)
      ..add(EventsClubListOwnRequests200ResponseAllOfData.serializer)
      ..add(EventsCreateRequest201Response.serializer)
      ..add(EventsCreateRoom201Response.serializer)
      ..add(EventsGetPublicById200Response.serializer)
      ..add(EventsGetPublicCalendar200Response.serializer)
      ..add(EventsGetPublicCalendar200ResponseAllOfData.serializer)
      ..add(EventsGetRequest200Response.serializer)
      ..add(EventsGetRequest200ResponseOneOf.serializer)
      ..add(EventsGetRequest200ResponseOneOf1.serializer)
      ..add(EventsListRooms200Response.serializer)
      ..add(EventsRejectRequest200Response.serializer)
      ..add(EventsReschedule200Response.serializer)
      ..add(ForgotPasswordDto.serializer)
      ..add(ForgotPasswordResponseDto.serializer)
      ..add(GenerateAnnualReportDto.serializer)
      ..add(InvalidRowDto.serializer)
      ..add(InvitePreviewSummaryDto.serializer)
      ..add(InvitePreviewSummaryDtoAccountTypeEnum.serializer)
      ..add(InvitePreviewSummaryDtoModeEnum.serializer)
      ..add(InvitesBulkResponseDto.serializer)
      ..add(InvitesBulkResponseDtoAccountTypeEnum.serializer)
      ..add(InvitesBulkResponseDtoModeEnum.serializer)
      ..add(InvitesPreviewResponseDto.serializer)
      ..add(InvitesResendDto.serializer)
      ..add(InvitesResendResponseDto.serializer)
      ..add(LoginDto.serializer)
      ..add(LoginResponseDto.serializer)
      ..add(LoginUserSnapshotDto.serializer)
      ..add(LoginUserSnapshotDtoRoleEnum.serializer)
      ..add(MeResponseDto.serializer)
      ..add(MeResponseDtoRoleEnum.serializer)
      ..add(PublicEventDetailResponseDto.serializer)
      ..add(PublicEventDetailResponseDtoEventTypeEnum.serializer)
      ..add(PublicEventListItemResponseDto.serializer)
      ..add(RefreshResponseDto.serializer)
      ..add(RefreshTokenDto.serializer)
      ..add(RejectEventRequestDto.serializer)
      ..add(RescheduleEventDto.serializer)
      ..add(ResetPasswordDto.serializer)
      ..add(ResetPasswordResponseDto.serializer)
      ..add(ResponseErrorDetails.serializer)
      ..add(RoomCreateResponseDto.serializer)
      ..add(RoomResponseDto.serializer)
      ..add(SubscribeClubResponseDto.serializer)
      ..add(UpdateClubLeadersDto.serializer)
      ..add(UpdateClubLeadersResponseDto.serializer)
      ..add(UpdateClubProfileResponseDto.serializer)
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(AnnexViewDto)]),
          () => ListBuilder<AnnexViewDto>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType(BuiltList, const [const FullType(String)])
          ]),
          () => ListBuilder<BuiltList<String>>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType(BuiltList, const [const FullType(String)])
          ]),
          () => ListBuilder<BuiltList<String>>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType(BuiltList, const [const FullType(String)])
          ]),
          () => ListBuilder<BuiltList<String>>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType(BuiltList, const [const FullType(String)])
          ]),
          () => ListBuilder<BuiltList<String>>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(ClubCardResponseDto)]),
          () => ListBuilder<ClubCardResponseDto>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(ClubLeaderDto)]),
          () => ListBuilder<ClubLeaderDto>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(ClubLeaderDto)]),
          () => ListBuilder<ClubLeaderDto>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(ClubLeaderDto)]),
          () => ListBuilder<ClubLeaderDto>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(ClubLeaderInputDto)]),
          () => ListBuilder<ClubLeaderInputDto>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(InvalidRowDto)]),
          () => ListBuilder<InvalidRowDto>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>()))
    .build();

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
