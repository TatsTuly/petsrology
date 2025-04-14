import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F0F5),
      body: SafeArea(
        child: Column(
          children: [
            // App Bar with back button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () async {
                      // Show dialog to confirm logout
                      bool? logout = await showDialog<bool>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Logout', style: TextStyle(fontFamily: 'Playfair')),
                          content: const Text(
                            'Do you want to log out?',
                            style: TextStyle(fontFamily: 'Playfair'),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context, false),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context, true),
                              child: const Text('Logout'),
                            ),
                          ],
                        ),
                      );

                      if (logout == true) {
                        await FirebaseAuth.instance.signOut();
                        Navigator.pushReplacementNamed(context, '/loginscreen');
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 96, 2, 125).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.exit_to_app,
                        color: Color.fromARGB(255, 96, 2, 125),
                        size: 22,
                      ),
                    ),
                  ),
                  const Spacer(),
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: const Color.fromARGB(255, 96, 2, 125).withOpacity(0.2),
                    child: const Icon(
                      Icons.person,
                      color: Color.fromARGB(255, 96, 2, 125),
                      size: 22,
                    ),
                  ),
                ],
              ),
            ),
            
            // Top Image
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                'assets/images/start4.png',
                height: 160, // Slightly reduced to accommodate the new app bar
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            // Title
            const Text(
              "What are you looking for?",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 96, 2, 125), // Dark Purple
              ),
            ),
            const SizedBox(height: 20),
            // Buttons
            Expanded(
              child: GridView.count(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: [
                  _buildCategoryButton(
                    context,
                    icon: 'assets/images/home_logo1.png',
                    label: 'Adoption',
                    backgroundColor: Color.fromARGB(255, 253, 155, 188),
                    onTap: () => Navigator.pushNamed(context, '/home_screen'),
                  ),
                  _buildCategoryButton(
                    context,
                    icon: 'assets/images/home_logo2.png',
                    label: 'Veterinary',
                    backgroundColor: Color.fromARGB(255, 150, 185, 251),
                    onTap: () => Navigator.pushNamed(context, '/veterinary'),
                  ),
                  _buildCategoryButton(
                    context,
                    icon: 'assets/images/home_logo3.png',
                    label: 'Pet Care',
                    backgroundColor: Color.fromARGB(255, 233, 154, 255),
                    onTap: () =>
                        Navigator.pushNamed(context, '/product_screen'),
                  ),
                  _buildCategoryButton(
                    context,
                    icon: 'assets/images/home_logo4.png',
                    label: 'Essentials',
                    backgroundColor: Color.fromARGB(255, 152, 226, 255),
                    onTap: () => Navigator.pushNamed(context, '/essentials'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryButton(
    BuildContext context, {
    required String icon,
    required String label,
    required Color backgroundColor,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(2, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(icon, height: 100),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 251, 241, 241),
                borderRadius: BorderRadius.circular(30),
                border:
                    Border.all(color: const Color.fromARGB(255, 39, 35, 35)),
              ),
              child: Text(
                label,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: "Playfair",
                  fontSize: 14,
                  color: Color.fromARGB(255, 32, 31, 32),
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
