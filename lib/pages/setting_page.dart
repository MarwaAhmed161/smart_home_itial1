import 'package:flutter/material.dart';
import 'login_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool notifications = true;
  bool darkMode = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF141414),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Settings"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          const Text("Account",
              style: TextStyle(color: Colors.white70, fontSize: 16)),

          const SizedBox(height: 10),

          Card(
            color: const Color(0xFF1A2235),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.person, color: Colors.white),
                  title: const Text("Edit Profile",
                      style: TextStyle(color: Colors.white)),
                  onTap: () {},
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.lock, color: Colors.white),
                  title: const Text("Change Password",
                      style: TextStyle(color: Colors.white)),
                  onTap: () {},
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          const Text("Preferences",
              style: TextStyle(color: Colors.white70, fontSize: 16)),

          const SizedBox(height: 10),

          Card(
            color: const Color(0xFF1A2235),
            child: Column(
              children: [
                SwitchListTile(
                  title: const Text("Notifications",
                      style: TextStyle(color: Colors.white)),
                  value: notifications,
                  onChanged: (val) {
                    setState(() => notifications = val);
                  },
                ),
                SwitchListTile(
                  title: const Text("Dark Mode",
                      style: TextStyle(color: Colors.white)),
                  value: darkMode,
                  onChanged: (val) {
                    setState(() => darkMode = val);
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          const Text("About",
              style: TextStyle(color: Colors.white70, fontSize: 16)),

          const SizedBox(height: 10),

          Card(
            color: const Color(0xFF1A2235),
            child: Column(
              children: const [
                ListTile(
                  leading: Icon(Icons.info, color: Colors.white),
                  title: Text("App Version",
                      style: TextStyle(color: Colors.white)),
                  trailing: Text("1.0.0",
                      style: TextStyle(color: Colors.white70)),
                ),
              ],
            ),
          ),

          const SizedBox(height: 40),

          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              minimumSize: const Size(double.infinity, 55),
            ),
            icon: const Icon(Icons.logout),
            label: const Text("Logout"),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const LoginScreeen()),
                    (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
