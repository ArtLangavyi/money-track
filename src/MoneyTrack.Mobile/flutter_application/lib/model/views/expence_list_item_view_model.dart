class ExpenceListItemViewMode {
  final String _title;
  final double _amount;
  final int _orderId;

  ExpenceListItemViewMode({required title, required amount, required orderId})
      : _title = title,
        _amount = amount,
        _orderId = orderId;

  String get title => _title;
  double get amount => _amount;
  int get orderId => _orderId;
}
