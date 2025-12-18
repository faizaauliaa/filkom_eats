class DeliverySpot {
  final String building;
  final String subLocation;
  final int price;
  final double lat;
  final double lng;

  DeliverySpot({
    required this.building,
    required this.subLocation,
    required this.price,
    required this.lat,
    required this.lng,
  });

  String get fullName => "$building - $subLocation";
}
