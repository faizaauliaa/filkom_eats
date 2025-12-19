import 'purchase_model.dart';

class PurchaseManager {
  static final List<PurchaseItem> histories = [];

  static void addPurchase(PurchaseItem item) {
    histories.insert(0, item);
  }
}
