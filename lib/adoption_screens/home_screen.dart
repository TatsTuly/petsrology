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
@override
Widget build(BuildContext context) {
  List<List<PetsModel>> categories = [cats, dogs, birds, other];
  return Scaffold(
    backgroundColor: Colors.white,
    body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Section
          const Padding(
            padding: EdgeInsets.only(left: 22, top: 10),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage("images/profile.png"),
                ),
                SizedBox(width: 5),
                Text(
                  "Hi, Abin",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          // Title Section
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
          // Category Selection
          categorySelection(),
          // Pet List
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 22),
              child: ListView.builder(
                itemCount: categories[selectedIndex].length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            pets: categories[selectedIndex][index],
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, right: 15),
                      child: Row(
                        children: [
                          // Pet Image Section
                          Container(
                            width: 100, // Adjusted width
                            height: 100, // Adjusted height
                            decoration: BoxDecoration(
                              color: categories[selectedIndex][index].color,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Hero(
                                tag: categories[selectedIndex][index].image,
                                child: Image.asset(
                                  categories[selectedIndex][index].image,
                                  fit: BoxFit.cover,
                                  width: 80, // Adjusted width
                                  height: 80, // Adjusted height
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          // Pet Details Section
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: categories[selectedIndex][index]
                                    .color
                                    .withOpacity(0.2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    categories[selectedIndex][index].name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    categories[selectedIndex][index].breed,
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    "${categories[selectedIndex][index].sex}, ${categories[selectedIndex][index].age} year old",
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
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

  SizedBox categorySelection() {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: ((context, index) {
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
                      color: selectedIndex == index
                          ? const Color(0xffFF9166)
                          : const Color(0xffFF9166).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: selectedIndex == index
                              ? const Color(0xffFF9166).withOpacity(0.5)
                              : Colors.transparent,
                          blurRadius: 12,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        categoryList[index],
                        style: TextStyle(
                            color: selectedIndex == index
                                ? Colors.white
                                : Colors.amber[900],
                            fontWeight: selectedIndex == index
                                ? FontWeight.bold
                                : FontWeight.normal,
                            fontSize: 18),
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