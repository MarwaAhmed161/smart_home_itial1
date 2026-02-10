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
    return Scaffold(
      backgroundColor: const Color(0xFF141414),

      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Rooms"),
        actions: [

          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ProfilePage()),
              );
            },
          ),

          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SettingsPage()),
              );
            },
          ),
        ],
      ),

      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        padding: const EdgeInsets.all(16),
        childAspectRatio: 1.35,
        children: rooms.map((room) {

          String title = room['title'];

          return RoomCard(
            title: title,
            subtitle: "Active devices: ${roomDevices[title]?.length ?? 0}",
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

              setState(() {}); // تحديث العدد بعد الرجوع
            },
          );

        }).toList(),
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
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: "Room Name"),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
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
























































































































// import 'package:flutter/material.dart';
//
// import '../widets/DeviceCard.dart';
// import '../widets/RoomCard.dart';
// import 'DashboardChartsPage.dart';
// import 'DynamicDevicesPage.dart';
//
//
//
//
// class RoomsPage extends StatefulWidget {
//
//   RoomsPage({super.key});
//
//   @override
//   State<RoomsPage> createState() => _RoomsPageState();
// }
//
// class _RoomsPageState extends State<RoomsPage> {
//   final List<Map<String, dynamic>> rooms = [
//     {
//       'title': 'Living Room',
//       'subtitle': 'Active devices: 3',
//       'image': 'assets/images/living room decore.jpg',
//     },
//     {
//       'title': 'Kitchen Room',
//       'subtitle': 'Active devices: 3',
//       'image': 'assets/images/Kitchen Room.jpg',
//     },
//     {
//       'title': 'Bed Room',
//       'subtitle': 'Active devices: 3',
//       'image': 'assets/images/Bed Room.jpg',
//     },
//     {
//       'title': 'Bath Room',
//       'subtitle': 'Active devices: 0',
//       'image': 'assets/images/Bath Room.jpg',
//     },
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF141414),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   CircleAvatar(
//                     radius: 22,
//                     backgroundImage: AssetImage("assets/images/pink.jpg"),
//                   ),
//                   const SizedBox(width: 12),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: const [
//                       Text(
//                         'Welcome',
//                         style: TextStyle(fontSize: 14, color: Colors.white70),
//                       ),
//                       SizedBox(height: 2),
//                       Text(
//                         'Marwa Ahmed',
//                         style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white),
//                       ),
//                     ],
//                   ),
//                   const Spacer(),
//                   IconButton(
//                     icon: const Icon(Icons.grid_view_rounded),
//                     onPressed: () {},
//                     color: Colors.white70,
//                   )
//                 ],
//               ),
//               const SizedBox(height: 18),
//               Row(
//                 children: [
//                   const Text(
//                     'Your Rooms',
//                     style: TextStyle(
//                         fontSize: 28,
//                         fontWeight: FontWeight.w800,
//                         color: Colors.white),
//                   ),
//                   const Spacer(),
//                   TextButton(
//                     onPressed: () {},
//                     child:
//                     const Text('see all', style: TextStyle(color: Colors.white70)),
//                   )
//                 ],
//               ),
//               const SizedBox(height: 12),
//               GridView.count(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 12,
//                 mainAxisSpacing: 12,
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 childAspectRatio: 1.35,
//                 children: rooms.map((room) {
//                   return RoomCard(
//                     title: room['title'],
//                     subtitle: room['subtitle'],
//                     imageUrl: room['image'],
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) =>
//                               DynamicDevicesPage(roomName: room['title']),
//                         ),
//                       );
//                     },
//                   );
//                 }).toList(),
//               ),
//               const SizedBox(height: 28),
//               //جزء ال graph
//               // TextButton(
//               //   onPressed: () {
//               //     Navigator.push(
//               //         context,
//               //         MaterialPageRoute(
//               //             builder: (_) => DashboardChartsPage(
//               //                 currentValues: [2, 5, 8, 7, 9, 7],
//               //                 voltageValues: [8, 7, 9, 4, 12, 8],
//               //                 powerValues: [8, 9, 7, 4, 5, 2])));
//               //   },
//               //   child: const Text("Show the Graphs"),
//               // ),
//
//             ],
//           ),
//         ),
//       ),
//
//
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Colors.orange,
//         child: Icon(Icons.add),
//         onPressed: () {
//           showAddRoomDialog(context);
//         },
//       ),
//
//     );
//   }
//   void showAddRoomDialog(BuildContext context) {
//     TextEditingController controller = TextEditingController();
//
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text("Add New Room"),
//           content: TextField(
//             controller: controller,
//             decoration: InputDecoration(
//               hintText: "Room Name",
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Text("Cancel"),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 String roomName = controller.text.trim();
//
//                 if (roomName.isNotEmpty) {
//                   setState(() {
//                     rooms.add({
//                       'title': roomName,
//                       'subtitle': 'Active devices: 0',
//                       'image': 'assets/images/living room decore.jpg',
//                     });
//                   });
//                 }
//
//                 Navigator.pop(context);
//               },
//               child: Text("Add"),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
// }
