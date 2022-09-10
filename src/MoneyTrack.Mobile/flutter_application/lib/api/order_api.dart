part of swagger.api;

class OrderApi {
  final ApiClient apiClient;

  OrderApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  ///
  ///
  ///
  Future<DeleteResponse?> apiV1OrderIdDelete(int id) async {
    Object postBody = Object();

    // verify required params are set
    if (id == null) {
      throw ApiException(400, "Missing required param: id");
    }

    // create path and map variables
    String path = "/api/v1/Order/{id}"
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
  Future<OrderResponse?> apiV1OrderIdGet(int id) async {
    Object postBody = Object();

    // verify required params are set
    if (id == null) {
      throw ApiException(400, "Missing required param: id");
    }

    // create path and map variables
    String path = "/api/v1/Order/{id}"
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
      return apiClient.deserialize(response.body, 'OrderResponse')
          as OrderResponse;
    } else {
      return null;
    }
  }

  ///
  ///
  ///
  Future<SaveResponse?> apiV1OrderIdPost(int id,
      {required OrderRequest body}) async {
    Object postBody = body;

    // verify required params are set
    if (id == null) {
      throw ApiException(400, "Missing required param: id");
    }

    // create path and map variables
    String path = "/api/v1/Order/{id}"
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
  Future<List<OrderResponse>?> apiV1OrderListGet() async {
    Object postBody = Object();

    // verify required params are set

    // create path and map variables
    String path = "/api/v1/Order/list".replaceAll("{format}", "json");

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
      return (apiClient.deserialize(response.body, 'List<OrderResponse>')
              as List)
          .map((item) => item as OrderResponse)
          .toList();
    } else {
      return null;
    }
  }
}
