import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../providers/favorite_provider.dart';
import '../models/product.dart';
import 'favorite_page.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ✔ List produk
    final List<Product> foods = [
      Product(
        id: "1",
        name: "Mie Yamin",
        image: "assets/mieyamin.png",
        price: 13000,
      ),
      Product(
        id: "2",
        name: "Ayam Geprek",
        image: "assets/ayam.png",
        price: 15000,
      ),
      Product(id: "3", name: "Bakso", image: "assets/bakso.png", price: 12000),
    ];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 195, 93, 93),

      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 56, 77, 149),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Menu Kantin",
          style: TextStyle(
            color: Color(0xffFF4D78),
            fontWeight: FontWeight.bold,
          ),
        ),

        // ❤️ tombol ke FavoritePage
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite, color: Colors.red),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const FavoritePage()),
              );
            },
          ),
        ],
      ),

      // ✔ List item menu
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: foods.length,
        itemBuilder: (context, index) {
          final item = foods[index];

          return Card(
            elevation: 0.8,
            margin: const EdgeInsets.only(bottom: 14),
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),

              // ✔ Gambar
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  item.image,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                  errorBuilder: (c, o, s) =>
                      const Icon(Icons.image_not_supported),
                ),
              ),

              title: Text(
                item.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),

              subtitle: Text("Rp ${item.price}"),

              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // ❤️ Favorite Button
                  Consumer<FavoriteProvider>(
                    builder: (_, fav, __) {
                      final isFav = fav.isFavorite(item);
                      return IconButton(
                        icon: Icon(
                          isFav ? Icons.favorite : Icons.favorite_border,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          fav.toggleFavorite(item);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              duration: const Duration(milliseconds: 600),
                              content: Text(
                                isFav
                                    ? "Removed from favorites"
                                    : "Added to favorites",
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),

                  // 🛒 Add to Cart Button
                  IconButton(
                    icon: const Icon(
                      Icons.add_circle,
                      color: Color(0xffFF4D78),
                    ),
                    onPressed: () {
                      Provider.of<CartProvider>(
                        context,
                        listen: false,
                      ).add(item);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: const Duration(milliseconds: 600),
                          content: Text("${item.name} added to cart"),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
