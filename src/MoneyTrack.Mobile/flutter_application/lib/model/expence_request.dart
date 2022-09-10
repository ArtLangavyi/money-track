part of swagger.api;

class ExpenceRequest {
  int? productId;

  int? orderId;

  double? price;

  int? qantity;

  double? amount;

  double? discount;

  ExpenceRequest();

  @override
  String toString() {
    return 'ExpenceRequest[productId=$productId, orderId=$orderId, price=$price, qantity=$qantity, amount=$amount, discount=$discount, ]';
  }

  ExpenceRequest.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    productId = json['productId'];
    orderId = json['orderId'];
    price = json['price'];
    qantity = json['qantity'];
    amount = json['amount'];
    discount = json['discount'];
  }

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'orderId': orderId,
      'price': price,
      'qantity': qantity,
      'amount': amount,
      'discount': discount
    };
  }

  static List<ExpenceRequest> listFromJson(List<dynamic> json) {
    return json == null
        ? []
        : json.map((value) => ExpenceRequest.fromJson(value)).toList();
  }

  static Map<String, ExpenceRequest> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = <String, ExpenceRequest>{};
    if (json.isNotEmpty) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = ExpenceRequest.fromJson(value));
    }
    return map;
  }
}
