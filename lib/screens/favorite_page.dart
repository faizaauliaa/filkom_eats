import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/favorite_provider.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final fav = Provider.of<FavoriteProvider>(context).favorites;

    return Scaffold(
      appBar: AppBar(title: const Text("Favorite Food")),
      body: fav.isEmpty
          ? const Center(child: Text("Belum ada makanan favorit"))
          : ListView.builder(
              itemCount: fav.length,
              itemBuilder: (_, i) {
                final item = fav[i];
                return ListTile(
                  leading: Image.asset(item.image, width: 60),
                  title: Text(item.name),
                  subtitle: Text("Rp ${item.price}"),
                );
              },
            ),
    );
  }
}
