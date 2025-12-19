class PurchaseItem {
  final String menuName;
  final String note;
  final String price;
  final DateTime date;
  bool isRated;
  int rating;
  String review;

  PurchaseItem({
    required this.menuName,
    required this.note,
    required this.price,
    required this.date,
    this.isRated = false,
    this.rating = 0,
    this.review = "",
  });
}
