part of swagger.api;

class UserApi {
  final ApiClient apiClient;

  UserApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  ///
  ///
  ///
  Future<DeleteResponse?> apiV1UserIdDelete(int id) async {
    Object postBody = Object();

    // verify required params are set
    if (id == null) {
      throw ApiException(400, "Missing required param: id");
    }

    // create path and map variables
    String path = "/api/v1/User/{id}"
        .replaceAll("{format}", "json")
        .replaceAll("{" + "id" + "}", id.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};

    List<String> contentTypes = [];

    String contentType =
        contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = [];

    if (contentType.startsWith("multipart/form-data")) {
      postBody = MultipartRequest('DELETE', Uri.parse(path));
    }

    var response = await apiClient.invokeAPI(path, 'DELETE', queryParams,
        postBody, headerParams, formParams, contentType, authNames);

    if (response.statusCode >= 400) {
      throw ApiException(response.statusCode, response.body);
    } else if (response.body != null) {
      return apiClient.deserialize(response.body, 'DeleteResponse')
          as DeleteResponse;
    } else {
      return null;
    }
  }

  ///
  ///
  ///
  Future<UserResponse?> apiV1UserIdGet(int id) async {
    Object postBody = Object();

    // verify required params are set
    if (id == null) {
      throw ApiException(400, "Missing required param: id");
    }

    // create path and map variables
    String path = "/api/v1/User/{id}"
        .replaceAll("{format}", "json")
        .replaceAll("{" + "id" + "}", id.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};

    List<String> contentTypes = [];

    String contentType =
        contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = [];

    if (contentType.startsWith("multipart/form-data")) {
      postBody = MultipartRequest('GET', Uri.parse(path));
    } else {}

    var response = await apiClient.invokeAPI(path, 'GET', queryParams, postBody,
        headerParams, formParams, contentType, authNames);

    if (response.statusCode >= 400) {
      throw ApiException(response.statusCode, response.body);
    } else if (response.body != null) {
      return apiClient.deserialize(response.body, 'UserResponse')
          as UserResponse;
    } else {
      return null;
    }
  }

  ///
  ///
  ///
  Future<SaveResponse?> apiV1UserIdPost(int id,
      {required UserRequest body}) async {
    Object postBody = body;

    // verify required params are set
    if (id == null) {
      throw ApiException(400, "Missing required param: id");
    }

    // create path and map variables
    String path = "/api/v1/User/{id}"
        .replaceAll("{format}", "json")
        .replaceAll("{" + "id" + "}", id.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};

    List<String> contentTypes = [
      "application/json",
      "text/json",
      "application/_*+json"
    ];

    String contentType =
        contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = [];

    if (contentType.startsWith("multipart/form-data")) {
      postBody = MultipartRequest('POST', Uri.parse(path));
    } else {}

    var response = await apiClient.invokeAPI(path, 'POST', queryParams,
        postBody, headerParams, formParams, contentType, authNames);

    if (response.statusCode >= 400) {
      throw ApiException(response.statusCode, response.body);
    } else if (response.body != null) {
      return apiClient.deserialize(response.body, 'SaveResponse')
          as SaveResponse;
    } else {
      return null;
    }
  }

  ///
  ///
  ///
  Future<List<UserResponse>?> apiV1UserListGet() async {
    Object postBody = Object();

    // verify required params are set

    // create path and map variables
    String path = "/api/v1/User/list".replaceAll("{format}", "json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};

    List<String> contentTypes = [];

    String contentType =
        contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = [];

    if (contentType.startsWith("multipart/form-data")) {
      postBody = MultipartRequest('GET', Uri.parse(path));
    } else {}

    var response = await apiClient.invokeAPI(path, 'GET', queryParams, postBody,
        headerParams, formParams, contentType, authNames);

    if (response.statusCode >= 400) {
      throw ApiException(response.statusCode, response.body);
    } else if (response.body != null) {
      return (apiClient.deserialize(response.body, 'List<UserResponse>')
              as List)
          .map((item) => item as UserResponse)
          .toList();
    } else {
      return null;
    }
  }
}
