class FavouriteItem {
  final String name;
  final String note;
  final String price;

  FavouriteItem({required this.name, required this.note, required this.price});
}

class FavouriteManager {
  static final List<FavouriteItem> favourites = [];

  static bool isFavourite(String name) {
    return favourites.any((e) => e.name == name);
  }

  static void toggleFavourite(FavouriteItem item) {
    final index = favourites.indexWhere((e) => e.name == item.name);

    if (index >= 0) {
      favourites.removeAt(index);
    } else {
      favourites.add(item);
    }
  }
}
