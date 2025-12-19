import 'package:flutter/material.dart';
import 'purchase_history.dart';

class RatingPage extends StatefulWidget {
  final PurchaseItem item;

  const RatingPage({super.key, required this.item});

  @override
  State<RatingPage> createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  int rating = 0; // 1 - 5
  final TextEditingController reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Beri Rating")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ===== INFO MENU =====
            Text(
              widget.item.name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text("Harga: ${widget.item.price}"),
            Text("Jumlah: ${widget.item.qty}"),

            const SizedBox(height: 20),

            // ===== STAR RATING =====
            const Text("Rating", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              children: List.generate(5, (index) {
                final starIndex = index + 1;
                return IconButton(
                  onPressed: () {
                    setState(() {
                      rating = starIndex;
                    });
                  },
                  icon: Icon(
                    Icons.star,
                    size: 32,
                    color: starIndex <= rating
                        ? Colors.amber
                        : Colors.grey.shade400,
                  ),
                );
              }),
            ),

            if (rating > 0)
              Text(
                "$rating dari 5 bintang",
                style: const TextStyle(color: Colors.grey),
              ),

            const SizedBox(height: 20),

            // ===== REVIEW TEXT =====
            const Text(
              "Ulasan (opsional)",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: reviewController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: "Tulis pendapat kamu...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const Spacer(),

            // ===== SUBMIT =====
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: rating == 0
                    ? null
                    : () {
                        // sementara tampilkan saja
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Terima kasih! Rating: $rating ⭐"),
                          ),
                        );

                        Navigator.pop(context);
                      },
                child: const Text("Kirim Rating"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    reviewController.dispose();
    super.dispose();
  }
}
