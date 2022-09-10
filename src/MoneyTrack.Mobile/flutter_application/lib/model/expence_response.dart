part of swagger.api;

class ExpenceResponse {
  int? id;

  String? productName;

  double? price;

  int? qantity;

  double? amount;

  double? discount;

  DateTime? createdDate;

  ExpenceResponse();

  @override
  String toString() {
    return 'ExpenceResponse[id=$id, productName=$productName, price=$price, qantity=$qantity, amount=$amount, discount=$discount, createdDate=$createdDate, ]';
  }

  ExpenceResponse.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    productName = json['productName'];
    price = json['price'];
    qantity = json['qantity'];
    amount = json['amount'];
    discount = json['discount'];
    createdDate = json['createdDate'] == null
        ? null
        : DateTime.parse(json['createdDate']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productName': productName,
      'price': price,
      'qantity': qantity,
      'amount': amount,
      'discount': discount,
      'createdDate':
          createdDate == null ? '' : createdDate!.toUtc().toIso8601String()
    };
  }

  static List<ExpenceResponse> listFromJson(List<dynamic> json) {
    return json == null
        ? []
        : json.map((value) => ExpenceResponse.fromJson(value)).toList();
  }

  static Map<String, ExpenceResponse> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = <String, ExpenceResponse>{};
    if (json.isNotEmpty) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = ExpenceResponse.fromJson(value));
    }
    return map;
  }
}
