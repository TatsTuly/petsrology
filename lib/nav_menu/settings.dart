import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notificationsEnabled = true;
  bool _darkThemeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Settings",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 124, 31, 88),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          SwitchListTile(
            title: const Text("Enable Notifications"),
            subtitle: const Text("Receive updates and alerts"),
            value: _notificationsEnabled,
            onChanged: (bool value) {
              setState(() {
                _notificationsEnabled = value;
              });
            },
            activeColor: const Color.fromARGB(255, 124, 31, 88),
          ),
          const Divider(),
          SwitchListTile(
            title: const Text("Dark Theme"),
            subtitle: const Text("Switch between light and dark mode"),
            value: _darkThemeEnabled,
            onChanged: (bool value) {
              setState(() {
                _darkThemeEnabled = value;
              });
            },
            activeColor: const Color.fromARGB(255, 124, 31, 88),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.person,
                color: Color.fromARGB(255, 124, 31, 88)),
            title: const Text("Account Settings"),
            subtitle: const Text("Manage your account details"),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.privacy_tip,
                color: Color.fromARGB(255, 124, 31, 88)),
            title: const Text("Privacy Policy"),
            subtitle: const Text("Learn about our privacy practices"),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading:
                const Icon(Icons.info, color: Color.fromARGB(255, 124, 31, 88)),
            title: const Text("About App"),
            subtitle: const Text("Learn more about Petsrology"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
