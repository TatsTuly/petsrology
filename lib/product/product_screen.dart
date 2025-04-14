import 'package:flutter/material.dart';
import 'package:petsrology/product/product_model/product_model.dart';
import 'package:petsrology/product/product_details/product_details.dart';

class ProductsHomeScreen extends StatefulWidget {
  const ProductsHomeScreen({super.key});

  @override
  State<ProductsHomeScreen> createState() => _ProductsHomeScreen();
}

class _ProductsHomeScreen extends State<ProductsHomeScreen> {
  int selectedIndex = 0;

  final List<Color> themeColors = [
    Color(0xFFF9C8D9),
    Color(0xFFDCC6F0),
    Color(0xFFB1D1FF),
    Color(0xFFAF9EC4),
    Color(0xFF5A3E8D),
  ];
  
  // Convert price from $ to Tk (approximately 1$ = 112 Tk)
  String convertToTk(String dollarPrice) {
    // Remove the $ sign and convert to double
    final price = double.tryParse(dollarPrice.replaceAll('\$', '')) ?? 0.0;
    // Convert to Tk (approximately 112 Tk per dollar)
    final tkPrice = (price * 112).round();
    return 'Tk. $tkPrice';
  }

  @override
  Widget build(BuildContext context) {
    List<List<ProductModel>> categories = [
      petFood,
      accessories,
      medicine,
      others
    ];
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
                        AssetImage("assets/profile_pic/profile_pic2.png"),
                  ),
                  SizedBox(width: 5),
                  Text(
                    "Hi, Tuly",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.only(left: 22),
              child: Text.rich(
                TextSpan(
                  text: "Shop\n",
                  style: TextStyle(
                    height: 1.1,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: "your pet's essentials!",
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
                    final product = categories[selectedIndex][index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ProductDetails(products: product),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20, right: 10),
                        child: Container(
                          height: product.name.length > 25 ? 120 : 100, // Dynamic height based on product name length
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 90,
                                height: 90,
                                margin: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: product.color,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Hero(
                                    tag: product.image,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset(
                                        product.image,
                                        fit: BoxFit.contain,
                                        width: 70,
                                        height: 70,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.55),
                                        child: Text(
                                          product.name,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: themeColors[4],
                                            height: 1.2,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        product.brand,
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey.shade700,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        convertToTk(product.price),
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey.shade700,
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
    // Define category icons
    final List<IconData> categoryIcons = [
      Icons.food_bank_outlined, // For Pet Food
      Icons.pets_outlined, // For Accessories
      Icons.medication_outlined, // For Medicine
      Icons.more_horiz, // For Others
    ];

    // Define category colors similar to veterinary screen
    final List<Color> categoryColors = [
      const Color.fromARGB(255, 214, 108, 244), // Purple for Pet Food
      const Color.fromARGB(255, 228, 110, 149), // Pink for Accessories
      const Color.fromARGB(255, 131, 133, 235), // Blue for Medicine
      const Color.fromARGB(255, 133, 216, 235), // Teal for Others
    ];

    return Container(
      height: 112, // Slightly increased height to prevent any overflow
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: ((context, index) {
          final isSelected = selectedIndex == index;
          final color = categoryColors[index];
          
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10), // Slightly reduced horizontal margins
              width: 102, // Increased width by 2px to resolve overflow
              child: Card(
                margin: const EdgeInsets.all(0), // Ensure no extra margin from Card
                elevation: isSelected ? 4 : 0,
                shadowColor: color.withOpacity(0.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(
                    color: isSelected ? color : color.withOpacity(0.3),
                    width: isSelected ? 2 : 1,
                  ),
                ),
                color: isSelected ? color.withOpacity(0.2) : color.withOpacity(0.08),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 8), // Fine-tuned padding
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: color.withOpacity(0.2),
                        child: Icon(
                          categoryIcons[index],
                          color: color,
                          size: isSelected ? 22 : 20,
                        ),
                      ),
                      const SizedBox(height: 8),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          categoryList[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 13,
                            color: color,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
