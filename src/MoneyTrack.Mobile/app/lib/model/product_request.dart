part of swagger.api;

class ProductRequest {
  String? name = null;

  int? productTypeId = null;

  ProductRequest();

  @override
  String toString() {
    return 'ProductRequest[name=$name, productTypeId=$productTypeId, ]';
  }

  ProductRequest.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    name = json['name'];
    productTypeId = json['productTypeId'];
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'productTypeId': productTypeId};
  }

  static List<ProductRequest> listFromJson(List<dynamic> json) {
    return json == null
        ? []
        : json.map((value) => new ProductRequest.fromJson(value)).toList();
  }

  static Map<String, ProductRequest> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, ProductRequest>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = new ProductRequest.fromJson(value));
    }
    return map;
  }
}
