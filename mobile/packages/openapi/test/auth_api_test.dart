import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for AuthApi
void main() {
  final instance = Openapi().getAuthApi();

  group(AuthApi, () {
    // Accept Club invite (creates club + 2 leaders)
    //
    //Future<AuthAcceptClubInvite200Response> authAcceptClubInvite() async
    test('test authAcceptClubInvite', () async {
      // TODO
    });

    // Accept Student invite
    //
    //Future<AuthAcceptStudentInvite200Response> authAcceptStudentInvite(AcceptStudentInviteDto acceptStudentInviteDto) async
    test('test authAcceptStudentInvite', () async {
      // TODO
    });

    // Change password (authenticated user)
    //
    // Requires the current password. On success, all sessions are revoked and a re-login is required.
    //
    //Future<AuthChangePassword200Response> authChangePassword(ChangePasswordDto changePasswordDto) async
    test('test authChangePassword', () async {
      // TODO
    });

    // Start password reset flow (always returns 202)
    //
    //Future<AuthForgotPassword202Response> authForgotPassword(ForgotPasswordDto forgotPasswordDto) async
    test('test authForgotPassword', () async {
      // TODO
    });

    // Apply CSV import
    //
    //Future<AuthInvitesBulk200Response> authInvitesBulk(String accountType, String mode, MultipartFile file, { String confirm }) async
    test('test authInvitesBulk', () async {
      // TODO
    });

    // Dry-run CSV import (no DB changes)
    //
    //Future<AuthInvitesPreview200Response> authInvitesPreview(String accountType, String mode, MultipartFile file) async
    test('test authInvitesPreview', () async {
      // TODO
    });

    // Resend invite emails to pending users
    //
    //Future<AuthInvitesResend202Response> authInvitesResend(InvitesResendDto invitesResendDto) async
    test('test authInvitesResend', () async {
      // TODO
    });

    // Login and issue access + refresh tokens
    //
    //Future<AuthLogin200Response> authLogin(LoginDto loginDto) async
    test('test authLogin', () async {
      // TODO
    });

    // Revoke the current session
    //
    // Invalidates the current session and refresh token. User must log in again.
    //
    //Future<AuthLogout200Response> authLogout() async
    test('test authLogout', () async {
      // TODO
    });

    // Get current authenticated user profile
    //
    //Future<AuthMe200Response> authMe() async
    test('test authMe', () async {
      // TODO
    });

    // Rotate refresh token → new access + refresh pair
    //
    //Future<AuthRefresh200Response> authRefresh(RefreshTokenDto refreshTokenDto) async
    test('test authRefresh', () async {
      // TODO
    });

    // Complete password reset and revoke all sessions
    //
    //Future<AuthResetPassword200Response> authResetPassword(ResetPasswordDto resetPasswordDto) async
    test('test authResetPassword', () async {
      // TODO
    });

  });
}
