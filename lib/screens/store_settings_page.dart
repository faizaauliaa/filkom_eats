import 'package:flutter/material.dart';

class StoreSettingsPage extends StatelessWidget {
  final List<Map<String, String>> settings = [
    {
      'title': 'Store Status & Visibility',
      'desc':
          'Controls whether the store is currently open and visible to customers.',
    },
    {
      'title': 'Operating Hours',
      'desc': 'Defines the regular weekly business schedule.',
    },
    {
      'title': 'Special Hours & Holidays',
      'desc': 'Allows scheduling temporary changes to the normal hours.',
    },
    {
      'title': 'Order Fulfillment Settings',
      'desc': 'Parameters controlling how orders are prepared and handed over.',
    },
    {
      'title': 'Service Type Configuration',
      'desc': 'Defines the types of services the store offers.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Store Settings'),
        leading: const BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: settings.length,
                itemBuilder: (context, index) {
                  final item = settings[index];
                  return ListTile(
                    leading: const Icon(Icons.settings),
                    title: Text(
                      item['title']!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(item['desc']!),
                    trailing: const Icon(Icons.chevron_right),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
