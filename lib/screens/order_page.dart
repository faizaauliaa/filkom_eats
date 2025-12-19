import 'package:flutter/material.dart';
import 'payment_page.dart';

class OrderItem {
  final String name;
  final String note;
  final String price;
  final int qty;

  OrderItem({
    required this.name,
    required this.note,
    required this.price,
    required this.qty,
  });
}

class OrderPage extends StatefulWidget {
  final List<OrderItem> orderItems;
  const OrderPage({super.key, required this.orderItems});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int selectedType = 0; // 0 Delivery, 1 Pickup
  bool schedule = false;
  TimeOfDay selectedTime = const TimeOfDay(hour: 10, minute: 0);

  String? selectedBuilding;
  String? selectedSpot;

  final Map<String, List<String>> deliveryLocations = {
    "Gedung A FILKOM": ["A1", "A2"],
    "Gedung F FILKOM": [
      "F1",
      "F2",
      "F3",
      "F4",
      "F5",
      "F6",
      "F7",
      "F8",
      "F9",
      "F10",
      "F11",
      "F12",
    ],
    "Gedung G FILKOM": ["G1.1", "G1.2", "G1.3", "G1.4", "G1.5", "G1.6", "G2"],
    "Gedung Riset FILKOM": ["Lab 1", "Lab 2"],
    "GKM FILKOM": ["Depan", "Samping"],
    "Junction FILKOM": ["Entrance"],
    "Selasar FILKOM": ["Utara", "Selatan"],
  };
  int _parse(String p) => int.parse(p.replaceAll('Rp', '').replaceAll('.', ''));

  int total = 0;
  @override
  Widget build(BuildContext context) {
    final subtotal = widget.orderItems.fold(
      0,
      (s, e) => s + _parse(e.price) * e.qty,
    );

    final handlingFee = selectedType == 0 ? 2000 : 0;
    total = subtotal + handlingFee;

    return Scaffold(
      backgroundColor: const Color(0xffF3F3F3),
      appBar: AppBar(
        backgroundColor: const Color(0xffFF4D78),
        title: const Text("Order"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _deliveryBar(),
          if (selectedType == 0) ...[
            const SizedBox(height: 12),
            _deliveryLocationCard(),
          ],

          const SizedBox(height: 12),
          ...widget.orderItems.map(_menuCard),
          const SizedBox(height: 12),
          _addMore(),
          const SizedBox(height: 16),
          _summary(subtotal, handlingFee, total),
        ],
      ),
      bottomNavigationBar: _orderButton(),
    );
  }

  // ================= DELIVERY BAR =================

