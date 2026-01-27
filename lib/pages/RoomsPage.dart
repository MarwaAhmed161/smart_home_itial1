import 'package:flutter/material.dart';

import '../widets/RoomCard.dart';
import 'DashboardChartsPage.dart';
import 'DynamicDevicesPage.dart';


class RoomsPage extends StatelessWidget {
  final List<Map<String, dynamic>> rooms = [
    {
      'title': 'Living Room',
      'subtitle': 'Active devices: 3',
      'image': 'assets/images/living room decore.jpg',
    },
    {
      'title': 'Kitchen Room',
      'subtitle': 'Active devices: 3',
      'image': 'assets/images/Kitchen Room.jpg',
    },
    {
      'title': 'Bed Room',
      'subtitle': 'Active devices: 3',
      'image': 'assets/images/Bed Room.jpg',
    },
    {
      'title': 'Bath Room',
      'subtitle': 'Active devices: 0',
      'image': 'assets/images/Bath Room.jpg',
    },
  ];

  RoomsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF141414),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundImage: AssetImage("assets/images/pink.jpg"),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Welcome',
                        style: TextStyle(fontSize: 14, color: Colors.white70),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Marwa Ahmed',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.grid_view_rounded),
                    onPressed: () {},
                    color: Colors.white70,
                  )
                ],
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  const Text(
                    'Your Rooms',
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child:
                    const Text('see all', style: TextStyle(color: Colors.white70)),
                  )
                ],
              ),
              const SizedBox(height: 12),
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                childAspectRatio: 1.35,
                children: rooms.map((room) {
                  return RoomCard(
                    title: room['title'],
                    subtitle: room['subtitle'],
                    imageUrl: room['image'],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DynamicDevicesPage(roomName: room['title']),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 28),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => DashboardChartsPage(
                              currentValues: [2, 5, 8, 7, 9, 7],
                              voltageValues: [8, 7, 9, 4, 12, 8],
                              powerValues: [8, 9, 7, 4, 5, 2])));
                },
                child: const Text("Show the Graphs"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
