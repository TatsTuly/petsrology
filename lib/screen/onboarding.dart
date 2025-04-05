import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final int _totalPages = 3;

  List<Widget> _buildPageIndicator() {
    return List<Widget>.generate(_totalPages, (int index) {
      return AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        height: 12,
        width: _currentPage == index ? 24 : 12,
        decoration: BoxDecoration(
          color: _currentPage == index ? const Color.fromARGB(255, 192, 1, 186) : Colors.grey,
          borderRadius: BorderRadius.circular(6),
        ),
      );
    });
  }

  void _onNextPressed() {
    if (_currentPage < _totalPages - 1) {
      _pageController.animateToPage(
        _currentPage + 1,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeIn,
      );
    } else {
      Navigator.pushNamed(context, '/loginscreen');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 7,
              child: PageView(
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                children: [
                  _buildPage(
                    imagePath: "assets/images/start2.png",
                    title: "Welcome to Petsrology",
                    description: "All types of services for your pet care in one place",
                  ),
                  _buildPage(
                    imagePath: "assets/images/start5Vet.png",
                    title: "Expert Veterinary Services",
                    description: "Connect with top vets for your pet's health",
                  ),
                  _buildPage(
                    imagePath: "assets/images/start3.png",
                    title: "Pet Care & Adoption",
                    description: "Pro tips for new pet-parents and easy adoption",
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildPageIndicator(),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: _currentPage != _totalPages - 1
                            ? const Color.fromARGB(255, 76, 3, 144)
                            : const Color.fromARGB(255, 76, 3, 144),
                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onPressed: _onNextPressed,
                      child: Text(
                        _currentPage != _totalPages - 1 ? 'Next' : 'Get Started',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage({required String imagePath, required String title, required String description}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 6,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          flex: 2,
          child: Column(
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
