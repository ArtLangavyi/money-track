part of swagger.api;

class OrderRequest {
  int? expencePlaceId;

  double? total;

  double? totalDiscount;

  int? userId;

  DateTime? paymentDate;

  bool? isAutomatedPayment;

  String? receiptImage;

  OrderRequest();

  @override
  String toString() {
    return 'OrderRequest[expencePlaceId=$expencePlaceId, total=$total, totalDiscount=$totalDiscount, userId=$userId, paymentDate=$paymentDate, isAutomatedPayment=$isAutomatedPayment, receiptImage=$receiptImage, ]';
  }

  OrderRequest.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    expencePlaceId = json['expencePlaceId'];
    total = json['total'];
    totalDiscount = json['totalDiscount'];
    userId = json['userId'];
    paymentDate = json['paymentDate'] == null
        ? null
        : DateTime.parse(json['paymentDate']);
    isAutomatedPayment = json['isAutomatedPayment'];
    receiptImage = json['receiptImage'];
  }

  Map<String, dynamic> toJson() {
    return {
      'expencePlaceId': expencePlaceId,
      'total': total,
      'totalDiscount': totalDiscount,
      'userId': userId,
      'paymentDate':
          paymentDate == null ? '' : paymentDate!.toUtc().toIso8601String(),
      'isAutomatedPayment': isAutomatedPayment,
      'receiptImage': receiptImage
    };
  }

  static List<OrderRequest> listFromJson(List<dynamic> json) {
    return json == null
        ? []
        : json.map((value) => OrderRequest.fromJson(value)).toList();
  }

  static Map<String, OrderRequest> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = <String, OrderRequest>{};
    if (json.isNotEmpty) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = OrderRequest.fromJson(value));
    }
    return map;
  }
}
