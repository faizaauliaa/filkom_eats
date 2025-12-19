import 'purchase_history.dart';

class PurchaseHistoryService {
  static final List<PurchaseHistory> _data = [];

  static void add(PurchaseHistory history) {
    _data.add(history);
  }

  static List<PurchaseHistory> getAll() {
    return _data;
  }
}
