import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA), // Light background
      appBar: AppBar(
        title: const Text(
          "Petsrology",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 124, 31, 88),
        elevation: 0,
        iconTheme: const IconThemeData(
            color: Colors.white), // Set menu button color to white
      ),
      drawer: _buildAppDrawer(context),
      body: SafeArea(
        child: Column(
          children: [
            // Top Image
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                'assets/images/start4.png',
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            // Title
            const Text(
              "What are you looking for?",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 124, 31, 88),
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
                    backgroundColor: const Color(0xFFF9C8D9), // Light pink
                    onTap: () => Navigator.pushNamed(context, '/home_screen'),
                  ),
                  _buildCategoryButton(
                    context,
                    icon: 'assets/images/home_logo2.png',
                    label: 'Veterinary',
                    backgroundColor: const Color(0xFFB1D1FF), // Light blue
                    onTap: () => Navigator.pushNamed(context, '/veterinary_ screen'),
                  ),
                  _buildCategoryButton(
                    context,
                    icon: 'assets/images/home_logo3.png',
                    label: 'Pet Products',
                    backgroundColor: const Color(0xFFDCC6F0), // Light purple
                    onTap: () =>
                        Navigator.pushNamed(context, '/product_screen'),
                  ),
                  _buildCategoryButton(
                    context,
                    icon: 'assets/images/home_logo4.png',
                    label: 'Pet Care Tips',
                    backgroundColor: const Color(0xFFAFE1AF), // Light green
                    onTap: () => Navigator.pushNamed(context, '/petcare'),
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
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                border:
                    Border.all(color: const Color.fromARGB(255, 124, 31, 88)),
              ),
              child: Text(
                label,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Color.fromARGB(255, 124, 31, 88),
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 124, 31, 88),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage:
                      AssetImage('assets/profile_pic/profile_pic1.png'),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Hi, Tanjid",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "tanjid@example.com",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person,
                color: Color.fromARGB(255, 124, 31, 88)),
            title: const Text("Profile"),
            onTap: () {
              Navigator.pushNamed(context, '/profile'); // Navigate to Profile
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings,
                color: Color.fromARGB(255, 124, 31, 88)),
            title: const Text("Settings"),
            onTap: () {
              Navigator.pushNamed(context, '/settings'); // Navigate to Settings
            },
          ),
          ListTile(
            leading: const Icon(Icons.help_outline,
                color: Color.fromARGB(255, 124, 31, 88)),
            title: const Text("FAQ"),
            onTap: () {
              Navigator.pushNamed(context, '/faq'); // Navigate to FAQ
            },
          ),
          ListTile(
            leading: const Icon(Icons.info_outline,
                color: Color.fromARGB(255, 124, 31, 88)),
            title: const Text("About Us"),
            onTap: () {
              Navigator.pushNamed(context, '/about'); // Navigate to About Us
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout,
                color: Color.fromARGB(255, 124, 31, 88)),
            title: const Text("Logout"),
            onTap: () {
              Navigator.pushReplacementNamed(
                  context, '/'); // Navigate to WelcomeScreen
            },
          ),
        ],
      ),
    );
  }
}
