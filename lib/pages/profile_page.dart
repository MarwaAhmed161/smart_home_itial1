import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {

  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {

    // بيانات مؤقتة
    String name = "Marwa Ahmed";
    String email = "marwa@email.com";

    return Scaffold(
      backgroundColor: const Color(0xFF141414),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            const SizedBox(height: 20),

            const CircleAvatar(
              radius: 55,
              backgroundImage: AssetImage("assets/images/pink.jpg"),
            ),

            const SizedBox(height: 20),

            Text(
              name,
              style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),

            const SizedBox(height: 8),

            Text(
              email,
              style: const TextStyle(color: Colors.white70),
            ),

            const SizedBox(height: 30),

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
}
