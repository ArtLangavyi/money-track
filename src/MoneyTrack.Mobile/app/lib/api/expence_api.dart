part of swagger.api;

class ExpenceApi {
  final ApiClient apiClient;

  ExpenceApi([ApiClient? apiClient])
      : apiClient = apiClient ?? defaultApiClient;

  ///
  ///
  ///
  Future<DeleteResponse?> apiV1ExpenceIdDelete(int id) async {
    Object postBody = Object();

    // verify required params are set
    if (id == null) {
      throw ApiException(400, "Missing required param: id");
    }

    // create path and map variables
    String path = "/api/v1/Expence/{id}"
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
    } else {}

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
  Future<ExpenceResponse?> apiV1ExpenceIdGet(int id) async {
    Object postBody = Object();

    // verify required params are set
    if (id == null) {
      throw ApiException(400, "Missing required param: id");
    }

    // create path and map variables
    String path = "/api/v1/Expence/{id}"
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
      return apiClient.deserialize(response.body, 'ExpenceResponse')
          as ExpenceResponse;
    } else {
      return null;
    }
  }

  ///
  ///
  ///
  Future<SaveResponse?> apiV1ExpenceIdPost(int id,
      {required ExpenceRequest body}) async {
    Object postBody = body;

    // verify required params are set
    if (id == null) {
      throw ApiException(400, "Missing required param: id");
    }

    // create path and map variables
    String path = "/api/v1/Expence/{id}"
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
  Future<List<ExpenceResponse>?> apiV1ExpenceListOrderIdGet(int orderId) async {
    Object postBody = Object();

    // verify required params are set
    if (orderId == null) {
      throw ApiException(400, "Missing required param: orderId");
    }

    // create path and map variables
    String path = "/api/v1/Expence/list/{orderId}"
        .replaceAll("{format}", "json")
        .replaceAll("{" + "orderId" + "}", orderId.toString());

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
      return (apiClient.deserialize(response.body, 'List<ExpenceResponse>')
              as List)
          .map((item) => item as ExpenceResponse)
          .toList();
    } else {
      return null;
    }
  }

  ///
  ///
  ///
  Future<DeleteResponse?> apiV1ExpencePlaceIdDelete(int id) async {
    Object postBody = Object();

    // verify required params are set
    if (id == null) {
      throw ApiException(400, "Missing required param: id");
    }

    // create path and map variables
    String path = "/api/v1/Expence/place/{id}"
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
    } else {}

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
  Future<ExpencePlaceResponse?> apiV1ExpencePlaceIdGet(int id) async {
    Object postBody = Object();

    // verify required params are set
    if (id == null) {
      throw ApiException(400, "Missing required param: id");
    }

    // create path and map variables
    String path = "/api/v1/Expence/place/{id}"
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
      return apiClient.deserialize(response.body, 'ExpencePlaceResponse')
          as ExpencePlaceResponse;
    } else {
      return null;
    }
  }

  ///
  ///
  ///
  Future<SaveResponse?> apiV1ExpencePlaceIdPost(int id,
      {required ExpencePlaceRequest body}) async {
    Object postBody = body;

    // verify required params are set
    if (id == null) {
      throw ApiException(400, "Missing required param: id");
    }

    // create path and map variables
    String path = "/api/v1/Expence/place/{id}"
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
  Future<List<ExpencePlaceResponse>?> apiV1ExpencePlaceListGet() async {
    Object postBody = Object();

    // verify required params are set

    // create path and map variables
    String path = "/api/v1/Expence/place/list".replaceAll("{format}", "json");

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
      return (apiClient.deserialize(response.body, 'List<ExpencePlaceResponse>')
              as List)
          .map((item) => item as ExpencePlaceResponse)
          .toList();
    } else {
      return null;
    }
  }
}
