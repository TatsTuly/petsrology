import 'package:flutter/material.dart';
import 'package:petsrology/model/pets_model.dart';
import 'package:petsrology/adoption_screens/Detail/detail.dart';

class PetsHomeScreen extends StatefulWidget {
  const PetsHomeScreen({super.key});

  @override
  State<PetsHomeScreen> createState() => _PetsHomeScreenState();
}

class _PetsHomeScreenState extends State<PetsHomeScreen> {
  int selectedIndex = 0;

  final List<Color> themeColors = [
    Color(0xFFF9C8D9),
    Color(0xFFDCC6F0),
    Color(0xFFB1D1FF),
    Color(0xFFAF9EC4), // purple
    Color(0xFF5A3E8D), // dark purple
  ];

  @override
  Widget build(BuildContext context) {
    List<List<PetsModel>> categories = [cats, dogs, birds, other];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 22, top: 10, right: 22),
              child: Row(
                children: [
                  // Back button
                  GestureDetector(
                    onTap: () => Navigator.pushReplacementNamed(context, '/home'),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: themeColors[4].withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Color(0xFF5A3E8D),
                        size: 20,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  const CircleAvatar(
                    radius: 25,
                    backgroundImage:
                        AssetImage("assets/profile_pic/profile_pic1.png"),
                  ),
                  SizedBox(width: 5),
                  Text(
                    "Hi, Tanjid",
                    style: TextStyle(
                      fontWeight: FontWeight.bold, 
                      fontSize: 22,
                      fontFamily: "Playfair",
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.only(left: 22),
              child: Text.rich(
                TextSpan(
                  text: "Adopt\n",
                  style: TextStyle(
                    height: 1.1,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: "your pet's here!",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.normal,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            categorySelection(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 22, right: 10),
                child: ListView.builder(
                  itemCount: categories[selectedIndex].length,
                  itemBuilder: (context, index) {
                    final pet = categories[selectedIndex][index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(pets: pet),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: themeColors[1],
                                blurRadius: 10,
                                spreadRadius: 2,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                margin: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: pet.color,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Hero(
                                    tag: pet.image,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset(
                                        pet.image,
                                        fit: BoxFit.contain,
                                        width: 80,
                                        height: 80,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        pet.name,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: themeColors[4],
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        pet.breed,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey.shade700,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        "${pet.sex}, ${pet.age} year old",
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey.shade600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget categorySelection() {
    final List<Color> buttonColors = [
      const Color.fromARGB(255, 245, 142, 178),
      const Color.fromARGB(255, 204, 128, 254),
      const Color.fromARGB(255, 138, 184, 249),
      const Color.fromARGB(255, 255, 130, 220),
    ];

    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: ((context, index) {
          final isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 30, top: 10),
              child: Column(
                children: [
                  Container(
                    height: 80,
                    width: 75,
                    decoration: BoxDecoration(
                      color: buttonColors[index % buttonColors.length],
                      borderRadius: BorderRadius.circular(15),
                      border: isSelected
                          ? Border.all(
                              color: const Color(0xFF5A3E8D),
                              width: 2,
                            )
                          : null,
                    ),
                    child: Center(
                      child: Text(
                        categoryList[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: isSelected
                              ? const Color(0xFF5A3E8D)
                              : Colors.black87,
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.normal,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
