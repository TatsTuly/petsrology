import 'package:flutter/material.dart';

class LogoutPage extends StatelessWidget {
  const LogoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Logout",
          style: TextStyle(color: Colors.white), // Set title color to white
        ),
        backgroundColor: const Color.fromARGB(255, 124, 31, 88),
        iconTheme: const IconThemeData(
          color: Colors.white, // Set back button color to white
        ),
      ),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {
            _showLogoutConfirmation(context); // Show confirmation dialog
          },
          icon: const Icon(Icons.logout),
          label: const Text("Confirm Logout"),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 124, 31, 88),
            foregroundColor: Colors.white, // Set text color to white
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
    );
  }

  void _showLogoutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text("Confirm Logout"),
          content: const Text("Are you sure you want to log out?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext); // Close the dialog
              },
              child: const Text("No"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext); // Close the dialog
                Navigator.pushReplacementNamed(
                    context, '/'); // Navigate to Welcome Page
              },
              child: const Text("Yes"),
            ),
          ],
        );
      },
    );
  }
}
