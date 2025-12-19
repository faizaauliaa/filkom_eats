import 'package:flutter/material.dart';
import 'order_page.dart';
import 'profile_page.dart';
import 'favourite_page.dart';
import 'favorite_manager.dart';
import 'purchase_history_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

// ================= HOME PAGE =================
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFF4D78),
      drawer: _buildDrawer(context),
      appBar: AppBar(
        backgroundColor: const Color(0xffFF4D78),
        elevation: 0,
        centerTitle: true,
        title: const Text('Home'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'Welcome!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xffF5F5F5),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  KantinCard(
                    title: 'Kantin Henny',
                    onTap: () => _go(context, 'Kantin Henny'),
                  ),
                  KantinCard(
                    title: 'Kantin Bu Ridok',
                    onTap: () => _go(context, 'Kantin Bu Ridok'),
                  ),
                  KantinCard(
                    title: 'Lalapan Mbak Eli',
                    onTap: () => _go(context, 'Lalapan Mbak Eli'),
                  ),
                  KantinCard(
                    title: 'Warung Bu Mimin',
                    onTap: () => _go(context, 'Warung Bu Mimin'),
                  ),
                  KantinCard(
                    title: 'Amazing Mie',
                    onTap: () => _go(context, 'Amazing Mie'),
                  ),
                  KantinCard(
                    title: 'Kantin DWP FILKOM',
                    onTap: () => _go(context, 'Kantin DWP FILKOM'),
                  ),
                  KantinCard(
                    title: 'Toko Kue Alamanda',
                    onTap: () => _go(context, 'Toko Kue Alamanda'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _go(BuildContext context, String name) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => KantinMenuPage(kantinName: name)),
    );
  }

  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xffFF4D78),
      child: Column(
        children: [
          const SizedBox(height: 60),
          const CircleAvatar(
            radius: 35,
            backgroundColor: Colors.white,
            child: Icon(Icons.person, size: 40, color: Color(0xffFF4D78)),
          ),
          const SizedBox(height: 10),
          const Text(
            'Aisha Maryam',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const Text(
            'Informathics Engineering 24',
            style: TextStyle(color: Colors.white70, fontSize: 12),
          ),
          const SizedBox(height: 30),

          _drawerItem(
            Icons.home,
            'Home',
            onTap: () {
              Navigator.pop(context);
            },
          ),

          _drawerItem(
            Icons.favorite,
            'Favourite',
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const FavouritePage()),
              );
            },
          ),
          _drawerItem(
            Icons.star,
            'Rating',
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const PurchaseHistoryPage()),
              );
            },
          ),
          _drawerItem(
            Icons.person_outline,
            'Profile',
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ProfilePage()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _drawerItem(IconData icon, String title, {VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      onTap: onTap,
    );
  }
}

