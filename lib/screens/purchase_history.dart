class PurchaseItem {
  final String name;
  final String price;
  final int qty;

  PurchaseItem({required this.name, required this.price, required this.qty});
}

class PurchaseHistory {
  final DateTime date;
  final int total;
  final String location;
  final List<PurchaseItem> items;

  PurchaseHistory({
    required this.date,
    required this.total,
    required this.location,
    required this.items,
  });
}
