part of swagger.api;

class ProductResponse {
  int? id = null;

  String? name = null;

  int? productTypeId = null;

  ProductResponse();

  @override
  String toString() {
    return 'ProductResponse[id=$id, name=$name, productTypeId=$productTypeId, ]';
  }

  ProductResponse.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    name = json['name'];
    productTypeId = json['productTypeId'];
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'productTypeId': productTypeId};
  }

  static List<ProductResponse> listFromJson(List<dynamic> json) {
    return json == null
        ? []
        : json.map((value) => new ProductResponse.fromJson(value)).toList();
  }

  static Map<String, ProductResponse> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, ProductResponse>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = new ProductResponse.fromJson(value));
    }
    return map;
  }
}
