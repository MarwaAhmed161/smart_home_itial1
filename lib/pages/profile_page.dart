import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: Column(
        children: const [
          SizedBox(height: 40),
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage("assets/images/pink.jpg"),
          ),
          SizedBox(height: 20),
          Text("Marwa Ahmed",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text("marwa@email.com"),
        ],
      ),
    );
  }
}
