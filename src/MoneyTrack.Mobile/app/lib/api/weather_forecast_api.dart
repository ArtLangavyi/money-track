part of swagger.api;

class WeatherForecastApi {
  final ApiClient apiClient;

  WeatherForecastApi([ApiClient? apiClient])
      : apiClient = apiClient ?? defaultApiClient;

  ///
  ///
  ///
  Future<List<WeatherForecast>?> weatherForecastGet() async {
    Object postBody = Object();

    // verify required params are set

    // create path and map variables
    String path = "/WeatherForecast".replaceAll("{format}", "json");

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
      return (apiClient.deserialize(response.body, 'List<WeatherForecast>')
              as List)
          .map((item) => item as WeatherForecast)
          .toList();
    } else {
      return null;
    }
  }
}
