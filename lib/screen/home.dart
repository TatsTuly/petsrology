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
                color: Color.fromARGB(255, 96, 2, 125), // Dark Purple Text
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
                    icon: 'assets/adoption.png',
                    label: 'Adoption',
                    gradientColors: [Color(0xFFFFC1E3), Color(0xFFF48FB1)],
                    onTap: () => Navigator.pushNamed(context, '/home_screen'),
                  ),
                  _buildCategoryButton(
                    context,
                    icon: 'assets/vet.png',
                    label: 'Veterinary',
                    gradientColors: [Color.fromARGB(255, 66, 223, 255), Color(0xFF7E57C2)],
                    onTap: () => Navigator.pushNamed(context, '/veterinary'),
                  ),
                  _buildCategoryButton(
                    context,
                    icon: 'assets/care.png',
                    label: 'Pet Care',
                    gradientColors: [Color.fromARGB(255, 47, 161, 255), Color(0xFF29B6F6)],
                    onTap: () => Navigator.pushNamed(context, '/petcare'),
                  ),
                  _buildCategoryButton(
                    context,
                    icon: 'assets/essential.png',
                    label: 'Essentials',
                    gradientColors: [Color.fromARGB(255, 208, 87, 255), Color(0xFF512DA8)],
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
    required List<Color> gradientColors,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
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
            Image.asset(icon, height: 50),
            const SizedBox(height: 10),
            Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