class KantinCard extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const KantinCard({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: const Color(0xffFF8FAB),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Container(
              width: 55,
              height: 55,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.store, color: Color(0xffFF4D78)),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ================= KANTIN MENU PAGE =================
class KantinMenuPage extends StatelessWidget {
  final String kantinName;
  const KantinMenuPage({super.key, required this.kantinName});

  static final Map<String, List<MenuData>> kantinMenus = {
    'Kantin Henny': [
      //NASGOR
      MenuData('Nasgor Mix', 'Sosis, Ayam', 'Rp14.000'),
      MenuData('Nasgor Mix + Katsu', '', 'Rp17.000'),
      MenuData('Nasgor Mix + Telur', '', 'Rp17.000'),
      MenuData('Nasgor Mix + Chicken Popcorn', '', 'Rp17.000'),

      //MIE
      MenuData('Mie Ayam', '', 'Rp10.000'),
      MenuData('Mie Pangsit', '', 'Rp10.000'),
      MenuData('Mie Yamin', '', 'Rp10.000'),
      MenuData('Mie Tumplek', '', 'Rp10.000'),
      MenuData('Topping Chicken Popcorn', '', 'Rp5.000'),

      //TOPPING
      MenuData('Topping Katsu', '', 'Rp5.000'),
      MenuData('Topping Telur', '', 'Rp5.000'),
    ],
    'Kantin Bu Ridok': [
      // NASI
      MenuData('Nasi Tahu Telor', '', 'Rp14.000'),
      MenuData('Nasi Tahu Tek', '', 'Rp11.000'),
      MenuData('Nasi Tahu Tek Crispy', '', 'Rp13.000'),
      MenuData('Nasi Pecel', '', 'Rp9.000'),
      MenuData('Nasi Soto Ayam', '', 'Rp16.000'),
      MenuData('Nasi Bakso / Bakso Goreng', '', 'Rp15.000'),
      MenuData('Nasi Rawon Daging', '', 'Rp16.000'),
      MenuData('Nasi Rawon Tempe', '', 'Rp10.000'),
      MenuData('Nasi Rawon Telur Asin', '', 'Rp13.000'),

      // LONTONG
      MenuData('Lontong Tahu Telor', '', 'Rp14.000'),
      MenuData('Lontong Tahu Tek', '', 'Rp11.000'),

      // TAMBAHAN LAUK
      MenuData('Bakwan', '', 'Rp2.000'),
      MenuData('Tempe / Tahu', '', 'Rp2.000'),
      MenuData('Bakso Goreng', '', 'Rp4.000'),
      MenuData('Telur Goreng / Rebus', '', 'Rp4.000'),
      MenuData('Telur Asin', '', 'Rp5.000'),
      MenuData('Kerupuk', '', 'Rp1.000'),
    ],
    'Lalapan Mbak Eli': [
      // CRISPY
      MenuData('Ayam Crispy', '', 'Rp14.000'),
      MenuData('Usus Crispy', '', 'Rp13.000'),
      MenuData('Jamur Crispy', '', 'Rp12.000'),
      MenuData('Belut Crispy', '', 'Rp16.000'),
      MenuData('Udang Crispy', '', 'Rp16.000'),

      // PEDAS KUAH
      MenuData('Ceker Crispy', '', 'Rp12.000'),
      MenuData('Sayap Pedas', '', 'Rp13.000'),

      // UNGKEP / GORENG
      MenuData('Bakwan', '', 'Rp2.000'),
      MenuData('Tempe / Tahu', '', 'Rp2.000'),
      MenuData('Bakso Goreng', '', 'Rp4.000'),
      MenuData('Telur Goreng / Rebus', '', 'Rp4.000'),
      MenuData('Telur Asin', '', 'Rp5.000'),
      MenuData('Kerupuk', '', 'Rp1.000'),
    ],
    'Warung Bu Mimin': [
      // CHICKEN
      MenuData('Nasi Ayam Bakar', '', 'Rp7.000'),
      MenuData('Nasi Ayam Kecap', '', 'Rp10.000'),
      MenuData('Nasi Ayam Krispi', '', 'Rp12.000'),
      MenuData('Nasi Ayam Laos', '', 'Rp10.000'),

      // NASI BAKAR
      MenuData('Nasi Bakar Ayam', '', 'Rp13.000'),
      MenuData('Nasi Bakar Jamur', '', 'Rp12.000'),
      MenuData('Nasi Bakar Tongkol', '', 'Rp13.000'),

      // ANOTHER MAIN COURSE
      MenuData('Nasi Jamur', '', 'Rp10.000'),
      MenuData('Nasi Telur', '', 'Rp10.000'),
    ],

    'Amazing Mie': [
      // MAIN COURSE
      MenuData('Mie Goreng Single', '', 'Rp7.000'),
      MenuData('Mie Goreng Double', '', 'Rp10.000'),
      MenuData('Mie Kuah Single', '', 'Rp7.000'),
      MenuData('Mie Kuah Double', '', 'Rp10.000'),

      // TOPPING
      MenuData('Telur (1 Pcs)', '', 'Rp3.000'),
      MenuData('Sosis (1 Pcs)', '', 'Rp2.000'),
      MenuData('Keju', '', 'Rp3.000'),
      MenuData('Bakso (2 Pcs)', '', 'Rp3.000'),
      MenuData('Crab Stick (2 Pcs)', '', 'Rp3.000'),
      MenuData('Chikuwa (2 Pcs)', '', 'Rp3.000'),
      MenuData('Dumpling (2 Pcs)', '', 'Rp3.000'),
      MenuData('Nugget (2 Pcs)', '', 'Rp3.000'),

      // POP MIE
      MenuData('All Varian Pop Mie', '', 'Rp7.000'),

      // AMAZING ODENG
      MenuData('Amazing 1', 'Odeng, Fish Ball', 'Rp7.000'),
      MenuData(
        'Amazing 2',
        'Odeng, Fish Ball, Cake Spicy, Dumpling',
        'Rp7.000',
      ),
      MenuData(
        'Amazing 3',
        'Odeng, Fish Ball, Cake, Dumpling, Crabstick, Ball, Sweetcorn',
        'Rp7.000',
      ),
    ],

    'Kantin DWP FILKOM': [
      // POP ICE
      MenuData('Pop Ice Sultan Chocolate', '', 'Rp5.000'),
      MenuData('Pop Ice Sultan Marie Biscuit', '', 'Rp5.000'),
      MenuData('Pop Ice Sultan Popcorn Caramel', '', 'Rp5.000'),
      MenuData('Pop Ice Sultan Cheese Red Velvet', '', 'Rp5.000'),
      MenuData('Pop Ice Sultan Cookies and Cream', '', 'Rp5.000'),
      MenuData('Pop Ice Strawberry', '', 'Rp5.000'),
      MenuData('Pop Ice Permen Karet', '', 'Rp5.000'),
      MenuData('Pop Ice Grape', '', 'Rp5.000'),
      MenuData('Pop Ice Melon', '', 'Rp5.000'),
      MenuData('Pop Ice Taro', '', 'Rp5.000'),
      MenuData('Pop Ice Chocolate', '', 'Rp5.000'),
      MenuData('Pop Ice Mango', '', 'Rp5.000'),
      MenuData('Pop Ice Lychee', '', 'Rp5.000'),

      // CHOCOLATOS
      MenuData('Full Chocolatey', '', 'Rp6.000'),
      MenuData('Smooth Vanilla Latte', '', 'Rp6.000'),

      // GOOD DAY
      MenuData('Good Day Coolin Coffee', '', 'Rp6.000'),
      MenuData('Good Day Mocacinno', '', 'Rp6.000'),
      MenuData('Good Day Vanilla Latte', '', 'Rp6.000'),
      MenuData('Good Day Latte', '', 'Rp5.000'),
      MenuData('Good Day Cappuccino', '', 'Rp5.000'),

      // NUTRISARI
      MenuData('Nutrisari Sweet Orange', '', 'Rp6.000'),
      MenuData('Nutrisari Jeruk Nipis', '', 'Rp6.000'),
      MenuData('Nutrisari Milky Orange', '', 'Rp6.000'),
      MenuData('Nutrisari Anggur', '', 'Rp6.000'),
      MenuData('Nutrisari Sweet Mango', '', 'Rp6.000'),

      // ANOTHER DRINK
      MenuData('Indocafe Coffeemix', '', 'Rp5.000'),
      MenuData('Caffino', '', 'Rp5.000'),
      MenuData('Torabika Cappuccino', '', 'Rp5.000'),
      MenuData('White Koffie', '', 'Rp5.000'),
      MenuData('Milo', '', 'Rp5.000'),
    ],

    'Toko Kue Alamanda': [
      // JAJANAN
      MenuData('Risol Mayonaise', '', 'Rp4.000'),
      MenuData('Risol Sayur', '', 'Rp3.000'),
      MenuData('Tahu Baso', '', 'Rp4.000'),
      MenuData('Kebab Mini', '', 'Rp6.000'),
      MenuData('Roti Burger', '', 'Rp7.000'),
      MenuData('Roti Pizza', '', 'Rp5.000'),
      MenuData('Kroket Kentang', '', 'Rp3.000'),
      MenuData('Kroket Bihun', '', 'Rp3.000'),
      MenuData('Ketan Ayam', '', 'Rp3.000'),
      MenuData('Pastel Sayur', '', 'Rp3.000'),
      MenuData('Cilok', '', 'Rp3.000'),
      MenuData('Martabak Tahu', '', 'Rp3.000'),
      MenuData('Sosis Solo', '', 'Rp4.000'),
      MenuData('Cireng', '', 'Rp2.000'),
      MenuData('Bakwan', '', 'Rp2.000'),
      MenuData('Keripik Singkong', '', 'Rp2.000'),
      MenuData('Keripik Pisang Asin', '', 'Rp2.000'),
      MenuData('Kue Putu', '', 'Rp2.000'),
      MenuData('Lapis Pelangi', '', 'Rp2.000'),

      //KUE & ROTI
      MenuData('Kue Talam Putih', '', 'Rp2.000'),
      MenuData('Dadar Gulung', '', 'Rp2.000'),
      MenuData('Klepon', '', 'Rp2.000'),
      MenuData('Onde-Onde', '', 'Rp2.000'),
      MenuData('Serabi Mini', '', 'Rp2.000'),
      MenuData('Brownies', '', 'Rp4.000'),
      MenuData('Roti Boy', '', 'Rp6.000'),
      MenuData('Roti Isi', '', 'Rp5.000'),
      MenuData('Donat Gula', '', 'Rp2.000'),
      MenuData('Donat Gula Isi', '', 'Rp2.000'),
      MenuData('Donat Topping', '', 'Rp2.000'),
      MenuData('Martabak Mini Manis', '', 'Rp4.000'),
      MenuData('Bolu Kukus', '', 'Rp6.000'),
      MenuData('Roti Isi Manis', '', 'Rp5.000'),

      // BUAH
      MenuData('Buah Melon', '', 'Rp2.000'),
      MenuData('Buah Pepaya', '', 'Rp2.000'),
      MenuData('Buah Nanas', '', 'Rp2.000'),
    ],
  };

  @override
  Widget build(BuildContext context) {
    final menus = kantinMenus[kantinName] ?? [];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFF4D78),
        elevation: 0,
        title: Text(kantinName),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: menus.map((m) => MenuTile(menu: m)).toList(),
      ),
    );
  }
}

