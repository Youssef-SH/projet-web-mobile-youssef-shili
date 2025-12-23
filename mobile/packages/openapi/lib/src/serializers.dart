//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_import

import 'package:one_of_serializer/any_of_serializer.dart';
import 'package:one_of_serializer/one_of_serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:openapi/src/date_serializer.dart';
import 'package:openapi/src/model/date.dart';

import 'package:openapi/src/model/accept_club_response_dto.dart';
import 'package:openapi/src/model/accept_club_user_dto.dart';
import 'package:openapi/src/model/accept_student_invite_dto.dart';
import 'package:openapi/src/model/accept_student_response_dto.dart';
import 'package:openapi/src/model/accept_student_user_dto.dart';
import 'package:openapi/src/model/admin_event_request_detail_response_dto.dart';
import 'package:openapi/src/model/admin_event_request_list_item_response_dto.dart';
import 'package:openapi/src/model/admin_event_requests_query_dto.dart';
import 'package:openapi/src/model/admin_rename_club_dto.dart';
import 'package:openapi/src/model/admin_rename_club_response_dto.dart';
import 'package:openapi/src/model/annex_view_dto.dart';
import 'package:openapi/src/model/annual_report_response_dto.dart';
import 'package:openapi/src/model/api_response_dto.dart';
import 'package:openapi/src/model/approve_event_request_dto.dart';
import 'package:openapi/src/model/auth_accept_club_invite200_response.dart';
import 'package:openapi/src/model/auth_accept_student_invite200_response.dart';
import 'package:openapi/src/model/auth_accept_student_invite401_response.dart';
import 'package:openapi/src/model/auth_change_password200_response.dart';
import 'package:openapi/src/model/auth_change_password400_response.dart';
import 'package:openapi/src/model/auth_change_password403_response.dart';
import 'package:openapi/src/model/auth_forgot_password202_response.dart';
import 'package:openapi/src/model/auth_invites_bulk200_response.dart';
import 'package:openapi/src/model/auth_invites_preview200_response.dart';
import 'package:openapi/src/model/auth_invites_preview400_response.dart';
import 'package:openapi/src/model/auth_invites_resend202_response.dart';
import 'package:openapi/src/model/auth_login200_response.dart';
import 'package:openapi/src/model/auth_login400_response.dart';
import 'package:openapi/src/model/auth_login401_response.dart';
import 'package:openapi/src/model/auth_login429_response.dart';
import 'package:openapi/src/model/auth_logout200_response.dart';
import 'package:openapi/src/model/auth_me200_response.dart';
import 'package:openapi/src/model/auth_me401_response.dart';
import 'package:openapi/src/model/auth_refresh200_response.dart';
import 'package:openapi/src/model/auth_refresh400_response.dart';
import 'package:openapi/src/model/auth_refresh401_response.dart';
import 'package:openapi/src/model/auth_reset_password200_response.dart';
import 'package:openapi/src/model/change_event_room_dto.dart';
import 'package:openapi/src/model/change_password_dto.dart';
import 'package:openapi/src/model/change_password_response_dto.dart';
import 'package:openapi/src/model/club_card_response_dto.dart';
import 'package:openapi/src/model/club_event_request_detail_response_dto.dart';
import 'package:openapi/src/model/club_event_request_list_item_response_dto.dart';
import 'package:openapi/src/model/club_event_requests_query_dto.dart';
import 'package:openapi/src/model/club_leader_dto.dart';
import 'package:openapi/src/model/club_leader_input_dto.dart';
import 'package:openapi/src/model/club_leaders_response_dto.dart';
import 'package:openapi/src/model/club_public_header_response_dto.dart';
import 'package:openapi/src/model/club_self_profile_response_dto.dart';
import 'package:openapi/src/model/clubs_follow200_response.dart';
import 'package:openapi/src/model/clubs_generate_annual_report200_response.dart';
import 'package:openapi/src/model/clubs_get_header200_response.dart';
import 'package:openapi/src/model/clubs_get_leaders200_response.dart';
import 'package:openapi/src/model/clubs_get_own_profile200_response.dart';
import 'package:openapi/src/model/clubs_list200_response.dart';
import 'package:openapi/src/model/clubs_list_response_dto.dart';
import 'package:openapi/src/model/clubs_rename200_response.dart';
import 'package:openapi/src/model/clubs_replace_leaders200_response.dart';
import 'package:openapi/src/model/clubs_update_profile200_response.dart';
import 'package:openapi/src/model/create_event_request_dto.dart';
import 'package:openapi/src/model/create_event_request_response_dto.dart';
import 'package:openapi/src/model/create_room_dto.dart';
import 'package:openapi/src/model/event_cancel_response_dto.dart';
import 'package:openapi/src/model/event_request_approve_response_dto.dart';
import 'package:openapi/src/model/event_request_reject_response_dto.dart';
import 'package:openapi/src/model/event_reschedule_response_dto.dart';
import 'package:openapi/src/model/event_room_change_response_dto.dart';
import 'package:openapi/src/model/events_admin_list_requests200_response.dart';
import 'package:openapi/src/model/events_admin_list_requests200_response_all_of_data.dart';
import 'package:openapi/src/model/events_approve_request201_response.dart';
import 'package:openapi/src/model/events_cancel200_response.dart';
import 'package:openapi/src/model/events_change_room200_response.dart';
import 'package:openapi/src/model/events_club_list_own_requests200_response.dart';
import 'package:openapi/src/model/events_club_list_own_requests200_response_all_of_data.dart';
import 'package:openapi/src/model/events_create_request201_response.dart';
import 'package:openapi/src/model/events_create_room201_response.dart';
import 'package:openapi/src/model/events_get_public_by_id200_response.dart';
import 'package:openapi/src/model/events_get_public_calendar200_response.dart';
import 'package:openapi/src/model/events_get_public_calendar200_response_all_of_data.dart';
import 'package:openapi/src/model/events_get_request200_response.dart';
import 'package:openapi/src/model/events_get_request200_response_one_of.dart';
import 'package:openapi/src/model/events_get_request200_response_one_of1.dart';
import 'package:openapi/src/model/events_list_rooms200_response.dart';
import 'package:openapi/src/model/events_reject_request200_response.dart';
import 'package:openapi/src/model/events_reschedule200_response.dart';
import 'package:openapi/src/model/forgot_password_dto.dart';
import 'package:openapi/src/model/forgot_password_response_dto.dart';
import 'package:openapi/src/model/generate_annual_report_dto.dart';
import 'package:openapi/src/model/invalid_row_dto.dart';
import 'package:openapi/src/model/invite_preview_summary_dto.dart';
import 'package:openapi/src/model/invites_bulk_response_dto.dart';
import 'package:openapi/src/model/invites_preview_response_dto.dart';
import 'package:openapi/src/model/invites_resend_dto.dart';
import 'package:openapi/src/model/invites_resend_response_dto.dart';
import 'package:openapi/src/model/login_dto.dart';
import 'package:openapi/src/model/login_response_dto.dart';
import 'package:openapi/src/model/login_user_snapshot_dto.dart';
import 'package:openapi/src/model/me_response_dto.dart';
import 'package:openapi/src/model/paginated_response_dto.dart';
import 'package:openapi/src/model/public_event_detail_response_dto.dart';
import 'package:openapi/src/model/public_event_list_item_response_dto.dart';
import 'package:openapi/src/model/refresh_response_dto.dart';
import 'package:openapi/src/model/refresh_token_dto.dart';
import 'package:openapi/src/model/reject_event_request_dto.dart';
import 'package:openapi/src/model/reschedule_event_dto.dart';
import 'package:openapi/src/model/reset_password_dto.dart';
import 'package:openapi/src/model/reset_password_response_dto.dart';
import 'package:openapi/src/model/response_error_details.dart';
import 'package:openapi/src/model/room_create_response_dto.dart';
import 'package:openapi/src/model/room_response_dto.dart';
import 'package:openapi/src/model/subscribe_club_response_dto.dart';
import 'package:openapi/src/model/update_club_leaders_dto.dart';
import 'package:openapi/src/model/update_club_leaders_response_dto.dart';
import 'package:openapi/src/model/update_club_profile_response_dto.dart';

