part of swagger.api;

class ProductTypeResponse {
  int? id = null;

  String? name = null;

  ProductTypeResponse();

  @override
  String toString() {
    return 'ProductTypeResponse[id=$id, name=$name, ]';
  }

  ProductTypeResponse.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }

  static List<ProductTypeResponse> listFromJson(List<dynamic> json) {
    return json == null
        ? []
        : json.map((value) => new ProductTypeResponse.fromJson(value)).toList();
  }

  static Map<String, ProductTypeResponse> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, ProductTypeResponse>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = new ProductTypeResponse.fromJson(value));
    }
    return map;
  }
}
