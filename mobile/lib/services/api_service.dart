import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Custom exception for API errors with detailed context
class ApiException implements Exception {
  final String message;
  final int? statusCode;
  final dynamic details;

  ApiException(this.message, {this.statusCode, this.details});

  @override
  String toString() => 'ApiException($statusCode): $message ${details ?? ''}';
}

/// Professional API service with automatic token management and error handling
///
/// Features:
/// - Automatic token refresh on 401 errors
/// - Consistent response parsing for nested data structures
/// - Comprehensive error handling
/// - Request/response logging in debug mode
class ApiService {
  // ========================================================================
  // CONSTANTS & PRIVATE FIELDS
  // ========================================================================

  static const _kAccessTokenKey = 'access_token';
  static const _kRefreshTokenKey = 'refresh_token';

  final String baseUrl;
  late final Dio dio;
  final FlutterSecureStorage _secureStorage;

  // Refresh token locking mechanism
  bool _refreshing = false;
  Completer<void>? _refreshCompleter;

  // ========================================================================
  // CONSTRUCTOR & INITIALIZATION
  // ========================================================================

  ApiService({
    this.baseUrl = 'https://isimm-clubhub-api.onrender.com/api/v1',
    FlutterSecureStorage? secureStorage,
    BaseOptions? dioOptions,
  }) : _secureStorage = secureStorage ?? const FlutterSecureStorage() {
    dio = Dio(
      dioOptions ??
          BaseOptions(
            baseUrl: baseUrl,
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
            connectTimeout: const Duration(seconds: 30),
            receiveTimeout: const Duration(seconds: 30),
            validateStatus: (status) {
              // Accept all 2xx status codes as successful
              return status != null && status >= 200 && status < 300;
            },
          ),
    );

    _setupInterceptors();
  }

  // ========================================================================
  // INTERCEPTOR SETUP
  // ========================================================================

  void _setupInterceptors() {
    dio.interceptors.add(
      QueuedInterceptorsWrapper(
        onRequest: _onRequest,
        onResponse: _onResponse,
        onError: _onError,
      ),
    );
  }

  /// Attach authorization token to requests
  Future<void> _onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _secureStorage.read(key: _kAccessTokenKey);
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    // Log request in debug mode
    if (kDebugMode) {
      debugPrint('🌐 [${options.method}] ${options.uri}');
      if (options.data != null) {
        debugPrint('📤 Request: ${options.data}');
      }
    }

