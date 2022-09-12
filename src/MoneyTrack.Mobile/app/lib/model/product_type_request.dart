part of swagger.api;

class ProductTypeRequest {
  String? name = null;

  ProductTypeRequest();

  @override
  String toString() {
    return 'ProductTypeRequest[name=$name, ]';
  }

  ProductTypeRequest.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    return {'name': name};
  }

  static List<ProductTypeRequest> listFromJson(List<dynamic> json) {
    return json == null
        ? []
        : json.map((value) => new ProductTypeRequest.fromJson(value)).toList();
  }

  static Map<String, ProductTypeRequest> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, ProductTypeRequest>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = new ProductTypeRequest.fromJson(value));
    }
    return map;
  }
}
