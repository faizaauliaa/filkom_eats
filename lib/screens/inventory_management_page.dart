import 'package:flutter/material.dart';

class InventoryManagementPage extends StatefulWidget {
  @override
  State<InventoryManagementPage> createState() =>
      _InventoryManagementPageState();
}

class _InventoryManagementPageState extends State<InventoryManagementPage> {
  final List<Map<String, dynamic>> menu = [
    {'name': 'Mie Yamin', 'price': 12000, 'qty': 1},
    {'name': 'Mie Tumplek', 'price': 12000, 'qty': 1},
    {'name': 'Nasgor Katsu', 'price': 13000, 'qty': 1},
    {'name': 'Nasgor Ayam', 'price': 11000, 'qty': 1},
    {'name': 'Ayam Geprek', 'price': 11000, 'qty': 1},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory Management'),
        leading: const BackButton(),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: menu.length,
        itemBuilder: (context, index) {
          final item = menu[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.restaurant),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['name'],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('Rp${item['price']},-'),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.remove_circle, color: Colors.pink),
                    onPressed: () {
                      setState(() {
                        if (item['qty'] > 0) item['qty']--;
                      });
                    },
                  ),
                  Text(item['qty'].toString()),
                  IconButton(
                    icon: const Icon(Icons.add_circle, color: Colors.pink),
                    onPressed: () {
                      setState(() {
                        item['qty']++;
                      });
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
