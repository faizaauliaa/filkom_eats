import 'package:flutter/material.dart';

class OrderManagementPage extends StatefulWidget {
  const OrderManagementPage({super.key});

  @override
  State<OrderManagementPage> createState() => _OrderManagementPageState();
}

class _OrderManagementPageState extends State<OrderManagementPage> {
  int selectedTab = 0;

  final tabs = ['Incoming', 'In Process', 'Completed'];

  final List<Order> orders = [
    Order(
      name: 'Sabrina Khairunnisa',
      menu: 'Mie Yamin & Es Teh',
      status: 'incoming',
    ),
    Order(
      name: 'Anindhita Faiza Aulia',
      menu: 'Ayam Geprek',
      status: 'incoming',
    ),
    Order(
      name: 'Muhammad Nur Daffa',
      menu: 'Mie Yamin & Es Teh',
      status: 'process',
    ),
    Order(name: 'Achmad Yusuf', menu: 'Ayam Geprek', status: 'process'),
    Order(
      name: 'Zaidan Alvi Zulfan P',
      menu: 'Indomie Goreng',
      status: 'process',
    ),
    Order(
      name: 'Aqeela Sahla',
      menu: 'Mie Yamin & Es Teh',
      status: 'completed',
    ),
    Order(
      name: 'Ahmad Hilalul Fadli',
      menu: 'Ayam Geprek',
      status: 'completed',
    ),
    Order(
      name: 'TM Panji Fachroni',
      menu: 'Nasi Goreng Jumbo',
      status: 'completed',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Order Management',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          // SEARCH
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search on home',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey.shade200,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // TABS
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              tabs.length,
              (index) => GestureDetector(
                onTap: () {
                  setState(() => selectedTab = index);
                },
                child: Column(
                  children: [
                    Text(
                      tabs[index],
                      style: TextStyle(
                        color: selectedTab == index
                            ? const Color(0xffFF4D78)
                            : Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 6),
                    if (selectedTab == index)
                      Container(
                        height: 3,
                        width: 30,
                        decoration: BoxDecoration(
                          color: const Color(0xffFF4D78),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 12),

          // ORDER LIST
          Expanded(child: ListView(children: _ordersByTab())),
        ],
      ),
    );
  }

  List<Widget> _ordersByTab() {
    String status;

    if (selectedTab == 0) {
      status = 'incoming';
    } else if (selectedTab == 1) {
      status = 'process';
    } else {
      status = 'completed';
    }

    final filteredOrders = orders
        .where((order) => order.status == status)
        .toList();

    if (filteredOrders.isEmpty) {
      return [
        const Padding(
          padding: EdgeInsets.only(top: 40),
          child: Center(
            child: Text('No orders', style: TextStyle(color: Colors.grey)),
          ),
        ),
      ];
    }

    return filteredOrders.map((order) {
      return Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey.shade300,
            child: const Icon(Icons.person, color: Colors.black),
          ),
          title: Text(order.name),
          subtitle: Text(order.menu),
        ),
      );
    }).toList();
  }
}

// ================= MODEL =================

class Order {
  final String name;
  final String menu;
  final String status;

  Order({required this.name, required this.menu, required this.status});
}
