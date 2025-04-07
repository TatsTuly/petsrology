import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F0F5),
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
                    icon: 'assets/logo/adoptlogo.png',
                    label: 'Adoption',
                    backgroundColor: Color.fromARGB(255, 253, 155, 188),
                    onTap: () => Navigator.pushNamed(context, '/home_screen'),
                  ),
                  _buildCategoryButton(
                    context,
                    icon: 'assets/vet.png',
                    label: 'Veterinary',
                    backgroundColor: Color.fromARGB(255, 150, 185, 251),
                    onTap: () => Navigator.pushNamed(context, '/veterinary'),
                  ),
                  _buildCategoryButton(
                    context,
                    icon: 'assets/care.png',
                    label: 'Pet Care',
                    backgroundColor: Color.fromARGB(255, 233, 154, 255),
                    onTap: () => Navigator.pushNamed(context, '/petcare'),
                  ),
                  _buildCategoryButton(
                    context,
                    icon: 'assets/essential.png',
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
                border: Border.all(color: const Color.fromARGB(255, 39, 35, 35)),
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