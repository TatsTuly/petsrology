import 'package:flutter/material.dart';

class PetCareTipsScreen extends StatelessWidget {
  const PetCareTipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text(
          "Pet Care Tips",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 124, 31, 88),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Center(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 240, 158, 194).withOpacity(0.7),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    "Essential Care Tips for Your Pets",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 10, 10, 10),
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Pet Categories
              _buildPetCategorySection(
                context,
                title: "Dog Care",
                color: const Color(0xFFB1D1FF),
                icon: Icons.pets,
                tips: [
                  "Regular Veterinary Check-ups: Schedule annual wellness exams.",
                  "Balanced Diet: Feed high-quality dog food appropriate for age, size, and activity level.",
                  "Daily Exercise: Provide at least 30 minutes to 2 hours of activity daily.",
                  "Dental Care: Brush teeth 2-3 times weekly and provide dental chews.",
                  "Grooming: Regular brushing and bathing every 1-3 months.",
                  "Training & Socialization: Start early with basic commands and proper socialization.",
                ],
              ),
              
              const SizedBox(height: 20),
              
              _buildPetCategorySection(
                context,
                title: "Cat Care",
                color: const Color(0xFFF9C8D9),
                icon: Icons.pets,
                tips: [
                  "Regular Veterinary Visits: Annual check-ups and vaccinations.",
                  "Proper Nutrition: High-quality cat food with appropriate protein levels.",
                  "Fresh Water: Always provide clean, fresh water daily.",
                  "Litter Box Maintenance: Clean daily and change litter weekly.",
                  "Mental Stimulation: Provide toys, scratching posts, and play time.",
                  "Grooming: Brush 1-2 times weekly to reduce hairballs.",
                  "Indoor Safety: Keep toxic plants and dangerous items out of reach.",
                ],
              ),
              
              const SizedBox(height: 20),
              
              _buildPetCategorySection(
                context,
                title: "Bird Care",
                color: const Color(0xFFDCC6F0),
                icon: Icons.flutter_dash,
                tips: [
                  "Proper Cage Size: Ensure your bird has enough space to move freely.",
                  "Varied Diet: Offer pellets, fresh fruits, vegetables, and occasional seeds.",
                  "Clean Water Daily: Change water and clean dishes regularly.",
                  "Regular Cage Cleaning: Deep clean the cage weekly.",
                  "Social Interaction: Spend time talking to and playing with your bird daily.",
                  "Environmental Enrichment: Provide toys, perches of different sizes, and safe materials to chew.",
                  "Avoid Toxins: Keep birds away from teflon pans, scented candles, and toxic houseplants.",
                ],
              ),
              
              const SizedBox(height: 24),
              
              // General Care Section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 124, 31, 88).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.health_and_safety_outlined,
                            color: Color.fromARGB(255, 124, 31, 88),
                            size: 30,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Text(
                            "General Health Essentials",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 124, 31, 88),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _buildHealthTip(
                      "Vaccinations",
                      "Keep all vaccinations up to date according to your vet's recommendations.",
                      Icons.medical_services_outlined,
                    ),
                    _buildHealthTip(
                      "Parasite Control",
                      "Regular flea, tick, and worm prevention is essential for all pets.",
                      Icons.bug_report_outlined,
                    ),
                    _buildHealthTip(
                      "Spay/Neuter",
                      "Consider spaying or neutering your pet for health and behavioral benefits.",
                      Icons.content_cut,
                    ),
                    _buildHealthTip(
                      "Emergency Plan",
                      "Keep your vet's contact information and the nearest emergency clinic handy.",
                      Icons.emergency_outlined,
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Expert Tip
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color.fromARGB(255, 124, 31, 88).withOpacity(0.7),
                      const Color.fromARGB(255, 124, 31, 88).withOpacity(0.9),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Icon(
                          Icons.lightbulb_outline,
                          color: Colors.white,
                          size: 28,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Expert Tip",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Spend at least 15-30 minutes each day bonding with your pet. This dedicated time strengthens your relationship and allows you to notice any changes in behavior or health early.",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPetCategorySection(
    BuildContext context, {
    required String title,
    required Color color,
    required IconData icon,
    required List<String> tips,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ExpansionTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.3),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            color: const Color.fromARGB(255, 124, 31, 88),
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 124, 31, 88),
          ),
        ),
        backgroundColor: Colors.white,
        collapsedBackgroundColor: Colors.white,
        childrenPadding: const EdgeInsets.all(16),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        children: tips.map((tip) => _buildTipItem(tip)).toList(),
      ),
    );
  }

  Widget _buildTipItem(String tip) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.check_circle,
            color: Color.fromARGB(255, 124, 31, 88),
            size: 20,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              tip,
              style: const TextStyle(
                fontSize: 14,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHealthTip(String title, String description, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 182, 226, 239).withOpacity(0.3),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: const Color.fromARGB(255, 124, 31, 88),
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 124, 31, 88),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}