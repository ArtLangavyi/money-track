part of swagger.api;

class QueryParam {
  String name;
  String value;

  QueryParam(this.name, this.value);
}

class ApiClient {
  String basePath;
  var client = BrowserClient();

  final Map<String, String> _defaultHeaderMap = {};
  final Map<String, Authentication> _authentications = {};

  // ignore: non_constant_identifier_names
  final _RegList = RegExp(r'^List<(.*)>$');
  // ignore: non_constant_identifier_names
  final _RegMap = RegExp(r'^Map<String,(.*)>$');

  ApiClient({this.basePath: "/"}) {
    // Setup authentications (key: authentication name, value: authentication).
  }

  void addDefaultHeader(String key, String value) {
    _defaultHeaderMap[key] = value;
  }

  dynamic _deserialize(dynamic value, String targetType) {
    try {
      switch (targetType) {
        case 'String':
          return '$value';
        case 'int':
          return value is int ? value : int.parse('$value');
        case 'bool':
          return value is bool ? value : '$value'.toLowerCase() == 'true';
        case 'double':
          return value is double ? value : double.parse('$value');
        case 'DeleteResponse':
          return DeleteResponse.fromJson(value);
        case 'ErrorResponse':
          return ErrorResponse.fromJson(value);
        case 'ExpencePlaceRequest':
          return ExpencePlaceRequest.fromJson(value);
        case 'ExpencePlaceResponse':
          return ExpencePlaceResponse.fromJson(value);
        case 'ExpenceRequest':
          return ExpenceRequest.fromJson(value);
        case 'ExpenceResponse':
          return ExpenceResponse.fromJson(value);
        case 'OrderRequest':
          return OrderRequest.fromJson(value);
        case 'OrderResponse':
          return OrderResponse.fromJson(value);
        case 'ProductRequest':
          return ProductRequest.fromJson(value);
        case 'ProductResponse':
          return ProductResponse.fromJson(value);
        case 'ProductTypeRequest':
          return ProductTypeRequest.fromJson(value);
        case 'ProductTypeResponse':
          return ProductTypeResponse.fromJson(value);
        case 'SaveResponse':
          return SaveResponse.fromJson(value);
        case 'UserRequest':
          return UserRequest.fromJson(value);
        case 'UserResponse':
          return UserResponse.fromJson(value);
        case 'WeatherForecast':
          return WeatherForecast.fromJson(value);
        default:
          {
            Match match;
            if (value is List &&
                (match = _RegList.firstMatch(targetType)!) != null) {
              var newTargetType = match[1];
              return value.map((v) => _deserialize(v, newTargetType!)).toList();
            } else if (value is Map &&
                (match = _RegMap.firstMatch(targetType) as Match) != null) {
              var newTargetType = match[1];
              return Map.fromIterables(value.keys,
                  value.values.map((v) => _deserialize(v, newTargetType!)));
            }
          }
      }
    } catch (e, stack) {
      throw ApiException.withInner(
          500, 'Exception during deserialization.', (e as Exception), stack);
    }
    throw ApiException(
        500, 'Could not find a suitable class for deserialization');
  }

  dynamic deserialize(String jsonVal, String targetType) {
    // Remove all spaces.  Necessary for reg expressions as well.
    targetType = targetType.replaceAll(' ', '');

    if (targetType == 'String') return jsonVal;

    var decodedJson = json.decode(jsonVal);
    return _deserialize(decodedJson, targetType);
  }

  String serialize(Object obj) {
    String serialized = '';
    if (obj == null) {
      serialized = '';
    } else {
      serialized = json.encode(obj);
    }
    return serialized;
  }

  // We don't use a Map<String, String> for queryParams.
  // If collectionFormat is 'multi' a key might appear multiple times.
  Future<Response> invokeAPI(
      String path,
      String method,
      List<QueryParam> queryParams,
      Object body,
      Map<String, String> headerParams,
      Map<String, String> formParams,
      String contentType,
      List<String> authNames) async {
    _updateParamsForAuth(authNames, queryParams, headerParams);

    var ps = queryParams
        .where((p) => p.value != null)
        .map((p) => '${p.name}=${p.value}');
    String queryString = ps.isNotEmpty ? '?' + ps.join('&') : '';

    Uri url = Uri.parse(basePath + path + queryString);

    headerParams.addAll(_defaultHeaderMap);
    headerParams['Content-Type'] = contentType;

    if (body is MultipartRequest) {
      var request = MultipartRequest(method, url);
      request.fields.addAll(body.fields);
      request.files.addAll(body.files);
      request.headers.addAll(body.headers);
      request.headers.addAll(headerParams);
      var response = await client.send(request);
      return Response.fromStream(response);
    } else {
      var msgBody = contentType == "application/x-www-form-urlencoded"
          ? formParams
          : serialize(body);
      switch (method) {
        case "POST":
          return client.post(url, headers: headerParams, body: msgBody);
        case "PUT":
          return client.put(url, headers: headerParams, body: msgBody);
        case "DELETE":
          return client.delete(url, headers: headerParams);
        case "PATCH":
          return client.patch(url, headers: headerParams, body: msgBody);
        default:
          return client.get(url, headers: headerParams);
      }
    }
  }

  /// Update query and header parameters based on authentication settings.
  /// @param authNames The authentications to apply
  void _updateParamsForAuth(List<String> authNames,
      List<QueryParam> queryParams, Map<String, String> headerParams) {
    for (var authName in authNames) {
      Authentication? auth = _authentications[authName];
      if (auth == null) {
        throw ArgumentError("Authentication undefined: " + authName);
      }
      auth.applyToParams(queryParams, headerParams);
    }
  }

  void setAccessToken(String accessToken) {
    _authentications.forEach((key, auth) {
      if (auth is OAuth) {
        auth.setAccessToken(accessToken);
      }
    });
  }
}
