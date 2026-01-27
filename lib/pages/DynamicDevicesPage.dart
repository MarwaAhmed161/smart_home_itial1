import 'package:flutter/material.dart';
import '../widets/DeviceCard.dart';


class DynamicDevicesPage extends StatelessWidget {
  final String roomName;

  const DynamicDevicesPage({super.key, required this.roomName});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> devices = roomDevices[roomName] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text(roomName),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: devices.isEmpty
          ? Center(
        child: Text(
          "No devices in $roomName",
          style: const TextStyle(color: Colors.white, fontSize: 22),
        ),
      )
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: devices.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, index) {
            var device = devices[index];
            return DeviceCard(
              iconPath: device["icon"],
              name: device["name"],
              isOn: device["isOn"],
            );
          },
        ),
      ),
    );
  }
}
