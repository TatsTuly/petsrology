import 'package:flutter/material.dart';

class ProductModel {
  String name;
  String category;
  String image;
  String price;
  String brand;
  String description;
  Color color;

  ProductModel({
    required this.name,
    required this.category,
    required this.image,
    required this.price,
    required this.brand,
    required this.description,
    required this.color,
  });

  get priceValue => null;

  get quantity => null;
}

List<ProductModel> petFood = [
  ProductModel(
    name: 'Whiskas Chicken',
    category: 'Cat Food',
    image: 'assets/product/catfood1.png',
    price: '\$5.99',
    brand: 'Whiskas',
    description:
        'Delicious chicken-flavored dry cat food with essential nutrients.',
    color: const Color(0xFFFDCEDF),
  ),
  ProductModel(
    name: 'Me-O Tuna',
    category: 'Cat Food',
    image: 'assets/product/catfood2.png',
    price: '\$4.49',
    brand: 'Me-O',
    description: 'Tuna-flavored wet food rich in vitamins and minerals.',
    color: const Color.fromARGB(255, 139, 192, 248),
  ),
  ProductModel(
    name: 'Royal Canin Indoor Adult Dry Cat Food',
    category: 'Cat Food',
    image: 'assets/product/catfood3.png',
    price: '\$24.99',
    brand: 'Royal Canin',
    description:
        'A specially formulated dry food for adult indoor cats to support their unique needs, with added fiber to help control hairballs and maintain healthy weight.',
    color: const Color.fromARGB(255, 228, 230, 123),
  ),
  ProductModel(
    name: 'Blue Buffalo Wilderness High-Protein, Natural Adult Dry Dog Food',
    category: 'Dog Food',
    image: 'assets/product/dogfood1.png',
    price: '\$50.99',
    brand: ' Blue Buffalo',
    description:
        'A high-protein dry dog food with chicken as the first ingredient, promoting lean muscle growth and energy while providing natural ingredients.',
    color: const Color.fromARGB(255, 231, 94, 158),
  ),
];

List<ProductModel> accessories = [
  ProductModel(
    name: 'Pet Collar',
    category: 'Accessories',
    image: 'assets/product/petcollar.png',
    price: '\$3.49',
    brand: 'PetZone',
    description: 'Durable and stylish collar for small to medium pets.',
    color: const Color(0xFFF4D3FF),
  ),
  ProductModel(
    name: 'Cat Bed',
    category: 'Accessories',
    image: 'assets/product/catbed.png',
    price: '\$15.00',
    brand: 'ComfyPets',
    description: 'Soft and cozy bed perfect for cats and small dogs.',
    color: const Color(0xFFC1FFD7),
  ),
];

List<ProductModel> medicine = [
  ProductModel(
    name: 'Deworming Syrup',
    category: 'Medicine',
    image: 'assets/product/deworming_syrup_kitten.png',
    price: '\$7.99',
    brand: 'VetCare',
    description: 'Effective deworming syrup for cats and dogs.',
    color: const Color(0xFFFFEABF),
  ),
  ProductModel(
    name: 'Flea & Tick Spray',
    category: 'Medicine',
    image: 'assets/product/flea_&_tick_spray.png',
    price: '\$9.99',
    brand: 'ShieldX',
    description: 'Protects pets from fleas and ticks for up to 30 days.',
    color: const Color(0xFFFFD6D6),
  ),
];

List<ProductModel> others = [
  ProductModel(
    name: 'Pet Shampoo',
    category: 'Others',
    image: 'assets/product/shampoo.png',
    price: '\$6.50',
    brand: 'FreshFur',
    description: 'Gentle shampoo with a pleasant scent for all pet types.',
    color: const Color(0xFFD1C4E9),
  ),
];

List<String> categoryList = ['Pet Food', 'Accessories', 'Medicine', 'Others'];
