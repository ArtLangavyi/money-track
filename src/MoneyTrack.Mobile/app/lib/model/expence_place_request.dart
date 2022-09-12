part of swagger.api;

class ExpencePlaceRequest {
  String? name;

  ExpencePlaceRequest();

  @override
  String toString() {
    return 'ExpencePlaceRequest[name=$name, ]';
  }

  ExpencePlaceRequest.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    return {'name': name};
  }

  static List<ExpencePlaceRequest> listFromJson(List<dynamic> json) {
    return json == null
        ? []
        : json.map((value) => ExpencePlaceRequest.fromJson(value)).toList();
  }

  static Map<String, ExpencePlaceRequest> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = <String, ExpencePlaceRequest>{};
    if (json.isNotEmpty) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = ExpencePlaceRequest.fromJson(value));
    }
    return map;
  }
}
