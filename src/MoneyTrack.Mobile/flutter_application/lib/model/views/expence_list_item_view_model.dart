class ExpenceListItemViewMode {
  final String _title;
  final double _amount;
  final int _orderId;
  final DateTime _orderDate;
  ExpenceListItemViewMode(
      {required title, required amount, required orderId, required orderDate})
      : _title = title,
        _amount = amount,
        _orderId = orderId,
        _orderDate = orderDate;

  String get title => _title;
  double get amount => _amount;
  int get orderId => _orderId;
  DateTime get orderDate => _orderDate;
}
