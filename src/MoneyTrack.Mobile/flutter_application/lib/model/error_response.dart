part of swagger.api;

class ErrorResponse {
  String? primaryErrorCode;

  List<String> errors = [];

  ErrorResponse();

  @override
  String toString() {
    return 'ErrorResponse[primaryErrorCode=$primaryErrorCode, errors=$errors, ]';
  }

  ErrorResponse.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    primaryErrorCode = json['primaryErrorCode'];
    errors = (json['errors'] as List).map((item) => item as String).toList();
  }

  Map<String, dynamic> toJson() {
    return {'primaryErrorCode': primaryErrorCode, 'errors': errors};
  }

  static List<ErrorResponse> listFromJson(List<dynamic> json) {
    return json == null
        ? []
        : json.map((value) => ErrorResponse.fromJson(value)).toList();
  }

  static Map<String, ErrorResponse> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = <String, ErrorResponse>{};
    if (json.isNotEmpty) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = ErrorResponse.fromJson(value));
    }
    return map;
  }
}
