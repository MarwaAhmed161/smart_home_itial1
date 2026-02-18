import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {

    String name = "Marwa Ahmed";
    String email = "marwa@email.com";

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor
      ,
      appBar: AppBar(
        backgroundColor: Colors.white12,
        title: const Text("Profile"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            /// Header Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF1A2235),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("assets/images/pink.jpg"),
                  ),
                  const SizedBox(height: 12),
                  Text(name,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  Text(email,
                      style: const TextStyle(color: Colors.white70)),
                ],
              ),
            ),

            const SizedBox(height: 25),

            /// Stats
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                statCard("Rooms", "4"),
                statCard("Devices", "12"),
                statCard("Today", "2.4 kWh"),
              ],
            ),

            const SizedBox(height: 25),

            Card(
              color: const Color(0xFF1A2235),
              child: ListTile(
                leading: const Icon(Icons.edit, color: Colors.white),
                title: const Text("Edit Profile",
                    style: TextStyle(color: Colors.white)),
                onTap: () {},
              ),
            ),

            Card(
              color: const Color(0xFF1A2235),
              child: ListTile(
                leading: const Icon(Icons.history, color: Colors.white),
                title: const Text("Usage History",
                    style: TextStyle(color: Colors.white)),
                onTap: () {},
              ),
            ),

            const Spacer(),

            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: const Size(double.infinity, 50),
              ),
              icon: const Icon(Icons.logout),
              label: const Text("Logout"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget statCard(String title, String value) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFF1A2235),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          children: [
            Text(value,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            Text(title,
                style: const TextStyle(color: Colors.white70)),
          ],
        ),
      ),
    );
  }
}
