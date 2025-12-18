import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/delivery_spot.dart';

class DeliveryMapPage extends StatefulWidget {
  const DeliveryMapPage({super.key});

  @override
  State<DeliveryMapPage> createState() => _DeliveryMapPageState();
}

class _DeliveryMapPageState extends State<DeliveryMapPage> {
  DeliverySpot? selectedSpot;

  final List<DeliverySpot> spots = [
    DeliverySpot(
      building: "Gedung F FILKOM",
      subLocation: "F2.1",
      price: 2000,
      lat: -7.9529,
      lng: 112.6145,
    ),
    DeliverySpot(
      building: "Gedung F FILKOM",
      subLocation: "F2.2",
      price: 2000,
      lat: -7.9531,
      lng: 112.6147,
    ),
    DeliverySpot(
      building: "Gedung G FILKOM",
      subLocation: "GKM",
      price: 2000,
      lat: -7.9540,
      lng: 112.6152,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select Delivery Point")),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              initialCameraPosition: const CameraPosition(
                target: LatLng(-7.9530, 112.6146),
                zoom: 17,
              ),
              markers: spots.map((s) {
                return Marker(
                  markerId: MarkerId(s.fullName),
                  position: LatLng(s.lat, s.lng),
                  onTap: () => setState(() => selectedSpot = s),
                );
              }).toSet(),
            ),
          ),

          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                if (selectedSpot != null)
                  Text(
                    selectedSpot!.fullName,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffFF4D78),
                  ),
                  onPressed: selectedSpot == null
                      ? null
                      : () => Navigator.pop(context, selectedSpot),
                  child: const Text("Select This Spot"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