    handler.next(options);
  }

  /// Log successful responses in debug mode
  void _onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      debugPrint('✅ [${response.statusCode}] ${response.requestOptions.uri}');
      debugPrint('📥 Response: ${response.data}');
    }
    handler.next(response);
  }

  /// Handle errors with automatic token refresh on 401
  Future<void> _onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (kDebugMode) {
      debugPrint('❌ [${err.response?.statusCode}] ${err.requestOptions.uri}');
      debugPrint('Error: ${err.message}');
      if (err.response?.data != null) {
        debugPrint('Response: ${err.response?.data}');
      }
    }

    final response = err.response;
    final requestOptions = err.requestOptions;

    // Attempt token refresh on 401 for non-auth endpoints
    if (response != null &&
        response.statusCode == 401 &&
        !_isAuthEndpoint(requestOptions.path)) {
      try {
        await _handleRefreshToken();

        // Retry original request with new token
        final newToken = await _secureStorage.read(key: _kAccessTokenKey);
        if (newToken != null && newToken.isNotEmpty) {
          final opts = Options(
            method: requestOptions.method,
            headers: Map<String, dynamic>.from(requestOptions.headers),
          );
          opts.headers!['Authorization'] = 'Bearer $newToken';

          final retryResponse = await dio.request<dynamic>(
            requestOptions.path,
            data: requestOptions.data,
            queryParameters: requestOptions.queryParameters,
            options: opts,
          );

          return handler.resolve(retryResponse);
        }
      } catch (e) {
        if (kDebugMode) {
          debugPrint('🔄 Token refresh failed: $e');
        }
        // Let the original 401 error propagate
      }
    }

    handler.next(err);
  }

  // ========================================================================
  // HELPER METHODS
  // ========================================================================

  /// Check if path is an authentication endpoint (no refresh needed)
  bool _isAuthEndpoint(String path) {
    final p = path.toLowerCase();
    return p.contains('/auth/login') ||
        p.contains('/auth/refresh') ||
        p.contains('/auth/invites') ||
        p.contains('/auth/password') ||
        p.contains('/auth/register');
  }

  /// Parse nested response data structure: { code, message, data }
  Map<String, dynamic> _extractData(Response resp) {
    final responseData = resp.data as Map<String, dynamic>;

    // Extract nested data object if it exists
    if (responseData.containsKey('data')) {
      final data = responseData['data'];
      if (data is Map<String, dynamic>) {
        return data;
      }
    }

    // Return full response if no nested structure
    return responseData;
  }

  /// Parse list responses: { code, message, data: [...] }
  List<dynamic> _extractList(Response resp) {
    final responseData = resp.data;

    if (responseData is Map && responseData.containsKey('data')) {
      final data = responseData['data'];
      if (data is List) {
        return data;
      }
    }

    if (responseData is List) {
      return responseData;
    }

    return [];
  }

  /// Convert DioException to ApiException with server error details
  ApiException _wrapDioError(DioException e) {
    final response = e.response;

    if (response?.data != null) {
      final data = response!.data;

      // Handle standard error structure: { error: { code, message, details } }
      if (data is Map && data.containsKey('error')) {
        final error = data['error'];
        final message = error is Map
            ? (error['message'] ?? e.message)
            : e.message;
        return ApiException(
          message.toString(),
          statusCode: response.statusCode,
          details: error,
        );
      }

      // Handle simple message structure
      if (data is Map && data.containsKey('message')) {
        return ApiException(
          data['message'].toString(),
          statusCode: response.statusCode,
          details: data,
        );
      }

      // Fallback to stringified data
      return ApiException(
        e.message ?? 'Request failed',
        statusCode: response.statusCode,
        details: data,
      );
    }

    // Network errors
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout) {
      return ApiException('Connection timeout. Please try again.');
    }

    if (e.type == DioExceptionType.connectionError) {
      return ApiException(
        'Connection error. Please check your internet connection.',
      );
    }

    return ApiException(e.message ?? 'An unexpected error occurred');
  }

  // ========================================================================
  // TOKEN MANAGEMENT
  // ========================================================================

  /// Refresh access token using refresh token with single-flight pattern
  Future<void> _handleRefreshToken() async {
    // If already refreshing, wait for that operation to complete
    if (_refreshing) {
      if (_refreshCompleter != null) {
        return _refreshCompleter!.future;
      }
      return;
    }

    _refreshing = true;
    _refreshCompleter = Completer<void>();

    try {
      final refreshToken = await _secureStorage.read(key: _kRefreshTokenKey);
      if (refreshToken == null || refreshToken.isEmpty) {
        throw ApiException('No refresh token available', statusCode: 401);
      }

      final resp = await dio.post(
        '/auth/refresh',
        data: {'refreshToken': refreshToken},
        options: Options(extra: {'skipAuthInterceptor': true}),
      );

      final data = _extractData(resp);
      final newAccess = data['accessToken'] as String?;
      final newRefresh = data['refreshToken'] as String?;

      if (newAccess == null || newRefresh == null) {
        throw ApiException('Invalid refresh response', statusCode: 500);
      }

      await _secureStorage.write(key: _kAccessTokenKey, value: newAccess);
      await _secureStorage.write(key: _kRefreshTokenKey, value: newRefresh);

      _refreshCompleter!.complete();
    } catch (e) {
      // Clear tokens on refresh failure (force re-login)
      await clearTokens();
      _refreshCompleter!.completeError(e);
      rethrow;
    } finally {
      _refreshing = false;
      _refreshCompleter = null;
    }
  }

  /// Get stored access token
  Future<String?> getAccessToken() =>
      _secureStorage.read(key: _kAccessTokenKey);

  /// Get stored refresh token
  Future<String?> getRefreshToken() =>
      _secureStorage.read(key: _kRefreshTokenKey);

  /// Clear all stored tokens
  Future<void> clearTokens() async {
    await _secureStorage.delete(key: _kAccessTokenKey);
    await _secureStorage.delete(key: _kRefreshTokenKey);
  }

  /// Check if user is authenticated (has valid tokens)
  Future<bool> isAuthenticated() async {
    final accessToken = await getAccessToken();
    return accessToken != null && accessToken.isNotEmpty;
  }

  // ========================================================================
  // AUTHENTICATION ENDPOINTS
  // ========================================================================

  /// Login with email and password
  ///
  /// Returns user data along with stored tokens
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
    bool rememberMe = true,
  }) async {
    try {
      final resp = await dio.post(
        '/auth/login',
        data: {
          'email': email.trim(),
          'password': password,
          'rememberMe': rememberMe,
        },
      );

      final data = _extractData(resp);
      final access = data['accessToken'] as String?;
      final refresh = data['refreshToken'] as String?;

      if (access == null || refresh == null) {
        throw ApiException(
          'Missing tokens in login response',
          statusCode: resp.statusCode,
          details: data,
        );
      }

      await _secureStorage.write(key: _kAccessTokenKey, value: access);
      await _secureStorage.write(key: _kRefreshTokenKey, value: refresh);

      return data;
    } on DioException catch (e) {
      throw _wrapDioError(e);
    }
  }

  /// Logout and revoke tokens
  ///
  /// Calls server endpoint then clears local tokens
  Future<void> logout() async {
    try {
      await dio.post('/auth/logout');
    } catch (e) {
      if (kDebugMode) {
        debugPrint('Logout server call failed: $e');
      }
      // Continue to clear local tokens even if server call fails
    } finally {
      await clearTokens();
    }
  }

  /// Get current authenticated user profile
  Future<Map<String, dynamic>> getMe() async {
    try {
      final resp = await dio.get('/auth/me');
      return _extractData(resp);
    } on DioException catch (e) {
      throw _wrapDioError(e);
    }
  }

  // ========================================================================
  // CLUB ENDPOINTS
  // ========================================================================

  /// Get all clubs
  Future<List<dynamic>> getClubs() async {
    try {
      final resp = await dio.get('/clubs');
      return _extractList(resp);
    } on DioException catch (e) {
      throw _wrapDioError(e);
    }
  }

  /// Get specific club by ID
  Future<Map<String, dynamic>> getClub(String id) async {
    try {
      final resp = await dio.get('/clubs/$id');
      return _extractData(resp);
    } on DioException catch (e) {
      throw _wrapDioError(e);
    }
  }

  /// Get current user's club profile
  Future<Map<String, dynamic>> getMyClubProfile() async {
    try {
      final resp = await dio.get('/clubs/me');
      return _extractData(resp);
    } on DioException catch (e) {
      throw _wrapDioError(e);
    }
  }

  /// Update current user's club profile
  Future<Map<String, dynamic>> updateMyClubProfile({
    String? description,
    String? logoUrl,
  }) async {
    try {
      final body = <String, dynamic>{};
      if (description != null) body['description'] = description;
      if (logoUrl != null) body['logoUrl'] = logoUrl;

      final resp = await dio.patch('/clubs/me', data: body);
      return _extractData(resp);
    } on DioException catch (e) {
      throw _wrapDioError(e);
    }
  }

  /// Update club leaders
  Future<Map<String, dynamic>> updateClubLeaders(
    List<Map<String, dynamic>> leaders,
  ) async {
    try {
      final resp = await dio.put(
        '/clubs/me/leaders',
        data: {'leaders': leaders},
      );
      return _extractData(resp);
    } on DioException catch (e) {
      throw _wrapDioError(e);
    }
  }

  /// Subscribe to a club
  Future<Map<String, dynamic>> subscribeToClub(String clubId) async {
    try {
      final resp = await dio.post('/clubs/$clubId/subscribe');
      return _extractData(resp);
    } on DioException catch (e) {
      throw _wrapDioError(e);
    }
  }

  /// Unsubscribe from a club
  Future<Map<String, dynamic>> unsubscribeFromClub(String clubId) async {
    try {
      final resp = await dio.delete('/clubs/$clubId/subscribe');
      return _extractData(resp);
    } on DioException catch (e) {
      throw _wrapDioError(e);
    }
  }

  // ========================================================================
  // CLUB REPORTS
  // ========================================================================

  /// Create a new report
  Future<Map<String, dynamic>> createReport({
    String? clubId,
    required int year,
  }) async {
    try {
      final path = clubId == null
          ? '/clubs/null/reports'
          : '/clubs/$clubId/reports';

      final resp = await dio.post(path, data: {'year': year});
      return _extractData(resp);
    } on DioException catch (e) {
      throw _wrapDioError(e);
    }
  }

  /// Get report for a specific year
  Future<Map<String, dynamic>> getReport({
    String? clubId,
    required int year,
  }) async {
    try {
      final path = clubId == null
          ? '/clubs/null/reports/$year'
          : '/clubs/$clubId/reports/$year';

      final resp = await dio.get(path);
      return _extractData(resp);
    } on DioException catch (e) {
      throw _wrapDioError(e);
    }
  }

  // ========================================================================
  // EVENT ENDPOINTS
  // ========================================================================

  /// Create event request (club only)
  Future<Map<String, dynamic>> createEventRequest(
    Map<String, dynamic> eventData,
  ) async {
    try {
      final resp = await dio.post('/events/requests', data: eventData);
      return _extractData(resp);
    } on DioException catch (e) {
      throw _wrapDioError(e);
    }
  }

  /// Get event request details
  Future<Map<String, dynamic>> getEventRequest(String id) async {
    try {
      final resp = await dio.get('/events/requests/$id');
      return _extractData(resp);
    } on DioException catch (e) {
      throw _wrapDioError(e);
    }
  }

  /// Approve event request (admin only)
  Future<Map<String, dynamic>> approveEventRequest(
    String id, {
    String? comment,
  }) async {
    try {
      final resp = await dio.post(
        '/events/requests/$id/approve',
        data: {'comment': comment},
      );
      return _extractData(resp);
    } on DioException catch (e) {
      throw _wrapDioError(e);
    }
  }

  /// Reject event request (admin only)
  Future<Map<String, dynamic>> rejectEventRequest(
    String id, {
    required String comment,
  }) async {
    try {
      final resp = await dio.post(
        '/events/requests/$id/reject',
        data: {'comment': comment},
      );
      return _extractData(resp);
    } on DioException catch (e) {
      throw _wrapDioError(e);
    }
  }

  /// Get event calendar with filters
  Future<Map<String, dynamic>> getEventCalendar({
    DateTime? from,
    DateTime? to,
    String? clubId,
    String? eventType,
    int page = 1,
    int limit = 20,
  }) async {
    try {
      final queryParams = <String, dynamic>{'page': page, 'limit': limit};

      if (from != null) queryParams['from'] = from.toUtc().toIso8601String();
      if (to != null) queryParams['to'] = to.toUtc().toIso8601String();
      if (clubId != null) queryParams['clubId'] = clubId;
      if (eventType != null) queryParams['eventType'] = eventType;

      final resp = await dio.get(
        '/events/calendar',
        queryParameters: queryParams,
      );
      return _extractData(resp);
    } on DioException catch (e) {
      throw _wrapDioError(e);
    }
  }

  /// Get available rooms
  Future<List<dynamic>> getRooms() async {
    try {
      final resp = await dio.get('/events/rooms');
      return _extractList(resp);
    } on DioException catch (e) {
      throw _wrapDioError(e);
    }
  }

  // ========================================================================
  // ANNEX ENDPOINTS
  // ========================================================================

  /// Upload annex file for event request
  Future<Map<String, dynamic>> uploadAnnex({
    required String requestId,
    required String annexTemplateId,
    required File pdfFile,
  }) async {
    try {
      final formData = FormData.fromMap({
        'annexTemplateId': annexTemplateId,
        'file': await MultipartFile.fromFile(
          pdfFile.path,
          filename: pdfFile.path.split(Platform.pathSeparator).last,
        ),
      });

      final resp = await dio.post(
        '/annexes/requests/$requestId/upload',
        data: formData,
        options: Options(headers: {'Content-Type': 'multipart/form-data'}),
      );

      return _extractData(resp);
    } on DioException catch (e) {
      throw _wrapDioError(e);
    }
  }

  /// Get all annexes for an event request
  Future<List<dynamic>> getAnnexesForRequest(String requestId) async {
    try {
      final resp = await dio.get('/annexes/requests/$requestId');
      final data = _extractData(resp);

      if (data.containsKey('annexes') && data['annexes'] is List) {
        return List<dynamic>.from(data['annexes']);
      }

      return [];
    } on DioException catch (e) {
      throw _wrapDioError(e);
    }
  }

  /// Validate or invalidate an annex (admin only)
  Future<Map<String, dynamic>> validateAnnex({
    required String requestId,
    required String templateId,
    required bool validated,
  }) async {
    try {
      final resp = await dio.patch(
        '/annexes/requests/$requestId/validate/$templateId',
        data: {'validated': validated},
      );
      return _extractData(resp);
    } on DioException catch (e) {
      throw _wrapDioError(e);
    }
  }

  // ========================================================================
  // COMMUNITY ENDPOINTS
  // ========================================================================

  /// Create a new post
  Future<Map<String, dynamic>> createPost(Map<String, dynamic> postData) async {
    try {
      final resp = await dio.post('/community/posts', data: postData);
      return _extractData(resp);
    } on DioException catch (e) {
      throw _wrapDioError(e);
    }
  }

  /// Delete a post
  Future<Map<String, dynamic>> deletePost(String postId) async {
    try {
      final resp = await dio.delete('/community/posts/$postId');
      return _extractData(resp);
    } on DioException catch (e) {
      throw _wrapDioError(e);
    }
  }

  /// Get community feed
  Future<Map<String, dynamic>> getFeed({int offset = 0, int limit = 20}) async {
    try {
      final resp = await dio.get(
        '/community/feed',
        queryParameters: {'offset': offset, 'limit': limit},
      );
      return _extractData(resp);
    } on DioException catch (e) {
      throw _wrapDioError(e);
    }
  }

  /// Get attendance QR code for event (returns image bytes)
  Future<Uint8List> getAttendanceQr(String eventId) async {
    try {
      final resp = await dio.get(
        '/community/events/$eventId/attendance/qr',
        options: Options(responseType: ResponseType.bytes),
      );
      return Uint8List.fromList(resp.data);
    } on DioException catch (e) {
      throw _wrapDioError(e);
    }
  }

  /// Check in to event attendance
  Future<Map<String, dynamic>> checkinAttendance(
    String eventId,
    DateTime scannedAt,
  ) async {
    try {
      final resp = await dio.post(
        '/community/events/$eventId/attendance/checkin',
        data: {'scannedAt': scannedAt.toUtc().toIso8601String()},
      );
      return _extractData(resp);
    } on DioException catch (e) {
      throw _wrapDioError(e);
    }
  }

  // ========================================================================
  // NOTIFICATION ENDPOINTS
  // ========================================================================

  /// Get notifications with pagination
  Future<Map<String, dynamic>> getNotifications({
    int offset = 0,
    int limit = 20,
    bool? isRead,
  }) async {
    try {
      final queryParams = <String, dynamic>{'offset': offset, 'limit': limit};

      if (isRead != null) queryParams['isRead'] = isRead;

      final resp = await dio.get(
        '/notifications',
        queryParameters: queryParams,
      );
      return _extractData(resp);
    } on DioException catch (e) {
      throw _wrapDioError(e);
    }
  }

  /// Mark specific notification as read
  Future<Map<String, dynamic>> markNotificationRead(
    String notificationId,
  ) async {
    try {
      final resp = await dio.patch('/notifications/$notificationId/read');
      return _extractData(resp);
    } on DioException catch (e) {
      throw _wrapDioError(e);
    }
  }

  /// Mark all notifications as read
  Future<Map<String, dynamic>> markAllNotificationsRead() async {
    try {
      final resp = await dio.patch('/notifications/read-all');
      return _extractData(resp);
    } on DioException catch (e) {
      throw _wrapDioError(e);
    }
  }
}