part 'serializers.g.dart';

@SerializersFor([
  AcceptClubResponseDto,
  AcceptClubUserDto,
  AcceptStudentInviteDto,
  AcceptStudentResponseDto,
  AcceptStudentUserDto,
  AdminEventRequestDetailResponseDto,
  AdminEventRequestListItemResponseDto,
  AdminEventRequestsQueryDto,
  AdminRenameClubDto,
  AdminRenameClubResponseDto,
  AnnexViewDto,
  AnnualReportResponseDto,
  ApiResponseDto,$ApiResponseDto,
  ApproveEventRequestDto,
  AuthAcceptClubInvite200Response,
  AuthAcceptStudentInvite200Response,
  AuthAcceptStudentInvite401Response,
  AuthChangePassword200Response,
  AuthChangePassword400Response,
  AuthChangePassword403Response,
  AuthForgotPassword202Response,
  AuthInvitesBulk200Response,
  AuthInvitesPreview200Response,
  AuthInvitesPreview400Response,
  AuthInvitesResend202Response,
  AuthLogin200Response,
  AuthLogin400Response,
  AuthLogin401Response,
  AuthLogin429Response,
  AuthLogout200Response,
  AuthMe200Response,
  AuthMe401Response,
  AuthRefresh200Response,
  AuthRefresh400Response,
  AuthRefresh401Response,
  AuthResetPassword200Response,
  ChangeEventRoomDto,
  ChangePasswordDto,
  ChangePasswordResponseDto,
  ClubCardResponseDto,
  ClubEventRequestDetailResponseDto,
  ClubEventRequestListItemResponseDto,
  ClubEventRequestsQueryDto,
  ClubLeaderDto,
  ClubLeaderInputDto,
  ClubLeadersResponseDto,
  ClubPublicHeaderResponseDto,
  ClubSelfProfileResponseDto,
  ClubsFollow200Response,
  ClubsGenerateAnnualReport200Response,
  ClubsGetHeader200Response,
  ClubsGetLeaders200Response,
  ClubsGetOwnProfile200Response,
  ClubsList200Response,
  ClubsListResponseDto,
  ClubsRename200Response,
  ClubsReplaceLeaders200Response,
  ClubsUpdateProfile200Response,
  CreateEventRequestDto,
  CreateEventRequestResponseDto,
  CreateRoomDto,
  EventCancelResponseDto,
  EventRequestApproveResponseDto,
  EventRequestRejectResponseDto,
  EventRescheduleResponseDto,
  EventRoomChangeResponseDto,
  EventsAdminListRequests200Response,
  EventsAdminListRequests200ResponseAllOfData,
  EventsApproveRequest201Response,
  EventsCancel200Response,
  EventsChangeRoom200Response,
  EventsClubListOwnRequests200Response,
  EventsClubListOwnRequests200ResponseAllOfData,
  EventsCreateRequest201Response,
  EventsCreateRoom201Response,
  EventsGetPublicById200Response,
  EventsGetPublicCalendar200Response,
  EventsGetPublicCalendar200ResponseAllOfData,
  EventsGetRequest200Response,
  EventsGetRequest200ResponseOneOf,
  EventsGetRequest200ResponseOneOf1,
  EventsListRooms200Response,
  EventsRejectRequest200Response,
  EventsReschedule200Response,
  ForgotPasswordDto,
  ForgotPasswordResponseDto,
  GenerateAnnualReportDto,
  InvalidRowDto,
  InvitePreviewSummaryDto,
  InvitesBulkResponseDto,
  InvitesPreviewResponseDto,
  InvitesResendDto,
  InvitesResendResponseDto,
  LoginDto,
  LoginResponseDto,
  LoginUserSnapshotDto,
  MeResponseDto,
  PaginatedResponseDto,$PaginatedResponseDto,
  PublicEventDetailResponseDto,
  PublicEventListItemResponseDto,
  RefreshResponseDto,
  RefreshTokenDto,
  RejectEventRequestDto,
  RescheduleEventDto,
  ResetPasswordDto,
  ResetPasswordResponseDto,
  ResponseErrorDetails,
  RoomCreateResponseDto,
  RoomResponseDto,
  SubscribeClubResponseDto,
  UpdateClubLeadersDto,
  UpdateClubLeadersResponseDto,
  UpdateClubProfileResponseDto,
])
Serializers serializers = (_$serializers.toBuilder()
      ..add(ApiResponseDto.serializer)
      ..add(PaginatedResponseDto.serializer)
      ..add(const OneOfSerializer())
      ..add(const AnyOfSerializer())
      ..add(const DateSerializer())
      ..add(Iso8601DateTimeSerializer())
    ).build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