class MenuData {
  final String title;
  final String subtitle;
  final String price;
  MenuData(this.title, this.subtitle, this.price);
}

class MenuTile extends StatelessWidget {
  final MenuData menu;
  const MenuTile({super.key, required this.menu});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showDetail(context),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  menu.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                if (menu.subtitle.isNotEmpty)
                  Text(
                    menu.subtitle,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                Text(
                  menu.price,
                  style: const TextStyle(color: Color(0xffFF4D78)),
                ),
              ],
            ),
            const Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
      ),
    );
  }

  void _showDetail(BuildContext context) {
    int qty = 1;
    bool isFav = FavouriteManager.isFavourite(menu.title);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xffEAD6D6),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      builder: (_) => StatefulBuilder(
        builder: (context, setState) => Padding(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 160,
                  height: 160,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: const Icon(
                    Icons.rice_bowl,
                    size: 90,
                    color: Color(0xffFF4D78),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                menu.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (menu.subtitle.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    menu.subtitle,
                    style: const TextStyle(color: Color(0xffFF4D78)),
                  ),
                ),
              const SizedBox(height: 10),
              Text(
                menu.price,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      _actionButton(
                        icon: Icons.remove,
                        onTap: () {
                          if (qty > 1) setState(() => qty--);
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: Text(
                          '$qty',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      _actionButton(
                        icon: Icons.add,
                        onTap: () => setState(() => qty++),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      _actionButton(
                        icon: isFav ? Icons.favorite : Icons.favorite_border,
                        color: const Color(0xffFF4D78),
                        onTap: () {
                          setState(() {
                            FavouriteManager.toggleFavourite(
                              FavouriteItem(
                                name: menu.title,
                                note: menu.subtitle,
                                price: menu.price,
                              ),
                            );
                            isFav = !isFav;
                          });
                        },
                      ),
                      const SizedBox(width: 12),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => OrderPage(
                                orderItems: [
                                  OrderItem(
                                    name: menu.title,
                                    note: menu.subtitle,
                                    price: menu.price,
                                    qty: qty,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        borderRadius: BorderRadius.circular(14),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 26,
                            vertical: 14,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xffFF4D78),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: const Text(
                            'Buy Now',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _actionButton({
    required IconData icon,
    required VoidCallback onTap,
    Color? color,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, size: 18, color: color),
      ),
    );
  }
}
