part of swagger.api;

class ProductApi {
  final ApiClient apiClient;

  ProductApi([ApiClient? apiClient])
      : apiClient = apiClient ?? defaultApiClient;

  ///
  ///
  ///
  Future<DeleteResponse?> apiV1ProductIdDelete(int id) async {
    Object postBody = Object();

    // verify required params are set
    if (id == null) {
      throw ApiException(400, "Missing required param: id");
    }

    // create path and map variables
    String path = "/api/v1/Product/{id}"
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
  Future<ProductResponse?> apiV1ProductIdGet(int id) async {
    Object postBody = Object();

    // verify required params are set
    if (id == null) {
      throw ApiException(400, "Missing required param: id");
    }

    // create path and map variables
    String path = "/api/v1/Product/{id}"
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
      return apiClient.deserialize(response.body, 'ProductResponse')
          as ProductResponse;
    } else {
      return null;
    }
  }

  ///
  ///
  ///
  Future<SaveResponse?> apiV1ProductIdPost(int id,
      {required ProductRequest body}) async {
    Object postBody = body;

    // verify required params are set
    if (id == null) {
      throw ApiException(400, "Missing required param: id");
    }

    // create path and map variables
    String path = "/api/v1/Product/{id}"
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
  Future<List<ProductResponse>?> apiV1ProductListGet() async {
    Object postBody = Object();

    // verify required params are set

    // create path and map variables
    String path = "/api/v1/Product/list".replaceAll("{format}", "json");

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
      return (apiClient.deserialize(response.body, 'List<ProductResponse>')
              as List)
          .map((item) => item as ProductResponse)
          .toList();
    } else {
      return null;
    }
  }

  ///
  ///
  ///
  Future<DeleteResponse?> apiV1ProductTypeIdDelete(int id) async {
    Object postBody = Object();

    // verify required params are set
    if (id == null) {
      throw ApiException(400, "Missing required param: id");
    }

    // create path and map variables
    String path = "/api/v1/Product/type/{id}"
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
  Future<ProductTypeResponse?> apiV1ProductTypeIdGet(int id) async {
    Object postBody = Object();

    // verify required params are set
    if (id == null) {
      throw ApiException(400, "Missing required param: id");
    }

    // create path and map variables
    String path = "/api/v1/Product/type/{id}"
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
      return apiClient.deserialize(response.body, 'ProductTypeResponse')
          as ProductTypeResponse;
    } else {
      return null;
    }
  }

  ///
  ///
  ///
  Future<SaveResponse?> apiV1ProductTypeIdPost(int id,
      {required ProductTypeRequest body}) async {
    Object postBody = body;

    // verify required params are set
    if (id == null) {
      throw ApiException(400, "Missing required param: id");
    }

    // create path and map variables
    String path = "/api/v1/Product/type/{id}"
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
  Future<List<ProductTypeResponse>?> apiV1ProductTypeListGet() async {
    Object postBody = Object();

    // verify required params are set

    // create path and map variables
    String path = "/api/v1/Product/type/list".replaceAll("{format}", "json");

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
      return (apiClient.deserialize(response.body, 'List<ProductTypeResponse>')
              as List)
          .map((item) => item as ProductTypeResponse)
          .toList();
    } else {
      return null;
    }
  }
}
