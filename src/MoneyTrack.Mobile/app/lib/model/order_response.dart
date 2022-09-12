part of swagger.api;

class OrderResponse {
  int? id = null;

  ExpencePlaceResponse? expencePlace;

  double? total;

  double? totalDiscount;

  UserResponse? user;

  DateTime? paymentDate;

  bool? isAutomatedPayment;

  String? receiptImage;

  DateTime? createdDate;

  List<ExpenceResponse> expence = [];

  OrderResponse();

  @override
  String toString() {
    return 'OrderResponse[id=$id, expencePlace=$expencePlace, total=$total, totalDiscount=$totalDiscount, user=$user, paymentDate=$paymentDate, isAutomatedPayment=$isAutomatedPayment, receiptImage=$receiptImage, createdDate=$createdDate, expence=$expence, ]';
  }

  OrderResponse.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    expencePlace = new ExpencePlaceResponse.fromJson(json['expencePlace']);
    total = json['total'];
    totalDiscount = json['totalDiscount'];
    user = new UserResponse.fromJson(json['user']);
    paymentDate = json['paymentDate'] == null
        ? null
        : DateTime.parse(json['paymentDate']);
    isAutomatedPayment = json['isAutomatedPayment'];
    receiptImage = json['receiptImage'];
    createdDate = json['createdDate'] == null
        ? null
        : DateTime.parse(json['createdDate']);
    expence = ExpenceResponse.listFromJson(json['expence']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'expencePlace': expencePlace,
      'total': total,
      'totalDiscount': totalDiscount,
      'user': user,
      'paymentDate':
          paymentDate == null ? '' : paymentDate!.toUtc().toIso8601String(),
      'isAutomatedPayment': isAutomatedPayment,
      'receiptImage': receiptImage,
      'createdDate':
          createdDate == null ? '' : createdDate!.toUtc().toIso8601String(),
      'expence': expence
    };
  }

  static List<OrderResponse> listFromJson(List<dynamic> json) {
    return json == null
        ? []
        : json.map((value) => new OrderResponse.fromJson(value)).toList();
  }

  static Map<String, OrderResponse> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, OrderResponse>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = new OrderResponse.fromJson(value));
    }
    return map;
  }
}
