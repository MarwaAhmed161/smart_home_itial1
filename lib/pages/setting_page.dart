import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool notifications = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text("Notifications"),
            value: notifications,
            onChanged: (val) {
              setState(() {
                notifications = val;
              });
            },
          ),
          ListTile(
            title: const Text("Change Password"),
            leading: const Icon(Icons.lock),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
