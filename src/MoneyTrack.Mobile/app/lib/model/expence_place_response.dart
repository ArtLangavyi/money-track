part of swagger.api;

class ExpencePlaceResponse {
  int? id;

  String? name;

  ExpencePlaceResponse();

  @override
  String toString() {
    return 'ExpencePlaceResponse[id=$id, name=$name, ]';
  }

  ExpencePlaceResponse.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }

  static List<ExpencePlaceResponse> listFromJson(List<dynamic> json) {
    return json == null
        ? []
        : json.map((value) => ExpencePlaceResponse.fromJson(value)).toList();
  }

  static Map<String, ExpencePlaceResponse> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = <String, ExpencePlaceResponse>{};
    if (json.isNotEmpty) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = ExpencePlaceResponse.fromJson(value));
    }
    return map;
  }
}