  Widget _deliveryBar() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: const Color(0xffFFD1DC),
                child: Icon(
                  selectedType == 0 ? Icons.delivery_dining : Icons.store,
                  color: const Color(0xffFF4D78),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                selectedType == 0 ? "Delivery" : "Pickup",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          InkWell(
            onTap: () => _showBottomSheet(total),
            borderRadius: BorderRadius.circular(20),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text("Ganti", style: TextStyle(fontSize: 12)),
            ),
          ),
        ],
      ),
    );
  }

  // ================= LOCATION CARD =================
  Widget _deliveryLocationCard() {
    return InkWell(
      onTap: () async {
        final result = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DeliveryLocationPage(
              locations: deliveryLocations,
              selectedBuilding: selectedBuilding,
              selectedSpot: selectedSpot,
            ),
          ),
        );

        if (result != null) {
          setState(() {
            selectedBuilding = result['building'];
            selectedSpot = result['spot'];
          });
        }
      },
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Delivery Location",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            selectedBuilding == null
                ? const Text(
                    "Pilih lokasi pengantaran",
                    style: TextStyle(color: Colors.grey),
                  )
                : Text(
                    "$selectedBuilding - $selectedSpot",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
          ],
        ),
      ),
    );
  }

  // ================= MENU CARD =================

  Widget _menuCard(OrderItem item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                if (item.note.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(
                      "Catatan: ${item.note}",
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
                const SizedBox(height: 4),
                Text(
                  item.price,
                  style: const TextStyle(color: Color(0xffFF4D78)),
                ),
              ],
            ),
          ),
          Text(
            "x${item.qty}",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  // ================= ADD MORE =================

  Widget _addMore() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Ada lagi yang mau dibeli?",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          InkWell(
            onTap: () => Navigator.pop(context),
            borderRadius: BorderRadius.circular(20),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xffFF4D78),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                "Tambah",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ================= SUMMARY =================

  Widget _summary(int subtotal, int fee, int total) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Ringkasan Pembayaran",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          _row("Harga", subtotal),
          if (fee > 0) _row("Biaya Penanganan & Pengiriman", fee),
          if (schedule && selectedType == 0)
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Text(
                "Pengantaran: ${selectedTime.format(context)}",
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
          if (selectedType == 0 && selectedBuilding != null)
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Text(
                "Lokasi: $selectedBuilding - $selectedSpot",
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),

          const Divider(),
          _row("Total Pembayaran", total, bold: true),
        ],
      ),
    );
  }

  Widget _row(String label, int value, {bool bold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(
            "Rp$value",
            style: TextStyle(
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  // ================= ORDER BUTTON =================

  Widget _orderButton() {
    final canOrder =
        selectedType == 1 || (selectedBuilding != null && selectedSpot != null);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: canOrder ? const Color(0xffFF4D78) : Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          padding: const EdgeInsets.symmetric(vertical: 14),
        ),
        onPressed:
            selectedType == 0 &&
                (selectedBuilding == null || selectedSpot == null)
            ? null
            : () => _showBottomSheet(total),
        child: const Text("Order Now"),
      ),
    );
  }

  // ================= BOTTOM SHEET =================

  void _showBottomSheet(int total) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      builder: (_) {
        return StatefulBuilder(
          builder: (context, setModal) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Pilih tipe pembelian",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),

                  Row(
                    children: [
                      _typeOption(
                        "Delivery",
                        Icons.delivery_dining,
                        0,
                        onTap: () {
                          setState(() => selectedType = 0);
                          setModal(() {});
                        },
                      ),
                      const SizedBox(width: 12),
                      _typeOption(
                        "Pickup",
                        Icons.store,
                        1,
                        onTap: () {
                          setState(() {
                            selectedType = 1;
                            schedule = false;
                          });
                          setModal(() {});
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text("Jadwalkan Pengantaran"),
                    value: schedule,
                    activeThumbColor: const Color(0xffFF4D78),
                    onChanged: selectedType == 0
                        ? (v) {
                            setState(() => schedule = v);
                            setModal(() {});
                          }
                        : null,
                  ),

                  if (schedule && selectedType == 0)
                    InkWell(
                      onTap: () async {
                        final picked = await showTimePicker(
                          context: context,
                          initialTime: selectedTime,
                        );
                        if (picked != null) {
                          setState(() => selectedTime = picked);
                          setModal(() {});
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            "Hari ini | ${selectedTime.format(context)}",
                            style: const TextStyle(fontSize: 13),
                          ),
                        ),
                      ),
                    ),

                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.pop(context); // tutup bottom sheet

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => PaymentPage(
                                  total: total,
                                  location: selectedType == 0
                                      ? "$selectedBuilding - $selectedSpot"
                                      : "Pickup di Kantin",
                                  items: widget.orderItems,
                                ),
                              ),
                            );
                          },
                          child: const Text("Batal"),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffFF4D78),
                          ),
                          onPressed: () {
                            // VALIDASI LOKASI DELIVERY
                            if (selectedType == 0 &&
                                (selectedBuilding == null ||
                                    selectedSpot == null)) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "Pilih lokasi pengantaran dulu",
                                  ),
                                ),
                              );
                              return;
                            }

                            Navigator.pop(context); // tutup bottom sheet

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => PaymentPage(
                                  total: total,
                                  location: selectedType == 0
                                      ? "$selectedBuilding - $selectedSpot"
                                      : "Pickup di Kantin",
                                  items: widget.orderItems,
                                ),
                              ),
                            );
                          },
                          child: const Text("Konfirmasi"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _typeOption(
    String label,
    IconData icon,
    int value, {
    required VoidCallback onTap,
  }) {
    final selected = selectedType == value;

    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            color: selected ? const Color(0xffFFD1DC) : Colors.grey.shade100,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: selected
                    ? const Color(0xffFF4D78)
                    : Colors.grey.shade300,
                child: Icon(icon, color: selected ? Colors.white : Colors.grey),
              ),
              const SizedBox(height: 6),
              Text(
                label,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: selected ? const Color(0xffFF4D78) : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ================= LOCATION PAGE =================
class DeliveryLocationPage extends StatefulWidget {
  final Map<String, List<String>> locations;
  final String? selectedBuilding;
  final String? selectedSpot;

  const DeliveryLocationPage({
    super.key,
    required this.locations,
    this.selectedBuilding,
    this.selectedSpot,
  });

  @override
  State<DeliveryLocationPage> createState() => _DeliveryLocationPageState();
}

class _DeliveryLocationPageState extends State<DeliveryLocationPage> {
  String? building;
  String? spot;

  @override
  void initState() {
    super.initState();
    building = widget.selectedBuilding;
    spot = widget.selectedSpot;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Delivery Location")),
      body: ListView(
        children: widget.locations.entries.map((e) {
          return ExpansionTile(
            title: Text(e.key),
            children: e.value.map((s) {
              final selected = building == e.key && spot == s;
              return ListTile(
                title: Text(s),
                trailing: selected
                    ? const Icon(Icons.check, color: Colors.green)
                    : null,
                onTap: () {
                  setState(() {
                    building = e.key;
                    spot = s;
                  });
                  Navigator.pop(context, {'building': e.key, 'spot': s});
                },
              );
            }).toList(),
          );
        }).toList(),
      ),
    );
  }
}
