import 'package:flutter/material.dart';

class PetsHomeScreen extends StatefulWidget {
  const PetsHomeScreen({super.key});

  @override
  State<PetsHomeScreen> createState() => _PetsHomeScreenState();
}

class _PetsHomeScreenState extends State<PetsHomeScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(left: 22),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage("images/profile.png"),
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Hi Shafin",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 22),
              const Padding(
                padding: EdgeInsets.only(left: 22),
                child: Text.rich(
                  TextSpan(
                    text: "Adopt",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        text: "your pet's here!",
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryList.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30, top: 10),
                        child: Column(
                          children: [
                            Container(
                              height: 80,
                              width: 75,
                              decoration: BoxDecoration(
                                color:
                                    selectedIndex == index
                                        ? const Color(0xffFF9166)
                                        : const Color(
                                          0xffFF9166,
                                        ).withOpacity(0.1),
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        selectedIndex == index
                                            ? const Color(
                                              0xffFF9166,
                                            ).withOpacity(0.5)
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
                                    color:
                                        selectedIndex == index
                                            ? Colors.white
                                            : Colors.amber[900],
                                    fontWeight:
                                        selectedIndex == index
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                    fontSize: 18,
                                  ),
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
            ],
          ),
        ),
      ),
    );
  }
}
