import 'package:flutter/material.dart';
import '../widets/RoomCard.dart';
import 'DynamicDevicesPage.dart';
import 'Profile_Page.dart';
import 'Setting_Page.dart';

class RoomsPage extends StatefulWidget {
  const RoomsPage({super.key});

  @override
  State<RoomsPage> createState() => _RoomsPageState();
}

class _RoomsPageState extends State<RoomsPage> {

  final String userName = "Marwa Ahmed";

  final List<Map<String, dynamic>> rooms = [
    {'title': 'Living Room', 'image': 'assets/images/living room decore.jpg'},
    {'title': 'Kitchen Room', 'image': 'assets/images/Kitchen Room.jpg'},
    {'title': 'Bed Room', 'image': 'assets/images/Bed Room.jpg'},
    {'title': 'Bath Room', 'image': 'assets/images/Bath Room.jpg'},
  ];

  Map<String, List<Map<String, dynamic>>> roomDevices = {
    "Living Room": [],
    "Kitchen Room": [],
    "Bed Room": [],
    "Bath Room": [],
  };

  @override
  Widget build(BuildContext context) {

    /// حساب الطاقة
    double totalPower = 0;
    int activeDevices = 0;

    roomDevices.forEach((room, devices) {
      for (var d in devices) {
        if (d["isOn"] == true) {
          totalPower += (d["power"] ?? 0);
          activeDevices++;
        }
      }
    });

    return Scaffold(
      backgroundColor: const Color(0xFF141414),

      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Smart Home"),
        actions: [

          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const ProfilePage()));
            },
          ),

          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const SettingsPage()));
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text("Welcome, $userName",
                style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),

            const SizedBox(height: 20),

            /// Dashboard
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color(0xFF1A2235),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Total Power",
                          style: TextStyle(color: Colors.white70)),
                      Text("${totalPower.toStringAsFixed(1)} W",
                          style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text("Active Devices",
                          style: TextStyle(color: Colors.white70)),
                      Text("$activeDevices",
                          style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ],
                  ),

                ],
              ),
            ),

            const SizedBox(height: 25),

            const Text("Your Rooms",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),

            const SizedBox(height: 12),

            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 1.35,
              children: rooms.map((room) {

                String title = room['title'];

                return RoomCard(
                  title: title,
                  subtitle:
                  "Active devices: ${roomDevices[title]?.length ?? 0}",
                  imageUrl: room['image'],
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DynamicDevicesPage(
                          roomName: title,
                          devices: roomDevices[title]!,
                        ),
                      ),
                    );

                    setState(() {});
                  },
                );

              }).toList(),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        child: const Icon(Icons.add),
        onPressed: () {
          showAddRoomDialog(context);
        },
      ),
    );
  }

  void showAddRoomDialog(BuildContext context) {
    TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text("Add New Room"),
          content: TextField(controller: controller),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel")),
            ElevatedButton(
              onPressed: () {
                String name = controller.text.trim();
                if (name.isNotEmpty) {
                  setState(() {
                    rooms.add({
                      'title': name,
                      'image': 'assets/images/living room decore.jpg',
                    });
                    roomDevices[name] = [];
                  });
                }
                Navigator.pop(context);
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }
}
