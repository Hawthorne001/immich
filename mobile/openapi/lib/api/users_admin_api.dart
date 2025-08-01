//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class UsersAdminApi {
  UsersAdminApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// This endpoint is an admin-only route, and requires the `adminUser.create` permission.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [UserAdminCreateDto] userAdminCreateDto (required):
  Future<Response> createUserAdminWithHttpInfo(UserAdminCreateDto userAdminCreateDto,) async {
    // ignore: prefer_const_declarations
    final apiPath = r'/admin/users';

    // ignore: prefer_final_locals
    Object? postBody = userAdminCreateDto;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      apiPath,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// This endpoint is an admin-only route, and requires the `adminUser.create` permission.
  ///
  /// Parameters:
  ///
  /// * [UserAdminCreateDto] userAdminCreateDto (required):
  Future<UserAdminResponseDto?> createUserAdmin(UserAdminCreateDto userAdminCreateDto,) async {
    final response = await createUserAdminWithHttpInfo(userAdminCreateDto,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'UserAdminResponseDto',) as UserAdminResponseDto;
    
    }
    return null;
  }

  /// This endpoint is an admin-only route, and requires the `adminUser.delete` permission.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///
  /// * [UserAdminDeleteDto] userAdminDeleteDto (required):
  Future<Response> deleteUserAdminWithHttpInfo(String id, UserAdminDeleteDto userAdminDeleteDto,) async {
    // ignore: prefer_const_declarations
    final apiPath = r'/admin/users/{id}'
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody = userAdminDeleteDto;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      apiPath,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// This endpoint is an admin-only route, and requires the `adminUser.delete` permission.
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///
  /// * [UserAdminDeleteDto] userAdminDeleteDto (required):
  Future<UserAdminResponseDto?> deleteUserAdmin(String id, UserAdminDeleteDto userAdminDeleteDto,) async {
    final response = await deleteUserAdminWithHttpInfo(id, userAdminDeleteDto,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'UserAdminResponseDto',) as UserAdminResponseDto;
    
    }
    return null;
  }

  /// This endpoint is an admin-only route, and requires the `adminUser.read` permission.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  Future<Response> getUserAdminWithHttpInfo(String id,) async {
    // ignore: prefer_const_declarations
    final apiPath = r'/admin/users/{id}'
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      apiPath,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// This endpoint is an admin-only route, and requires the `adminUser.read` permission.
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  Future<UserAdminResponseDto?> getUserAdmin(String id,) async {
    final response = await getUserAdminWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'UserAdminResponseDto',) as UserAdminResponseDto;
    
    }
    return null;
  }

  /// This endpoint is an admin-only route, and requires the `adminUser.read` permission.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  Future<Response> getUserPreferencesAdminWithHttpInfo(String id,) async {
    // ignore: prefer_const_declarations
    final apiPath = r'/admin/users/{id}/preferences'
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      apiPath,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// This endpoint is an admin-only route, and requires the `adminUser.read` permission.
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  Future<UserPreferencesResponseDto?> getUserPreferencesAdmin(String id,) async {
    final response = await getUserPreferencesAdminWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'UserPreferencesResponseDto',) as UserPreferencesResponseDto;
    
    }
    return null;
  }

  /// This endpoint is an admin-only route, and requires the `adminUser.read` permission.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///
  /// * [bool] isFavorite:
  ///
  /// * [bool] isTrashed:
  ///
  /// * [AssetVisibility] visibility:
  Future<Response> getUserStatisticsAdminWithHttpInfo(String id, { bool? isFavorite, bool? isTrashed, AssetVisibility? visibility, }) async {
    // ignore: prefer_const_declarations
    final apiPath = r'/admin/users/{id}/statistics'
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (isFavorite != null) {
      queryParams.addAll(_queryParams('', 'isFavorite', isFavorite));
    }
    if (isTrashed != null) {
      queryParams.addAll(_queryParams('', 'isTrashed', isTrashed));
    }
    if (visibility != null) {
      queryParams.addAll(_queryParams('', 'visibility', visibility));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      apiPath,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// This endpoint is an admin-only route, and requires the `adminUser.read` permission.
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///
  /// * [bool] isFavorite:
  ///
  /// * [bool] isTrashed:
  ///
  /// * [AssetVisibility] visibility:
  Future<AssetStatsResponseDto?> getUserStatisticsAdmin(String id, { bool? isFavorite, bool? isTrashed, AssetVisibility? visibility, }) async {
    final response = await getUserStatisticsAdminWithHttpInfo(id,  isFavorite: isFavorite, isTrashed: isTrashed, visibility: visibility, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'AssetStatsResponseDto',) as AssetStatsResponseDto;
    
    }
    return null;
  }

  /// This endpoint is an admin-only route, and requires the `adminUser.delete` permission.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  Future<Response> restoreUserAdminWithHttpInfo(String id,) async {
    // ignore: prefer_const_declarations
    final apiPath = r'/admin/users/{id}/restore'
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      apiPath,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// This endpoint is an admin-only route, and requires the `adminUser.delete` permission.
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  Future<UserAdminResponseDto?> restoreUserAdmin(String id,) async {
    final response = await restoreUserAdminWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'UserAdminResponseDto',) as UserAdminResponseDto;
    
    }
    return null;
  }

  /// This endpoint is an admin-only route, and requires the `adminUser.read` permission.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id:
  ///
  /// * [bool] withDeleted:
  Future<Response> searchUsersAdminWithHttpInfo({ String? id, bool? withDeleted, }) async {
    // ignore: prefer_const_declarations
    final apiPath = r'/admin/users';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (id != null) {
      queryParams.addAll(_queryParams('', 'id', id));
    }
    if (withDeleted != null) {
      queryParams.addAll(_queryParams('', 'withDeleted', withDeleted));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      apiPath,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// This endpoint is an admin-only route, and requires the `adminUser.read` permission.
  ///
  /// Parameters:
  ///
  /// * [String] id:
  ///
  /// * [bool] withDeleted:
  Future<List<UserAdminResponseDto>?> searchUsersAdmin({ String? id, bool? withDeleted, }) async {
    final response = await searchUsersAdminWithHttpInfo( id: id, withDeleted: withDeleted, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<UserAdminResponseDto>') as List)
        .cast<UserAdminResponseDto>()
        .toList(growable: false);

    }
    return null;
  }

  /// This endpoint is an admin-only route, and requires the `adminUser.update` permission.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///
  /// * [UserAdminUpdateDto] userAdminUpdateDto (required):
  Future<Response> updateUserAdminWithHttpInfo(String id, UserAdminUpdateDto userAdminUpdateDto,) async {
    // ignore: prefer_const_declarations
    final apiPath = r'/admin/users/{id}'
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody = userAdminUpdateDto;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      apiPath,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// This endpoint is an admin-only route, and requires the `adminUser.update` permission.
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///
  /// * [UserAdminUpdateDto] userAdminUpdateDto (required):
  Future<UserAdminResponseDto?> updateUserAdmin(String id, UserAdminUpdateDto userAdminUpdateDto,) async {
    final response = await updateUserAdminWithHttpInfo(id, userAdminUpdateDto,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'UserAdminResponseDto',) as UserAdminResponseDto;
    
    }
    return null;
  }

  /// This endpoint is an admin-only route, and requires the `adminUser.update` permission.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///
  /// * [UserPreferencesUpdateDto] userPreferencesUpdateDto (required):
  Future<Response> updateUserPreferencesAdminWithHttpInfo(String id, UserPreferencesUpdateDto userPreferencesUpdateDto,) async {
    // ignore: prefer_const_declarations
    final apiPath = r'/admin/users/{id}/preferences'
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody = userPreferencesUpdateDto;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      apiPath,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// This endpoint is an admin-only route, and requires the `adminUser.update` permission.
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///
  /// * [UserPreferencesUpdateDto] userPreferencesUpdateDto (required):
  Future<UserPreferencesResponseDto?> updateUserPreferencesAdmin(String id, UserPreferencesUpdateDto userPreferencesUpdateDto,) async {
    final response = await updateUserPreferencesAdminWithHttpInfo(id, userPreferencesUpdateDto,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'UserPreferencesResponseDto',) as UserPreferencesResponseDto;
    
    }
    return null;
  }
}
